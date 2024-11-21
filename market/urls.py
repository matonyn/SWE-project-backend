from django.urls import path
from . import views

urlpatterns = [
    path('', views.admin_panel, name='admin_panel'),
    path('search/', views.search, name='search'),
    path('elements/', views.elements, name='elements'),
    path('update_farmer_status/<int:farmer_id>/', views.update_farmer_status, name='update_status'),
    path('change_user_status/<int:buyer_id>/', views.change_buyer_status, name='change_buyer_status'),
    path('change_farmer_status/<int:farmer_id>/', views.change_farmer_status, name='change_farmer_status'),
]
