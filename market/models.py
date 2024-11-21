from django.db import models

class Category(models.Model):
    category_id = models.AutoField(db_column='category_id', primary_key=True)
    category_name = models.CharField(db_column='category_name', max_length=255)

    class Meta:
        managed = False
        db_table = 'Category'

class Admin(models.Model):
    admin_id = models.AutoField(db_column='AdminID', primary_key=True)
    admin_name = models.CharField(db_column='AdminName', max_length=255)
    admin_email = models.CharField(db_column='AdminEmail', max_length=255)
    admin_password = models.CharField(db_column='AdminPassword', max_length=255)

    class Meta:
        managed = False
        db_table = 'Admin'

class Buyer(models.Model):
    buyer_id = models.AutoField(db_column='BuyerID', primary_key=True)
    buyer_name = models.CharField(db_column='BuyerName', max_length=255)
    buyer_rating = models.DecimalField(db_column='Buyer_rating', max_digits=2, decimal_places=1, blank=True, null=True)
    total_orders = models.IntegerField(db_column='Total_orders', blank=True, null=True)
    prefferred_delivery_type = models.CharField(db_column='Prefferred_delivery_type', max_length=255, blank=True, null=True)
    activity_status = models.IntegerField(db_column='ActivityStatus', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Buyer'


class BuyerContactData(models.Model):
    contact_data_id = models.AutoField(db_column='Contact_dataID', primary_key=True)
    email = models.CharField(db_column='Email', max_length=255, blank=True, null=True)
    mobile_phone = models.CharField(db_column='Mobile_phone', max_length=255, blank=True, null=True)
    telegram_id = models.CharField(db_column='Telegram_ID', max_length=255, blank=True, null=True)
    buyer_id = models.OneToOneField(Buyer, models.DO_NOTHING, db_column='BuyerID', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Buyer_Contact_data'


class ContactData(models.Model):
    farmer_id = models.OneToOneField('Farmer', models.DO_NOTHING, db_column='FarmerID', blank=True, null=True)
    contact_data_id = models.AutoField(db_column='Contact_dataID', primary_key=True)
    email = models.CharField(db_column='Email', max_length=255, blank=True, null=True)
    mobile_phone = models.CharField(db_column='Mobile_phone', max_length=255, blank=True, null=True)
    telegram_id = models.CharField(db_column='Telegram_ID', max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Contact_data'


class Delivery(models.Model):
    order_id = models.OneToOneField('Orders', models.DO_NOTHING, db_column='OrderID', primary_key=True)
    delivery_type = models.CharField(db_column='Delivery_type', max_length=255, blank=True, null=True)
    delivery_route = models.CharField(db_column='Delivery_route', max_length=255, blank=True, null=True)
    delivery_address = models.CharField(db_column='Delivery_address', max_length=255)
    delivery_duration = models.CharField(db_column='Delivery_duration', max_length=255, blank=True, null=True)
    delivery_implementer = models.CharField(db_column='Delivery_implementer', max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Delivery'
        unique_together = (('order_id', 'delivery_address'),)


class DeliveryAddresses(models.Model):
    farmer_id = models.ForeignKey('Farmer', models.DO_NOTHING, db_column='FarmerID', blank=True, null=True)
    ordering_address = models.CharField(db_column='Ordering_Address', max_length=255, blank=True, null=True)
    delivery_id = models.IntegerField(db_column='Delivery_id', blank=True, primary_key=True)

    class Meta:
        managed = False
        db_table = 'Delivery_Addresses'


class Farm(models.Model):
    farm_id = models.AutoField(db_column='FarmID', primary_key=True)
    farm_name = models.CharField(db_column='FarmName', max_length=255)
    product_types = models.CharField(db_column='Product_types', max_length=255, blank=True, null=True)
    working_hours = models.CharField(db_column='Working_Hours', max_length=255, blank=True, null=True)
    farmer_id = models.ForeignKey('Farmer', models.DO_NOTHING, db_column='FarmerID', blank=True, null=True)
    farm_address = models.CharField(db_column='FarmAddress', max_length=255, blank=True, null=True)
    farm_size = models.IntegerField(db_column='FarmSize')

    class Meta:
        managed = False
        db_table = 'Farm'


class FarmContactData(models.Model):
    farm_id = models.OneToOneField(Farm, models.DO_NOTHING, db_column='FarmID', blank=True, null=True)
    contact_data_id = models.AutoField(db_column='Contact_dataID', primary_key=True)
    email = models.CharField(db_column='Email', max_length=255, blank=True, null=True)
    mobile_phone = models.CharField(db_column='Mobile_phone', max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Farm_Contact_data'


class Farmer(models.Model):
    farmer_id = models.AutoField(db_column='FarmerID', primary_key=True)
    farmer_name = models.CharField(db_column='FarmerName', max_length=255)
    niche = models.CharField(db_column='Niche', max_length=255, blank=True, null=True)
    total_sold = models.IntegerField(db_column='Total_sold', blank=True, null=True)
    farmer_rating = models.IntegerField(db_column='Farmer_Rating', blank=True, null=True)
    contact_dataid = models.IntegerField(db_column='Contact_dataID', blank=True, null=True)
    farmer_status = models.CharField(db_column='FarmerStatus', max_length=255, blank=True, null=True)
    activity_status = models.IntegerField(db_column='ActivityStatus', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Farmer'


class Includes(models.Model):
    order_id = models.OneToOneField('Orders', models.DO_NOTHING, db_column='OrderID', primary_key=True)
    product_id = models.ForeignKey('Product', models.DO_NOTHING, db_column='ProductID')

    class Meta:
        managed = False
        db_table = 'Includes'
        unique_together = (('order_id', 'product_id'),)


class OrderingAddresses(models.Model):
    farmer_id = models.ForeignKey(Farmer, models.DO_NOTHING, db_column='FarmerID', blank=True, null=True)
    ordering_address = models.CharField(db_column='Ordering_Address', max_length=255, blank=True, null=True)
    order_id = models.IntegerField(db_column='Order_id', blank=True, primary_key= True)

    class Meta:
        managed = False
        db_table = 'Ordering_Addresses'


class Orders(models.Model):
    order_id = models.AutoField(db_column='OrderID', primary_key=True)
    buyer_id = models.ForeignKey(Buyer, models.DO_NOTHING, db_column='BuyerID')
    product_id = models.ForeignKey('Product', models.DO_NOTHING, db_column='ProductID')
    discount_amount = models.IntegerField(db_column='Discount_amount', blank=True, null=True)
    order_comments = models.CharField(db_column='Order_comments', max_length=255, blank=True, null=True)
    total_price = models.DecimalField(db_column='Total_price', max_digits=10, decimal_places=2, blank=True, null=True)
    order_timestamp = models.DateTimeField(db_column='Order_timeStamp', blank=True, null=True)
    order_status = models.CharField(db_column='Order_status', max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Orders'


class Payment(models.Model):
    payment_id = models.AutoField(db_column='PaymentID', primary_key=True)
    order_id = models.OneToOneField(Orders, models.DO_NOTHING, db_column='OrderID')
    payment_type = models.CharField(db_column='Payment_type', max_length=255, blank=True, null=True)
    payment_timestamp = models.DateTimeField(db_column='Payment_timestamp', blank=True, null=True)
    payment_amount = models.DecimalField(db_column='Payment_amount', max_digits=10, decimal_places=2, blank=True, null=True)
    payment_status = models.CharField(db_column='Payment_status', max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Payment'


class Product(models.Model):
    category_id = models.ForeignKey(Category, models.DO_NOTHING, db_column='category_id', blank=True, null=True)
    product_id = models.AutoField(db_column='ProductID', primary_key=True)
    product_name = models.CharField(db_column='ProductName', max_length=255)
    available_quantity = models.IntegerField(db_column='Available_quantity', blank=True, null=True)
    price = models.IntegerField(db_column='Price', blank=True, null=True)
    product_type = models.CharField(db_column='Product_type', max_length=255, blank=True, null=True)
    product_rating = models.DecimalField(db_column='Product_rating', max_digits=2, decimal_places=1, blank=True, null=True)
    farm_id = models.ForeignKey(Farm, models.DO_NOTHING, db_column='FarmID', blank=True, null=True)
    date_added = models.DateTimeField(db_column='Date_added', blank=True, null=True)
    photo = models.ImageField(upload_to='product_photos/', blank=True, null=True)
    description = models.CharField(max_length=255, blank=True, null=True)


    class Meta:
        managed = False
        db_table = 'Product'


class SoldTo(models.Model):
    product_id = models.ForeignKey(Product, models.DO_NOTHING, db_column='ProductID')
    buyer_id = models.OneToOneField(Buyer, models.DO_NOTHING, db_column='BuyerID', primary_key=True)

    class Meta:
        managed = False
        db_table = 'Sold_to'
        unique_together = (('buyer_id', 'product_id'),)
