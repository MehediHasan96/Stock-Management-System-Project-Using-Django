# Generated by Django 3.2.6 on 2021-08-20 11:10

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('StockApp', '0005_auto_20210820_1202'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='stock',
            name='csv',
        ),
    ]