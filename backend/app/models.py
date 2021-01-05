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
class TodoList(models.Model):
    phone_number = models.CharField(max_length=100)
    todo_item = models.CharField(max_length=1000)

    class Meta:
        verbose_name_plural = "Todo List"
    
    def __str__(self) -> str:
        return f"{self.phone_number} : {self.todo_item}"
        
# Donate Book -> your_name, mobile, email, book_name, type[ebook, hardcopy]

