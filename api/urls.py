from django.urls import path
from .views import (
    ProductCategoryView, ProductDetailView, FarmerProductCategoryView,
    ProductCreateView, ProductUpdateView, ProductDeleteView,
    ProductPhotoDeleteView, ProductDescriptionDeleteView, 
    BuyerRegistrationView, FarmerRegistrationView
)

urlpatterns = [
    path('api/buyer/products/', ProductCategoryView.as_view(), name='buyer-products'),
    path('api/buyer/product/<int:product_id>/', ProductDetailView.as_view(), name='buyer-product-detail'),
    path('api/farmer/products/', FarmerProductCategoryView.as_view(), name='farmer-products'),
    path('api/farmer/product/', ProductCreateView.as_view(), name='farmer-product-create'),
    path('api/farmer/product/<int:product_id>/', ProductUpdateView.as_view(), name='farmer-product-update'),
    path('api/farmer/product/<int:product_id>/delete/', ProductDeleteView.as_view(), name='farmer-product-delete'),
    path('api/farmer/product/<int:product_id>/delete-photo/', ProductPhotoDeleteView.as_view(), name='product-photo-delete'),
    path('api/farmer/product/<int:product_id>/delete-description/', ProductDescriptionDeleteView.as_view(), name='product-description-delete'),
    path('api/register/buyer/', BuyerRegistrationView.as_view(), name='buyer-registration'),
    path('api/register/farmer/', FarmerRegistrationView.as_view(), name='farmer-registration'),

]
