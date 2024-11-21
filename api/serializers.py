from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import serializers
from market.models import Farmer, Buyer, ContactData, Farm, BuyerContactData, Product, Category

class BuyerContactDataSerializer(serializers.ModelSerializer):
    class Meta:
        model = BuyerContactData
        fields = '__all__'

class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ['product_id', 'product_name', 'price', 'available_quantity', 'description', 'farm_id', 'date_added', 'photo']
        # Make sure 'photo' is listed here if it represents the image URL or file path

class CategorySerializer(serializers.ModelSerializer):
    products = ProductSerializer(many=True, read_only=True, source='product_set')

    class Meta:
        model = Category
        fields = ['category_name', 'products']


class BuyerRegistrationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Buyer
        fields = ['buyer_name', 'buyer_rating', 'total_orders', 'prefferred_delivery_type', 'activity_status']

class FarmerRegistrationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Farmer
        fields = ['farmer_name', 'niche', 'total_sold', 'farmer_rating', 'contact_dataid', 'farmer_status', 'activity_status']
