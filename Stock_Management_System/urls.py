
from django.contrib import admin
from django.urls import path, include
from StockApp import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('signup/', views.sign_up, name='signup'),
    path('login/', views.login_page, name='login'),
    path('logout/', views.logout_user, name='logout'),
    path('', views.item_list, name='item_list'),
    path('create/', views.create_item, name='create_item'),
    path('update/<int:pk>/', views.update_item, name='update_item'),
    path('delete/<int:pk>/', views.delete_item, name='delete_item'),
    path('item_details/<int:pk>/', views.item_details, name="item_details"),
    path('issue_items/<int:pk>/', views.issue_items, name="issue_items"),
    path('receive_items/<int:pk>/', views.receive_items, name="receive_items"),
    path('reorder_level/<int:pk>/', views.reorder_level, name="reorder_level"),
    path('list_history/', views.list_history, name='list_history'),

]
