from django import forms
from django.db import models
from django.db.models import fields
from .models import Stock
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User


class SignUpForm(UserCreationForm):
    email = forms.EmailField(required=True)

    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2')

class CreateStockForm(forms.ModelForm):
    class Meta:
        model = Stock
        fields = ['category', 'item_name', 'quantity']


class StockSearchForm(forms.ModelForm):
    export_to_CSV = forms.BooleanField(required=False)

    class Meta:
        model = Stock
        fields = ['category', 'item_name']


class IssueForm(forms.ModelForm):
    class Meta:
        model = Stock
        fields = ['issue_quantity', ]


class ReceiveForm(forms.ModelForm):
    class Meta:
        model = Stock
        fields = ['receive_quantity']


class ReorderLevelForm(forms.ModelForm):
    class Meta:
        model = Stock
        fields = ['reorder_level']
