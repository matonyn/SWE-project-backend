from django.shortcuts import render, redirect
from rest_framework.response import Response
from django.contrib.auth.models import User, auth
from django.contrib.auth import authenticate
from rest_framework.decorators import api_view
from .models import Farmer, Buyer, ContactData, Farm, BuyerContactData, Admin
from django.contrib import messages
from django.views.decorators.csrf import csrf_exempt

# Create your views here.

def admin_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = auth.authenticate(username=username, password=password)

        if user is not None:
            auth.login(request, user)
            return redirect('admin_panel')
        else:
            messages.info(request, 'Invalid username or password')
            return redirect('login')
        
    return render(request, 'login.html')
    
@csrf_exempt
def approve_farmer(request, farmer_id):
    farmer = Farmer.objects.get(farmer_id=farmer_id)
    farmer.farmer_status = 'Approved'
    farmer.save()
    return redirect('admin_panel')

@csrf_exempt
def reject_farmer(request, farmer_id):
    farmer = Farmer.objects.get(farmer_id=farmer_id)
    farmer.farmer_status = 'Rejected'
    farmer.save()
    return redirect('admin_panel')

def admin_panel(request):
    if not request.user.is_authenticated:
        messages.info(request, 'You are not authorized to view this page')
        return redirect('login')
    else:
        farmers = Farmer.objects.filter(farmer_status='Pending')
        updated_farmers = []

        for farmer in farmers:
            contact_data = ContactData.objects.filter(farmer_id=farmer.farmer_id).first()
            farm = Farm.objects.filter(farmer_id=farmer.farmer_id).first()
            
            farmer.farmer_number = contact_data.mobile_phone if contact_data else None
            farmer.farm_name = farm.farm_name if farm else None
            farmer.farm_size = farm.farm_size if farm else None
            farmer.farm_address = farm.farm_address if farm else None
            
            updated_farmers.append(farmer)

        users = Buyer.objects.all()
        updated_users = []

        for user in users:
            contact_data = BuyerContactData.objects.filter(buyer_id=user.buyer_id).first()
            
            user.user_id = user.buyer_id
            user.user_name = user.buyer_name
            user.user_type = 'Buyer'
            user.user_number = contact_data.mobile_phone if contact_data else None
            user.activity_status = user.activity_status
            
            updated_users.append(user)
    
        new_farmer = Farmer.objects.all()

        for f in new_farmer:
            contact_data = ContactData.objects.filter(farmer_id=f.farmer_id).first()
            f.user_id = f.farmer_id
            f.user_name = f.farmer_name
            f.user_type = 'Farmer'
            f.user_number = contact_data.mobile_phone if contact_data else None
            f.activity_status = f.activity_status

            updated_users.append(f)

        return render(request, 'admin_page.html', {'farmers': updated_farmers, 'users': updated_users})

def search(request):
    query = request.GET.get('query')
    farmers = Farmer.objects.filter(farmer_status='Pending')
    updated_farmers = []

    for farmer in farmers:
        contact_data = ContactData.objects.filter(farmer_id=farmer.farmer_id).first()
        farm = Farm.objects.filter(farmer_id=farmer.farmer_id).first()
        
        farmer.farmer_number = contact_data.mobile_phone if contact_data else None
        farmer.farm_name = farm.farm_name if farm else None
        farmer.farm_size = farm.farm_size if farm else None
        farmer.farm_address = farm.farm_address if farm else None
        
        updated_farmers.append(farmer)
    
    users = Buyer.objects.filter(buyer_name__icontains=query)
    updated_users = []

    for user in users:
        contact_data = BuyerContactData.objects.filter(buyer_id=user.buyer_id).first()
        
        user.user_id = user.buyer_id
        user.user_name = user.buyer_name
        user.user_type = 'Buyer'
        user.user_number = contact_data.mobile_phone if contact_data else None
        user.activity_status = user.activity_status
        
        updated_users.append(user)
  
    farmers = Farmer.objects.filter(farmer_name__icontains=query)

    for f in farmers:
        contact_data = ContactData.objects.filter(farmer_id=f.farmer_id).first()
        f.user_id = f.farmer_id
        f.user_name = f.farmer_name
        f.user_type = 'Farmer'
        f.user_number = contact_data.mobile_phone if contact_data else None
        f.activity_status = f.activity_status

        updated_users.append(f)


    return render(request, 'admin_page.html', {'farmers': updated_farmers, 'users': updated_users})

def elements(request):
    return render(request, 'elements.html')

def update_farmer_status(request, farmer_id):
    farmer = Farmer.objects.get(farmer_id=farmer_id)
    contact_data = ContactData.objects.filter(farmer_id=farmer.farmer_id).first()
    farm = Farm.objects.filter(farmer_id=farmer.farmer_id).first()
        
    farmer.farmer_number = contact_data.mobile_phone if contact_data else None
    farmer.farm_name = farm.farm_name if farm else None
    farmer.farm_size = farm.farm_size if farm else None
    farmer.farm_address = farm.farm_address if farm else None

    return render(request, 'update_status.html', {'farmer': farmer})

def change_buyer_status(request, buyer_id):
    buyer = Buyer.objects.get(buyer_id=buyer_id)
    contact_data = BuyerContactData.objects.filter(buyer_id=buyer.buyer_id).first()
        
    buyer.buyer_id = buyer.buyer_id
    buyer.user_name = buyer.buyer_name
    buyer.buyer_rating = buyer.buyer_rating
    buyer.total_orders = buyer.total_orders
    buyer.prefferred_delivery_type  = buyer.prefferred_delivery_type 
    buyer.user_type = 'Buyer'
    buyer.email = contact_data.email  if contact_data else None
    buyer.mobile_phone = contact_data.mobile_phone if contact_data else None
    buyer.telegram_id = contact_data.telegram_id if contact_data else None
    buyer.mobile_phone = contact_data.mobile_phone if contact_data else None
    buyer.activity_status = buyer.activity_status

    return render(request, 'buyer.html', {'buyer': buyer})

def change_farmer_status(request, farmer_id):
    farmer = Farmer.objects.get(farmer_id=farmer_id)
    contact_data = ContactData.objects.filter(farmer_id=farmer.farmer_id).first()
    farm = Farm.objects.filter(farmer_id=farmer.farmer_id).first()
        
    farmer.farmer_number = contact_data.mobile_phone if contact_data else None
    farmer.farm_name = farm.farm_name if farm else None
    farmer.farm_size = farm.farm_size if farm else None
    farmer.farm_address = farm.farm_address if farm else None
    farmer.farmer_location = farmer.location
    farmer.email = contact_data.email if contact_data else None
    farmer.mobile_phone = contact_data.mobile_phone if contact_data else None
    farmer.telegram_id = contact_data.telegram_id if contact_data else None

    return render(request, 'farmer.html', {'farmer': farmer})

def delete_farmer(request, farmer_id):
    farmer = Farmer.objects.get(farmer_id=farmer_id)
    if request.method == 'POST':
        farmer.delete()
        return redirect('admin_panel')
    return render(request, 'farmer.html', {'farmer': farmer})

def delete_buyer(request, buyer_id):
    buyer = Buyer.objects.get(buyer_id=buyer_id)
    if request.method == 'POST':
        buyer.delete()
        return redirect('admin_panel')
    return render(request, 'buyer.html', {'user': buyer})

