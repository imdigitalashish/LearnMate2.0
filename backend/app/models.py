from django.db import models


# Create your models here.
class Users(models.Model):
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    name = models.CharField(max_length=100)
    phone_number = models.CharField(max_length=100)

    class Meta:
        verbose_name_plural = "Users"


class TodoList(models.Model):
    phone_number = models.CharField(max_length=100)
    todo_item = models.CharField(max_length=1000)

    class Meta:
        verbose_name_plural = "Todo List"

    def __str__(self) -> str:
        return f"{self.phone_number} : {self.todo_item}"


class WeeklyPanner(models.Model):
    phone_number = models.CharField(max_length=100)
    todo_item = models.CharField(max_length=100)
    week = models.CharField(max_length=100)


class DonateBooks(models.Model):
    phone_number = models.CharField(max_length=100)
    name = models.CharField(max_length=100)
    city_name = models.CharField(max_length=100)
    pin_code = models.CharField(max_length=100)
    book_name = models.CharField(max_length=200)

    class Meta:
        verbose_name_plural = "Donate Books"

    def __str__(self) -> str:
        return f"{self.phone_number}:{self.name}"
