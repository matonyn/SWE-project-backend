from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from market .models import Product, Category
from .serializers import CategorySerializer, ProductSerializer, BuyerRegistrationSerializer, FarmerRegistrationSerializer
from rest_framework.parsers import JSONParser
from rest_framework.permissions import AllowAny

class ProductCategoryView(APIView):
    permission_classes = [AllowAny]

    def get(self, request):
        categories = Category.objects.prefetch_related('product_set')
        serializer = CategorySerializer(categories, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

class ProductDetailView(APIView):
    permission_classes = [AllowAny]
    def get(self, request, product_id):
        try:
            product = Product.objects.get(product_id=product_id)
            serializer = ProductSerializer(product)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except Product.DoesNotExist:
            return Response({"error": "Product not found"}, status=status.HTTP_404_NOT_FOUND)

class FarmerProductCategoryView(APIView):
    permission_classes = [AllowAny]
    def get(self, request):
        categories = Category.objects.prefetch_related('product_set')
        serializer = CategorySerializer(categories, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

from rest_framework.parsers import MultiPartParser, FormParser

class ProductCreateView(APIView):
    parser_classes = [MultiPartParser, FormParser]
    permission_classes = [AllowAny] 

    def post(self, request):
        data = request.data
        serializer = ProductSerializer(data=data)  
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class ProductUpdateView(APIView):
    permission_classes = [AllowAny]
    
    def put(self, request, product_id, *args, **kwargs):
        try:
            product = Product.objects.get(product_id=product_id)  # Retrieve the product
            serializer = ProductSerializer(product, data=request.data)  # Pass data for update
            
            if serializer.is_valid():  # Validate the serializer
                serializer.save()  # Save the updated product
                return Response(serializer.data, status=status.HTTP_200_OK)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        
        except Product.DoesNotExist:
            return Response({"error": "Product not found"}, status=status.HTTP_404_NOT_FOUND)

class ProductDeleteView(APIView):
    permission_classes = [AllowAny]

    def delete(self, request, product_id):
        try:
            product = Product.objects.get(product_id=product_id)  # Try to find the product
            product.delete()  # Delete the product
            return Response({"message": "Product deleted successfully"}, status=status.HTTP_204_NO_CONTENT)
        except Product.DoesNotExist:  # If the product does not exist
            return Response({"error": "Product not found"}, status=status.HTTP_404_NOT_FOUND)


class ProductPhotoDeleteView(APIView):
    permission_classes = [AllowAny]
    def delete(self, request, product_id):
        try:
            product = Product.objects.get(product_id=product_id)
            product.photo = None
            product.save()
            return Response({"message": "Product photo deleted successfully"}, status=status.HTTP_204_NO_CONTENT)
        except Product.DoesNotExist:
            return Response({"error": "Product not found"}, status=status.HTTP_404_NOT_FOUND)

class ProductDescriptionDeleteView(APIView):
    permission_classes = [AllowAny]
    def delete(self, request, product_id):
        try:
            product = Product.objects.get(product_id=product_id)
            product.description = ""
            product.save()
            return Response({"message": "Product description deleted successfully"}, status=status.HTTP_204_NO_CONTENT)
        except Product.DoesNotExist:
            return Response({"error": "Product not found"}, status=status.HTTP_404_NOT_FOUND)

class BuyerRegistrationView(APIView):
    permission_classes = [AllowAny]
    
    def post(self, request):
        serializer = BuyerRegistrationSerializer(data=request.data)  # DRF automatically parses the data
        if serializer.is_valid():
            serializer.save()  # Save buyer information to the database
            return Response({"message": "Buyer registered successfully"}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class FarmerRegistrationView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = FarmerRegistrationSerializer(data=request.data)  # DRF automatically parses the data
        if serializer.is_valid():
            serializer.save()  # Save farmer information to the database
            return Response({"message": "Farmer registered successfully"}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)