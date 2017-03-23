# -*- coding:utf-8 -*-
from django import forms
from .models import UserProfile
from .models import Article
from django.utils.safestring import mark_safe

class UserRegisterForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['username', 'email', 'password', 'password_confirm']

    # https://docs.djangoproject.com/en/1.10/ref/models/fields/
    username = forms.CharField(max_length=50, required=True, label=mark_safe('姓名'))
    email = forms.EmailField(max_length=50, required=True, label=mark_safe('<br/>邮箱'))
    password = forms.CharField(max_length=16, required=True, widget=forms.PasswordInput, label=mark_safe('<br/>密码'))
    password_confirm = forms.CharField(max_length=16, required=True, widget=forms.PasswordInput, label=mark_safe('<br/>重复密码'))

    '''
    def is_valid(self):
        # review:  https://docs.djangoproject.com/en/1.10/ref/forms/api/
        return all([super(UserRegisterForm, self).is_valid(), self.check_password()])
    '''
    
    def check_password(self):
        # check the password and password_confirm is match or not
        # review: http://stackoverflow.com/questions/4706255/how-to-get-value-from-form-field-in-django-framework
        if self.cleaned_data['password'] != self.cleaned_data['password_confirm']:
            self.errors['password'] = forms.ValidationError(['password not match'])
            return False
        return True

class UserLoginForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['email', 'password']

    email = forms.CharField(max_length=50, required=True, label='邮箱')
    password = forms.CharField(max_length=17, required=True, widget=forms.PasswordInput, label=mark_safe('<br/>密码'))

    '''
    def clean(self):
        if not self.is_valid():
            self.errors['illegal'] = forms.ValidationError(['all of that are required'])
            return False
        else:
            cleaned_data = super(UserLoginForm, self).clean()
    '''    

class UserChangePasswordForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['old_password', 'new_password', 'password_confirm']

    old_password = forms.CharField(max_length=200, required=True, widget=forms.PasswordInput, label='旧密码')
    new_password = forms.CharField(max_length=200, required=True, widget=forms.PasswordInput, label=mark_safe('<br/>新密码'))
    password_confirm = forms.CharField(max_length=200, required=True, widget=forms.PasswordInput, label=mark_safe('<br/>重复新密码'))

    '''
    def is_valid(self):
        # review:  https://docs.djangoproject.com/en/1.10/ref/forms/api/
        return all([super(UserChangePasswordForm, self).is_valid(), self.checkpassword()])
    '''
    
    def checkpassword(self):
        # check the password and password_confirm is match or not
        # review: http://stackoverflow.com/questions/4706255/how-to-get-value-from-form-field-in-django-framework
        if self.cleaned_data['new_password'] != self.cleaned_data['password_confirm']:
            self.errors['password'] = forms.ValidationError(['password not match'])#TODO 未提示
            return False
        return True

class UserDetailForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['category', 'photo', 'information', 'project', 'patent', 'article', 'works']

    category_choice= (
        ('博士生导师', '博士生导师'),
        ('硕士生导师', '硕士生导师'),
        ('研究生', '研究生'),
        )

    category = forms.CharField(max_length=200, widget=forms.Select(choices=category_choice), required=False, label=mark_safe('<br/><i class="am-icon-user"></i>身份'))
    photo = forms.ImageField(required=False, label=mark_safe('<br/><i class="am-icon-cloud-upload"></i>个人照片'))
    information = forms.CharField(widget=forms.Textarea, required=False, label=mark_safe('<br/>个人介绍'))
    project = forms.CharField(widget=forms.Textarea, required=False, label=mark_safe('<br/>研究项目'))
    patent = forms.CharField(widget=forms.Textarea, required=False, label=mark_safe('<br/>专利'))
    article = forms.CharField(widget=forms.Textarea, required=False, label=mark_safe('<br/>文章发表'))
    works = forms.CharField(widget=forms.Textarea, required=False, label=mark_safe('<br/>著作发表'))

class SearchForm(forms.Form):
    search = forms.CharField(max_length=200, label='站内搜索')

class ForgetPasswordForm(forms.Form):
    email = forms.EmailField(max_length=50, required=True, label='邮箱')
    username = forms.CharField(max_length=50, required=True, label=mark_safe('<br/>姓名'))
