from django.urls import path
from . import views

urlpatterns = [
    path('', views.admin_login, name='login'),
    path('admin_panel', views.admin_panel, name='admin_panel'),
    path('search/', views.search, name='search'),
    path('elements/', views.elements, name='elements'),
    path('update_farmer_status/<int:farmer_id>/', views.update_farmer_status, name='update_status'),
    path('change_user_status/<int:buyer_id>/', views.change_buyer_status, name='change_buyer_status'),
    path('change_farmer_status/<int:farmer_id>/', views.change_farmer_status, name='change_farmer_status'),
    path('approve_farmer/<int:farmer_id>/', views.approve_farmer, name='approve_farmer'),
    path('reject_farmer/<int:farmer_id>/', views.reject_farmer, name='reject_farmer'),
    path('delete_farmer/<int:farmer_id>/', views.delete_farmer, name='delete_farmer'),
    path('delete_buyer/<int:buyer_id>/', views.delete_buyer, name='delete_buyer'),
]
