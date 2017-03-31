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

class Announcement(models.Model):
    class Meta:
        verbose_name = '公告通知'
        verbose_name_plural = '公告通知'

    title = models.CharField(verbose_name="标题" ,max_length=200)
    created_date = models.DateTimeField(default=timezone.now, verbose_name="创建时间")
    #attachment = models.FileField(upload_to='blog/static/attachment/announcement/', blank=True)

    def __str__(self):
        return self.title

class Tools(models.Model):
    class Meta:
        verbose_name = '研究工具'
        verbose_name_plural = '研究工具'

    title = models.CharField(max_length=200, verbose_name="标题")
    text = models.TextField(verbose_name="详细内容") 
    created_date = models.DateTimeField(default=timezone.now, verbose_name="创建时间")
    attachment = models.FileField(upload_to='blog/static/attachment/tools/', blank=True, verbose_name="相关附件")

    def __str__(self):
        return self.title

class News(models.Model):
    class Meta:
        verbose_name = '动态'
        verbose_name_plural = '动态'

    title = models.CharField(max_length=200, verbose_name="标题")
    text = models.TextField(verbose_name="详细内容", blank=True)
    name = models.CharField(max_length=200, verbose_name="主讲人")
    host = models.CharField(max_length=200, verbose_name="主持人", blank=True)
    organizers = models.CharField(max_length=200, verbose_name="主办单位", blank=True)
    place = models.CharField(max_length=200, verbose_name="地点")
    lec_time = models.DateTimeField(default=timezone.now, verbose_name="时间")
    presenter_detail = models.TextField(verbose_name="主讲人简介", blank=True)
    created_date = models.DateTimeField(default=timezone.now, verbose_name="创建时间")
    attachment = models.FileField(upload_to='blog/static/attachment/news/', blank=True, verbose_name="相关附件")

    def __str__(self):
        return self.title

class UserProfile(models.Model):
    class Meta:
        verbose_name = '用户'
        verbose_name_plural = '用户'

    category_choice = (
        ('博士生导师', '博士生导师'),
        ('硕士生导师', '硕士生导师'),
        ('研究生', '研究生'),
        )

    title_choice = (
        ('讲师', '讲师'),
        ('副教授', '副教授'),
        ('教授', '教授'),
        ('特聘教授', '特聘教授'),
        #('特聘副教授', '特聘副教授')
        ('兼职教授', '兼职教授'),
        )

    education_choice = (
        ('硕士', '硕士'),
        ('博士', '博士'),
        ('博士后', '博士后'),
        ('在读博士', '在读博士'),
        )


    username = models.CharField(max_length=50, verbose_name="姓名")
    username_pin = models.CharField(max_length=50, verbose_name="姓名拼音")
    password = models.CharField(max_length=200, verbose_name="密码")
    email = models.EmailField(max_length=50, verbose_name="邮箱")
    category = models.CharField(max_length=30, blank=True, default="--", choices=category_choice, verbose_name="类别")
    job_title = models.CharField(max_length=30, blank=True, default="--", choices=title_choice, verbose_name="职称")
    education = models.CharField(max_length=30, blank=True, default="--", choices=education_choice, verbose_name="学历")
    photo = models.ImageField(upload_to='blog/static/photo/', blank=True, default="blog/static/photo/default.png", verbose_name="照片")
    information = models.TextField(blank=True, verbose_name="个人简介")
    project = models.TextField(blank=True, verbose_name="研究项目")
    patent = models.TextField(blank=True, verbose_name="获得专利情况")
    article = models.TextField(blank=True, verbose_name="文章发表情况")
    works = models.TextField(blank=True, verbose_name="著作发表情况")
    is_staff = models.BooleanField(default=False, verbose_name="是否允许注册")
    status = models.CharField(max_length=10, blank=True, default='否', verbose_name="是否需要重置密码")

    def save(self, *args, **kwargs):
        try:
            user = UserProfile.objects.get(email=self.email)
            if not self.password == user.password:
                password = make_password(self.password, None, 'pbkdf2_sha256')
                self.password = password
            super(UserProfile, self).save(*args, **kwargs)
        except UserProfile.DoesNotExist:
            password = make_password(self.password, None, 'pbkdf2_sha256')
            self.password = password
            super(UserProfile, self).save(*args, **kwargs)

    def __str__(self):
        return self.username

class Lab(models.Model):
    class Meta:
        verbose_name = '研究室'
        verbose_name_plural = '研究室'

    name = models.CharField(max_length=100, verbose_name="研究室名称")
    name_en = models.CharField(max_length=100, verbose_name="研究室英文名")
    direction = models.TextField(blank=True, verbose_name="研究方向")
    direction_en = models.TextField(blank=True, verbose_name="英文简介")
    user = models.ManyToManyField(UserProfile, verbose_name="研究室人员")

    def __str__(self):
        return self.name
