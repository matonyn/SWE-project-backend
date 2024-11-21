from django.contrib import admin

# Register your models here.

from .models import Farmer, Product, Buyer, BuyerContactData, ContactData, Delivery, DeliveryAddresses, FarmContactData, Farm, Includes, Orders, OrderingAddresses, Payment, SoldTo, Category

admin.site.register(Farmer)
admin.site.register(Product)
admin.site.register(Buyer)
admin.site.register(BuyerContactData)
admin.site.register(ContactData)
admin.site.register(Delivery)
admin.site.register(DeliveryAddresses)
admin.site.register(FarmContactData)
admin.site.register(Farm)
admin.site.register(Includes)
admin.site.register(Orders)
admin.site.register(OrderingAddresses)
admin.site.register(Payment)
admin.site.register(SoldTo)
admin.site.register(Category)