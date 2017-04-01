# -*- coding:utf-8 -*-
from django import forms
from .models import UserProfile
from django.utils.safestring import mark_safe
from django.utils.translation import ugettext_lazy as _


class UserRegisterForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['username', 'email', 'password', 'password_confirm']

    # https://docs.djangoproject.com/en/1.10/ref/models/fields/
    output1 = _(u"姓名")
    output2 = _(u"邮箱")
    output3 = _(u"密码")
    output4 = _(u"重复密码")
    username = forms.CharField(max_length=50, required=True, label=mark_safe('%s' % output1))
    email = forms.EmailField(max_length=50, required=True, label=mark_safe('<br/>%s' % output2))
    password = forms.CharField(max_length=16, required=True, widget=forms.PasswordInput, label=mark_safe('<br/>%s' % output3))
    password_confirm = forms.CharField(max_length=16, required=True, widget=forms.PasswordInput, label=mark_safe('<br/>%s'%output4))

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

    output1 = _(u"邮箱")
    output2 = _(u"密码")
    email = forms.CharField(max_length=50, required=True, label=mark_safe('%s' % output1))
    password = forms.CharField(max_length=17, required=True, widget=forms.PasswordInput, label=mark_safe('<br/>%s' % output2))

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

    output1 = _(u"旧密码")
    output2 = _(u"新密码")
    output3 = _(u"重复新密码")
    old_password = forms.CharField(max_length=200, required=True, widget=forms.PasswordInput, label=mark_safe('%s' % output1))
    new_password = forms.CharField(max_length=200, required=True, widget=forms.PasswordInput, label=mark_safe('<br/>%s' %output2))
    password_confirm = forms.CharField(max_length=200, required=True, widget=forms.PasswordInput, label=mark_safe('<br/>%s' % output3))

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
        fields = ['category', 'job_title',  'education', 'photo', 'information', 'project', 'patent', 'article', 'works']

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
        ('特聘副教授', '特聘副教授')
        ('兼职教授', '兼职教授'),
        )

    education_choice = (
        ('硕士', '硕士'),
        ('博士', '博士'),
        ('博士后', '博士后'),
        ('在读博士', '在读博士'),
        )

    category = forms.CharField(max_length=200, widget=forms.Select(choices=category_choice), required=False, label=mark_safe('<br/><i class="am-icon-user"></i>类别'))
    job_title = forms.CharField(max_length=200, widget=forms.Select(choices=title_choice), required=False, label=mark_safe('<br/><i class="am-icon-user"></i>职称'))
    education = forms.CharField(max_length=200, widget=forms.Select(choices=education_choice), required=False, label=mark_safe('<br/><i class="am-icon-user"></i>学历'))
    photo = forms.ImageField(required=False, label=mark_safe('<br/><i class="am-icon-cloud-upload"></i>个人照片'))
    information = forms.CharField(widget=forms.Textarea, required=False, label=mark_safe('<br/>个人介绍'))
    project = forms.CharField(widget=forms.Textarea, required=False, label=mark_safe('<br/>研究项目'))
    patent = forms.CharField(widget=forms.Textarea, required=False, label=mark_safe('<br/>专利'))
    article = forms.CharField(widget=forms.Textarea, required=False, label=mark_safe('<br/>文章发表'))
    works = forms.CharField(widget=forms.Textarea, required=False, label=mark_safe('<br/>著作发表'))
    introduction_en = forms.CharField(widget=forms.Textarea, required=False, label=mark_safe('<br/>英文简介'))

class SearchForm(forms.Form):
    output = _(u"站内搜索")
    search = forms.CharField(max_length=200, label=output)

class ForgetPasswordForm(forms.Form):
    output1 = _(u"邮箱")
    output2 = _(u"姓名")
    email = forms.EmailField(max_length=50, required=True, label=mark_safe('%s' % output1))
    username = forms.CharField(max_length=50, required=True, label=mark_safe('<br/> %s' %output2))
