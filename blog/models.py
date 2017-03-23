# -*- coding:utf-8 -*-
from django.db import models
from django.utils import timezone
import sys
from django.contrib.auth.models import User
from django.conf import settings
from django.contrib.auth.hashers import make_password, check_password

reload(sys)
sys.setdefaultencoding('utf-8')
# Create your models here.

class Article(models.Model):
    #author = models.ForeignKey('auth.user')
    title = models.CharField(max_length=200)
    text = models.TextField() 
    category = models.ForeignKey('ArticleCategory')
    created_date = models.DateTimeField(default=timezone.now)
    attachment = models.FileField(upload_to='blog/static/attachment/', blank=True)

    def __str__(self):
        return self.title

class UserProfile(models.Model):
    username = models.CharField(max_length=30)
    password = models.CharField(max_length=200)
    email = models.EmailField(max_length=50)
    category = models.CharField(max_length=30, blank=True, default="--")
    photo = models.ImageField(upload_to='blog/static/photo/', blank=True, default="blog/static/photo/default.png")
    information = models.TextField(blank=True)
    project = models.TextField(blank=True)
    patent = models.TextField(blank=True)
    article = models.TextField(blank=True)
    works = models.TextField(blank=True)
    is_staff = models.BooleanField(default=False)
    status = models.CharField(max_length=10, blank=True)

    def save(self, *args, **kwargs):
        try:
            user = UserProfile.objects.get(email=self.email)
            if not self.password == user.password:
                password = make_password(self.password, None, 'pbkdf2_sha256')
                self.password = password
            super(UserProfile, self).save(*args, **kwargs)
        except UserProfile.DoesNotExist:
            password = self.password
            super(UserProfile, self).save(*args, **kwargs)

    def __str__(self):
        return self.username

class ArticleCategory(models.Model):
    category = models.CharField(max_length=30)

    def __str__(self):
        return self.category