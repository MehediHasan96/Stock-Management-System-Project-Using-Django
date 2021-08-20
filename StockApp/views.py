from ast import Str
from django.http import HttpResponse, response
from django.shortcuts import redirect, render
from .models import Category, Stock, StockHistory
from .forms import CreateStockForm, ReorderLevelForm, StockSearchForm, IssueForm, ReceiveForm, SignUpForm
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, HttpResponse, HttpResponseRedirect
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm, PasswordChangeForm
from django.contrib.auth import login, authenticate, logout
from django.urls import reverse
import csv

# Create your views here.


def sign_up(request):
    form = SignUpForm()
    registered = False
    if request.method == 'POST':
        form = SignUpForm(data=request.POST)
        if form.is_valid():
            form.save()
            registered = True

    dict = {'form': form, 'registered': registered}
    return render(request, 'signup.html', context=dict)


def login_page(request):
    form = AuthenticationForm()
    if request.method == "POST":
        form = AuthenticationForm(data=request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                return HttpResponseRedirect(reverse('item_list'))

    return render(request, 'login.html', context={'form': form})


@login_required
def logout_user(request):
    logout(request)
    return HttpResponseRedirect(reverse('item_list'))


@login_required
def item_list(request):
    data = Stock.objects.all()
    form = StockSearchForm(request.POST or None)
    if request.method == "POST":
        category = form['category'].value()
        data = Stock.objects.filter(
            item_name__icontains=form['item_name'].value())

        if category != '':
            data = data.filter(category_id=category)

        if form['export_to_CSV'].value() == True:
            response = HttpResponse(content_type='text/csv')
            response['Content-Disposition'] = 'attachment; filename="Stock History.csv"'
            writer = csv.writer(response)
            writer.writerow(['CATEGORY',
                             'ITEM NAME',
                             'QUANTITY',
                             ])
            instance = data
            for stock in instance:
                writer.writerow([stock.category,
                                 stock.item_name,
                                 stock.quantity,
                                 ])
            return response

    return render(request, 'home.html', context={'data': data, 'form': form})


@login_required
def create_item(request):
    if request.method == 'POST':
        form = CreateStockForm(request.POST)
        if form.is_valid():
            form .save()
            messages.success(request, 'successfully created')
            return redirect('/')

    form = CreateStockForm()
    return render(request, 'create.html', context={'form': form})


@login_required
def item_details(request, pk):
    data = Stock.objects.get(id=pk)
    return render(request, "item_details.html", context={'data': data})


@login_required
def update_item(request, pk):
    data = Stock.objects.get(pk=pk)
    if request.method == 'POST':
        form = CreateStockForm(request.POST, instance=data)
        if form.is_valid():
            form .save()
            messages.success(request, 'successfully Updated')
            return redirect('/')
    form = CreateStockForm(instance=data)
    return render(request, 'create.html', context={'form': form})


@login_required
def delete_item(request, pk):
    data = Stock.objects.get(pk=pk)
    if request.method == 'POST':
        data.delete()
        messages.success(request, 'successfully Deleted')
        return redirect('/')

    return render(request, 'delete.html', context={})


@login_required
def issue_items(request, pk):
    data = Stock.objects.get(pk=pk)
    if request.method == 'POST':
        form = IssueForm(request.POST, instance=data)
        if form.is_valid():
            info = form.save(commit=False)
            info.receive_quantity = 0
            info.quantity -= info.issue_quantity
            info.issue_by = str(request.user)

            messages.success(request, "Issued successfully. " + str(info.quantity) +
                             " " + str(info.item_name) + "s now in Store")
            info.save()
            return redirect('/item_details/'+str(data.id))
    form = IssueForm()
    context = {
        "title": 'Issue ' + str(data.item_name),

        "form": form,


    }
    return render(request, "add.html", context)


@login_required
def receive_items(request, pk):
    data = Stock.objects.get(pk=pk)
    if request.method == 'POST':
        form = ReceiveForm(request.POST, instance=data)
        if form.is_valid():
            info = form.save(commit=False)
            info.issue_quantity = 0
            info.quantity += info.receive_quantity
            info.receive_by = str(request.user)

            messages.success(request, "Received successfully." + str(info.quantity)
                             + " " + str(info.item_name)+" "+"now in store.")
            info.save()
            return redirect('/item_details/'+str(data.id))
    form = ReceiveForm()
    context = {
        "title": 'Receive ' + str(data.item_name),
        "form": form,

    }

    return render(request, "add.html", context)


@login_required
def reorder_level(request, pk):
    data = Stock.objects.get(pk=pk)
    if request.method == 'POST':
        form = ReorderLevelForm(request.POST, instance=data)
        if form.is_valid():
            info = form.save(commit=False)
            messages.success(request, "Reorder level for" + " " + str(info.item_name)
                             + " " + "is updated to "+str(info.reorder_level))

            info.save()
            return redirect('/')
    form = ReorderLevelForm(instance=data)

    return render(request, "add.html", context={"form": form})


@login_required
def list_history(request):
    data = StockHistory.objects.all()
    form = StockSearchForm(request.POST or None)
    if request.method == "POST":
        category = form['category'].value()
        data = StockHistory.objects.filter(
            item_name__icontains=form['item_name'].value())

        if category != '':
            data = data.filter(category_id=category)

        if form['export_to_CSV'].value() == True:
            response = HttpResponse(content_type='text/csv')
            response['Content-Disposition'] = 'attachment; filename="Stock History.csv"'
            writer = csv.writer(response)
            writer.writerow(['CATEGORY',
                             'ITEM NAME',
                             'QUANTITY',
                             'ISSUE QUANTITY',
                             'RECEIVE QUANTITY',
                             'RECEIVE BY',
                             'ISSUE BY',
                             'LAST UPDATED'])
            instance = data
            for stock in instance:
                writer.writerow([stock.category,
                                 stock.item_name,
                                 stock.quantity,
                                 stock.issue_quantity,
                                 stock.receive_quantity,
                                 stock.receive_by,
                                 stock.issue_by,
                                 stock.last_updated])
            return response

    return render(request, "list_history.html", context={'data': data, 'form': form})
