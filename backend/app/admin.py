from django.contrib import admin

# Register your models here.
from .models import Users, DonateBooks

admin.site.register(Users)
admin.site.register(DonateBooks)