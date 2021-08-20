from django.contrib import admin
from .models import Category, Stock, StockHistory
from .forms import CreateStockForm
# Register your models here.


class CreateAdmin(admin.ModelAdmin):
    list_display = ['category', 'item_name', 'quantity']
    form = CreateStockForm
    search_fields = ['category', 'item_name']
    list_filter = ['category']


admin.site.register(Stock, CreateAdmin)
admin.site.register(StockHistory)
admin.site.register(Category)
