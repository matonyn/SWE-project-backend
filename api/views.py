from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from market .models import Product, Category
from .serializers import CategorySerializer, ProductSerializer, BuyerRegistrationSerializer, FarmerRegistrationSerializer
from rest_framework.parsers import JSONParser

class ProductCategoryView(APIView):
    def get(self, request):
        categories = Category.objects.prefetch_related('product_set')
        serializer = CategorySerializer(categories, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

class ProductDetailView(APIView):
    def get(self, request, product_id):
        try:
            product = Product.objects.get(product_id=product_id)
            serializer = ProductSerializer(product)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except Product.DoesNotExist:
            return Response({"error": "Product not found"}, status=status.HTTP_404_NOT_FOUND)

class FarmerProductCategoryView(APIView):
    def get(self, request):
        categories = Category.objects.prefetch_related('product_set')
        serializer = CategorySerializer(categories, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

from rest_framework.parsers import MultiPartParser, FormParser

class ProductCreateView(APIView):
    parser_classes = [MultiPartParser, FormParser] 

    def post(self, request):
        data = JSONParser().parse(request)
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class ProductUpdateView(APIView):
    def put(self, request, product_id, *args, **kwargs):
        try:
            data = JSONParser().parse(request)
            product = Product.objects.get(product_id=product_id)
            serializer = ProductSerializer(product, data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_200_OK)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except Product.DoesNotExist:
            return Response({"error": "Product not found"}, status=status.HTTP_404_NOT_FOUND)

class ProductDeleteView(APIView):
    def delete(self, request, product_id):
        try:
            product = Product.objects.get(product_id=product_id)
            product.delete()
            return Response({"message": "Product deleted successfully"}, status=status.HTTP_204_NO_CONTENT)
        except Product.DoesNotExist:
            return Response({"error": "Product not found"}, status=status.HTTP_404_NOT_FOUND)

class ProductPhotoDeleteView(APIView):
    def delete(self, request, product_id):
        try:
            product = Product.objects.get(product_id=product_id)
            product.photo = None
            product.save()
            return Response({"message": "Product photo deleted successfully"}, status=status.HTTP_204_NO_CONTENT)
        except Product.DoesNotExist:
            return Response({"error": "Product not found"}, status=status.HTTP_404_NOT_FOUND)

class ProductDescriptionDeleteView(APIView):
    def delete(self, request, product_id):
        try:
            product = Product.objects.get(product_id=product_id)
            product.description = ""
            product.save()
            return Response({"message": "Product description deleted successfully"}, status=status.HTTP_204_NO_CONTENT)
        except Product.DoesNotExist:
            return Response({"error": "Product not found"}, status=status.HTTP_404_NOT_FOUND)

class BuyerRegistrationView(APIView):
    def post(self, request):
        data = JSONParser().parse(request)
        serializer = BuyerRegistrationSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()  # Save buyer information to the database
            return Response({"message": "Buyer registered successfully"}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class FarmerRegistrationView(APIView):
    def post(self, request):
        data = JSONParser().parse(request)
        serializer = FarmerRegistrationSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()  # Save farmer information to the database
            return Response({"message": "Farmer registered successfully"}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)