# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Announcement',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=200, verbose_name=b'\xe6\xa0\x87\xe9\xa2\x98')),
                ('created_date', models.DateTimeField(default=django.utils.timezone.now, verbose_name=b'\xe5\x88\x9b\xe5\xbb\xba\xe6\x97\xb6\xe9\x97\xb4')),
            ],
            options={
                'verbose_name': '\u516c\u544a\u901a\u77e5',
                'verbose_name_plural': '\u516c\u544a\u901a\u77e5',
            },
        ),
        migrations.CreateModel(
            name='Lab',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100, verbose_name=b'\xe7\xa0\x94\xe7\xa9\xb6\xe5\xae\xa4\xe5\x90\x8d\xe7\xa7\xb0')),
                ('name_en', models.CharField(max_length=100, verbose_name=b'\xe7\xa0\x94\xe7\xa9\xb6\xe5\xae\xa4\xe8\x8b\xb1\xe6\x96\x87\xe5\x90\x8d')),
                ('direction', models.TextField(verbose_name=b'\xe7\xa0\x94\xe7\xa9\xb6\xe6\x96\xb9\xe5\x90\x91', blank=True)),
                ('direction_en', models.TextField(verbose_name=b'\xe8\x8b\xb1\xe6\x96\x87\xe7\xae\x80\xe4\xbb\x8b', blank=True)),
            ],
            options={
                'verbose_name': '\u7814\u7a76\u5ba4',
                'verbose_name_plural': '\u7814\u7a76\u5ba4',
            },
        ),
        migrations.CreateModel(
            name='News',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=200, verbose_name=b'\xe6\xa0\x87\xe9\xa2\x98')),
                ('text', models.TextField(verbose_name=b'\xe8\xaf\xa6\xe7\xbb\x86\xe5\x86\x85\xe5\xae\xb9', blank=True)),
                ('name', models.CharField(max_length=200, verbose_name=b'\xe4\xb8\xbb\xe8\xae\xb2\xe4\xba\xba')),
                ('host', models.CharField(max_length=200, verbose_name=b'\xe4\xb8\xbb\xe6\x8c\x81\xe4\xba\xba', blank=True)),
                ('organizers', models.CharField(max_length=200, verbose_name=b'\xe4\xb8\xbb\xe5\x8a\x9e\xe5\x8d\x95\xe4\xbd\x8d', blank=True)),
                ('place', models.CharField(max_length=200, verbose_name=b'\xe5\x9c\xb0\xe7\x82\xb9')),
                ('lec_time', models.DateTimeField(default=django.utils.timezone.now, verbose_name=b'\xe6\x97\xb6\xe9\x97\xb4')),
                ('presenter_detail', models.TextField(verbose_name=b'\xe4\xb8\xbb\xe8\xae\xb2\xe4\xba\xba\xe7\xae\x80\xe4\xbb\x8b', blank=True)),
                ('created_date', models.DateTimeField(default=django.utils.timezone.now, verbose_name=b'\xe5\x88\x9b\xe5\xbb\xba\xe6\x97\xb6\xe9\x97\xb4')),
                ('attachment', models.FileField(upload_to=b'blog/static/attachment/news/', verbose_name=b'\xe7\x9b\xb8\xe5\x85\xb3\xe9\x99\x84\xe4\xbb\xb6', blank=True)),
            ],
            options={
                'verbose_name': '\u52a8\u6001',
                'verbose_name_plural': '\u52a8\u6001',
            },
        ),
        migrations.CreateModel(
            name='Tools',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=200, verbose_name=b'\xe6\xa0\x87\xe9\xa2\x98')),
                ('title_en', models.CharField(max_length=200, verbose_name=b'\xe8\x8b\xb1\xe6\x96\x87\xe6\xa0\x87\xe9\xa2\x98')),
                ('text', models.TextField(verbose_name=b'\xe8\xaf\xa6\xe7\xbb\x86\xe5\x86\x85\xe5\xae\xb9')),
                ('text_en', models.TextField(verbose_name=b'\xe8\x8b\xb1\xe6\x96\x87\xe7\xae\x80\xe4\xbb\x8b')),
                ('created_date', models.DateTimeField(default=django.utils.timezone.now, verbose_name=b'\xe5\x88\x9b\xe5\xbb\xba\xe6\x97\xb6\xe9\x97\xb4')),
                ('attachment', models.FileField(upload_to=b'blog/static/attachment/tools/', verbose_name=b'\xe7\x9b\xb8\xe5\x85\xb3\xe9\x99\x84\xe4\xbb\xb6', blank=True)),
            ],
            options={
                'verbose_name': '\u7814\u7a76\u5de5\u5177',
                'verbose_name_plural': '\u7814\u7a76\u5de5\u5177',
            },
        ),
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('username', models.CharField(max_length=50, verbose_name=b'\xe5\xa7\x93\xe5\x90\x8d')),
                ('username_pin', models.CharField(max_length=50, verbose_name=b'\xe5\xa7\x93\xe5\x90\x8d\xe6\x8b\xbc\xe9\x9f\xb3')),
                ('password', models.CharField(max_length=200, verbose_name=b'\xe5\xaf\x86\xe7\xa0\x81')),
                ('email', models.EmailField(max_length=50, verbose_name=b'\xe9\x82\xae\xe7\xae\xb1')),
                ('category', models.CharField(default=b'--', max_length=30, verbose_name=b'\xe7\xb1\xbb\xe5\x88\xab', blank=True, choices=[(b'\xe5\x8d\x9a\xe5\xa3\xab\xe7\x94\x9f\xe5\xaf\xbc\xe5\xb8\x88', b'\xe5\x8d\x9a\xe5\xa3\xab\xe7\x94\x9f\xe5\xaf\xbc\xe5\xb8\x88'), (b'\xe7\xa1\x95\xe5\xa3\xab\xe7\x94\x9f\xe5\xaf\xbc\xe5\xb8\x88', b'\xe7\xa1\x95\xe5\xa3\xab\xe7\x94\x9f\xe5\xaf\xbc\xe5\xb8\x88'), (b'\xe7\xa0\x94\xe7\xa9\xb6\xe7\x94\x9f', b'\xe7\xa0\x94\xe7\xa9\xb6\xe7\x94\x9f')])),
                ('job_title', models.CharField(default=b'--', max_length=30, verbose_name=b'\xe8\x81\x8c\xe7\xa7\xb0', blank=True, choices=[(b'\xe8\xae\xb2\xe5\xb8\x88', b'\xe8\xae\xb2\xe5\xb8\x88'), (b'\xe5\x89\xaf\xe6\x95\x99\xe6\x8e\x88', b'\xe5\x89\xaf\xe6\x95\x99\xe6\x8e\x88'), (b'\xe6\x95\x99\xe6\x8e\x88', b'\xe6\x95\x99\xe6\x8e\x88'), (b'\xe7\x89\xb9\xe8\x81\x98\xe6\x95\x99\xe6\x8e\x88', b'\xe7\x89\xb9\xe8\x81\x98\xe6\x95\x99\xe6\x8e\x88'), (b'\xe7\x89\xb9\xe8\x81\x98\xe5\x89\xaf\xe6\x95\x99\xe6\x8e\x88', b'\xe7\x89\xb9\xe8\x81\x98\xe5\x89\xaf\xe6\x95\x99\xe6\x8e\x88'), (b'\xe5\x85\xbc\xe8\x81\x8c\xe6\x95\x99\xe6\x8e\x88', b'\xe5\x85\xbc\xe8\x81\x8c\xe6\x95\x99\xe6\x8e\x88')])),
                ('education', models.CharField(default=b'--', max_length=30, verbose_name=b'\xe5\xad\xa6\xe5\x8e\x86', blank=True, choices=[(b'\xe7\xa1\x95\xe5\xa3\xab', b'\xe7\xa1\x95\xe5\xa3\xab'), (b'\xe5\x8d\x9a\xe5\xa3\xab', b'\xe5\x8d\x9a\xe5\xa3\xab'), (b'\xe5\x8d\x9a\xe5\xa3\xab\xe5\x90\x8e', b'\xe5\x8d\x9a\xe5\xa3\xab\xe5\x90\x8e'), (b'\xe5\x9c\xa8\xe8\xaf\xbb\xe5\x8d\x9a\xe5\xa3\xab', b'\xe5\x9c\xa8\xe8\xaf\xbb\xe5\x8d\x9a\xe5\xa3\xab')])),
                ('photo', models.ImageField(default=b'blog/static/photo/default.png', upload_to=b'blog/static/photo/', verbose_name=b'\xe7\x85\xa7\xe7\x89\x87', blank=True)),
                ('information', models.TextField(verbose_name=b'\xe4\xb8\xaa\xe4\xba\xba\xe7\xae\x80\xe4\xbb\x8b', blank=True)),
                ('project', models.TextField(verbose_name=b'\xe7\xa0\x94\xe7\xa9\xb6\xe9\xa1\xb9\xe7\x9b\xae', blank=True)),
                ('patent', models.TextField(verbose_name=b'\xe8\x8e\xb7\xe5\xbe\x97\xe4\xb8\x93\xe5\x88\xa9\xe6\x83\x85\xe5\x86\xb5', blank=True)),
                ('article', models.TextField(verbose_name=b'\xe6\x96\x87\xe7\xab\xa0\xe5\x8f\x91\xe8\xa1\xa8\xe6\x83\x85\xe5\x86\xb5', blank=True)),
                ('works', models.TextField(verbose_name=b'\xe8\x91\x97\xe4\xbd\x9c\xe5\x8f\x91\xe8\xa1\xa8\xe6\x83\x85\xe5\x86\xb5', blank=True)),
                ('introduction_en', models.TextField(verbose_name=b'\xe8\x8b\xb1\xe6\x96\x87\xe7\xae\x80\xe4\xbb\x8b', blank=True)),
                ('is_staff', models.BooleanField(default=False, verbose_name=b'\xe6\x98\xaf\xe5\x90\xa6\xe5\x85\x81\xe8\xae\xb8\xe6\xb3\xa8\xe5\x86\x8c')),
                ('status', models.CharField(default=b'\xe5\x90\xa6', max_length=10, verbose_name=b'\xe6\x98\xaf\xe5\x90\xa6\xe9\x9c\x80\xe8\xa6\x81\xe9\x87\x8d\xe7\xbd\xae\xe5\xaf\x86\xe7\xa0\x81', blank=True)),
            ],
            options={
                'verbose_name': '\u7528\u6237',
                'verbose_name_plural': '\u7528\u6237',
            },
        ),
        migrations.AddField(
            model_name='lab',
            name='user',
            field=models.ManyToManyField(to='blog.UserProfile', verbose_name=b'\xe7\xa0\x94\xe7\xa9\xb6\xe5\xae\xa4\xe4\xba\xba\xe5\x91\x98'),
        ),
    ]
