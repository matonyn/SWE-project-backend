from django.shortcuts import render, redirect
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Farmer, Buyer, ContactData, Farm, BuyerContactData

# Create your views here.

def admin_panel(request):
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
        
    buyer.user_id = buyer.buyer_id
    buyer.user_name = buyer.buyer_name
    buyer.user_type = 'Buyer'
    buyer.user_number = contact_data.mobile_phone if contact_data else None
    buyer.activity_status = buyer.activity_status

    return render(request, 'buyer.html', {'user': buyer})

def change_farmer_status(request, farmer_id):
    farmer = Farmer.objects.get(farmer_id=farmer_id)
    contact_data = ContactData.objects.filter(farmer_id=farmer.farmer_id).first()
    farm = Farm.objects.filter(farmer_id=farmer.farmer_id).first()
        
    farmer.farmer_number = contact_data.mobile_phone if contact_data else None
    farmer.farm_name = farm.farm_name if farm else None
    farmer.farm_size = farm.farm_size if farm else None
    farmer.farm_address = farm.farm_address if farm else None

    return render(request, 'farmer.html', {'farmer': farmer})