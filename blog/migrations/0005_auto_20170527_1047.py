# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-05-27 02:47
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0004_auto_20170527_1044'),
    ]

    operations = [
        migrations.AlterField(
            model_name='announcement',
            name='name',
            field=models.CharField(max_length=200, verbose_name=b'\xe4\xb8\xbb\xe8\xae\xb2\xe4\xba\xba'),
        ),
        migrations.AlterField(
            model_name='announcement',
            name='place',
            field=models.CharField(max_length=200, verbose_name=b'\xe5\x9c\xb0\xe7\x82\xb9'),
        ),
    ]
