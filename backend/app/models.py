from django.db import models

# Create your models here.
class Users(models.Model):
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    name = models.CharField(max_length=100)
    phone_number = models.CharField(max_length=100)

    class Meta:
        verbose_name_plural = "Users"

# Todo -> phone_number, item
# Donate Book -> your_name, mobile, email, book_name, type[ebook, hardcopy]