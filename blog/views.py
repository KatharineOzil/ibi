# -*- coding:utf-8 -*-

from django.shortcuts import render, HttpResponseRedirect, render_to_response
from .models import Article
from .models import UserProfile
from .models import ArticleCategory
from .forms import UserRegisterForm, UserLoginForm, UserChangePasswordForm, UserDetailForm, SearchForm, ForgetPasswordForm
from django.contrib.auth.decorators import permission_required
from django.http import HttpResponse
from django.contrib.auth.hashers import make_password, check_password
from itertools import chain
import sys
from django.db.models import Q
from django.db import connection
from django.contrib import messages
import json
from django.http import JsonResponse

reload(sys)
sys.setdefaultencoding('utf-8')
# Create your views here.

def index(request):
    return_result = {}
    try:
        obj_news = ArticleCategory.objects.get(category='news')
        news = obj_news.article_set.all().order_by('-id')[:1]
        obj_ann = ArticleCategory.objects.get(category='announcement')
        announcement = obj_ann.article_set.all().order_by('-id')[:1]
        return_result.update({'news': news, 'announcement': announcement})
    except ArticleCategory.DoesNotExist:
        return_result.update({'news': u'无', 'announcement': u'无'})

    if request.session.get('username', None) and request.session.get('email', None):
        username = request.session['username']
        email = request.session['email']
        return_result.update({'username': username, 'email': email})
    else:
        pass
    f = SearchForm()
    return_result.update({'form': f})
    return render(request, 'blog/index.html', return_result)

def news(request):
    return_result = {}
    if request.session.get('username', None) and request.session.get('email', None):
        username = request.session['username']
        email = request.session['email']
        return_result.update({'username': username, 'email': email})
    else:
        pass

    try:
        obj_news = ArticleCategory.objects.get(category='news')
        news = obj_news.article_set.all().order_by('-id')
        return_result.update({'news': news})
        return render(request, 'blog/news.html', return_result)
    except ArticleCategory.DoesNotExist:
        return render(request, 'blog/news.html', return_result)


def announcement(request):
    return_result = {}
    if request.session.get('username', None) and request.session.get('email', None):
        username = request.session['username']
        email = request.session['email']
        return_result.update({'username': username, 'email': email})
    else:
        pass

    try:
        obj_ann = ArticleCategory.objects.get(category='announcement')
        announcement = obj_ann.article_set.all().order_by('-id')
        return_result.update({'announcement': announcement})
        return render(request, 'blog/announcement.html', return_result)
    except ArticleCategory.DoesNotExist:
        return render(request, 'blog/announcement.html', return_result)

def sci_news(request):
    return_result = {}
    if request.session.get('username', None) and request.session.get('email', None):
        username = request.session['username']
        email = request.session['email']
        return_result.update({'username': username, 'email': email})
    else:
        pass

    user_result = UserProfile.objects. all().values('works', 'patent', 'article', 'username')
    return_result.update({'user_result': user_result})
    return render(request, 'blog/sci_news.html', return_result)

def direction(request):
    return_result = {}
    if request.session.get('username', None) and request.session.get('email', None):
        username = request.session['username']
        email = request.session['email']
        return_result.update({'username': username, 'email': email})
    else:
        pass

    direction = UserProfile.objects.all().values('project', 'username')
    return_result.update({'direction': direction})
    return render(request, 'blog/direction.html', return_result)

    '''
    try:
        obj_pro = ArticleCategory.objects.get(category='direction')
        project = obj_pro.article_set.all()
        return_result.update({'direction': direction})
        return render(request, 'blog/direction.html', return_result)
    except ArticleCategory.DoesNotExist:
        return render(request, 'blog/direction.html', return_result)
    '''

def team(request):
    return_result = {}
    if request.session.get('username', None) and request.session.get('email', None):
        username = request.session['username']
        email = request.session['email']
        return_result.update({'username': username, 'email': email})
    else:
        pass

    team = UserProfile.objects.all()
    return_result.update({'team': team})
    for a in team:
        b = str(a.photo)
    photo_url = b.replace('blog/', '', 1)
    return_result.update({'photo_url' : photo_url})
    return render(request, 'blog/team.html', return_result)

def tools(request):
    return_result = {}
    if request.session.get('username', None) and request.session.get('email', None):
        username = request.session['username']
        email = request.session['email']
        return_result.update({'username': username, 'email': email})
    else:
        pass

    try:
        obj_tools = ArticleCategory.objects.get(category='tools')
        tools = obj_tools.article_set.all()
        return_result.update({'tools': tools})
        for a in tools:
            if a.attachment:
                attachment = str(a.attachment)
                attachment = attachment.replace('blog/', '', 1)
                return_result.update({'attachment': attachment})
            else:
                pass
        return render(request, 'blog/tools.html', return_result)
    except ArticleCategory.DoesNotExist:
        return render(request, 'blog/tools.html', return_result)

def search(request):
    return_result = {}
    if request.session.get('username', None) and request.session.get('email', None):
        username = request.session['username']
        email = request.session['email']
        return_result.update({'username': username, 'email': email})
    else:
        pass
    if request.method == 'GET':
        f = SearchForm()
        return_result.update({'form': f})
        return render(request, 'blog/search.html', return_result)
    if request.method == 'POST':
        f = SearchForm(request.POST)    
        if f.is_valid():
            search = f.cleaned_data['search']
            result_article = Article.objects.filter( Q(title__contains=search) | Q(text__contains=search))
            result_user = UserProfile.objects.filter( Q(username__contains=search) | Q(information__contains=search) | Q(patent__contains=search) | Q(project__contains=search) | Q(works__contains=search) | Q(article__contains=search))
            result = chain(result_user, result_article)
            return_result.update({'form': f, 'result': result})
            return render(request, 'blog/search.html',return_result)
        else:
            return_result.update({'form': f})
            return render(request, 'blog/index.html', return_result)

def user_detail(request):#看到个人现有信息，然后进行添加
    return_result = {}
    if request.session.get('username', None) and request.session.get('email', None):
        username = request.session['username']
        email = request.session['email']
        return_result.update({'username': username, 'email': email})
    else:
        return HttpResponseRedirect('login')#alert login
    
    if request.method == 'GET':
        user = UserProfile.objects.all().get(email=email)
        user_detail = UserProfile.objects.filter(email=email)
        return_result.update({'user': user_detail})
        photo_url = str(user.photo)
        photo_url = photo_url.replace('blog/', '', 1)
        f = UserDetailForm({'category': user.category, 'photo': user.photo, 'information': user.information, 'project': user.project, 'patent': user.patent, 'article': user.article, 'works': user.works})
        return_result.update({'form': f})
        return_result.update({'photo_url' : photo_url})
        return render(request, 'blog/user_detail.html', return_result)
    if request.method == 'POST':
        f = UserDetailForm(request.POST, request.FILES)
        if f.is_valid():
            category = f.cleaned_data['category']
            information = f.cleaned_data['information']
            project = f.cleaned_data['project']
            patent = f.cleaned_data['patent']
            works = f.cleaned_data['works']
            article = f.cleaned_data['article']
            user_update = UserProfile.objects.filter(email=email).update(category=category, information=information, project=project, patent=patent, works=works, article=article)

            if request.FILES:
                photo = request.FILES['photo']
                photo.name = str(username)+'.jpg'
                user = UserProfile.objects.get(email=email)
                user.photo = photo
                user.save()

            return HttpResponseRedirect('user_detail')

def user_register(request):
    error = []
    if request.method == 'GET':
        f = UserRegisterForm()
        return render(request, 'blog/register.html', {'form': f})
    elif request.method == 'POST':
        f = UserRegisterForm(request.POST)
        if not f.is_valid():
            message = {'message': '请填写信息'}
            data = json.dumps(message,separators=(',',':'))                
            return JsonResponse(data, safe=False)
            #return render(request, 'blog/register.html', {'form': f})
        else:
            username = f.cleaned_data['username']
            password = f.cleaned_data['password']
            password_confirm = f.cleaned_data['password_confirm']
            email = f.cleaned_data['email']
            if not UserProfile.objects.all().filter(email=email):
                UserProfile.objects.create(username=username,password=make_password(password, None, 'pbkdf2_sha256'),email=email)
                message = {'message': '注册成功！请等待管理员审核'}
                data = json.dumps(message,separators=(',',':'))                
                return JsonResponse(data, safe=False)
                #return render(request, 'blog/register.html', {'message': '注册成功！请等待管理员审核', 'form': f}) 
            message = {'message': '该邮箱已被注册，有疑问请联系管理员'}
            data = json.dumps(message,separators=(',',':'))                
            return JsonResponse(data, safe=False)
            #return render(request, 'blog/register.html', {'message': '该邮箱已被注册，有疑问请联系管理员', 'form': f})
    else:
        f = UserRegisterForm()
        return render_to_response('register.html', {'form': f, 'error': error})

def user_login(request):
    if request.method == 'GET':
        f = UserLoginForm()
        return render(request, 'blog/login.html', {'form': f})
    elif request.method == 'POST':
        f = UserLoginForm(request.POST)
        if f.is_valid():
            email = f.cleaned_data['email']
            password = f.cleaned_data['password']
            user_exist = UserProfile.objects.all().filter(email=email)
            if user_exist:
                user = UserProfile.objects.get(email=email)
                if user.is_staff:
                    request.session['username'] = user.username
                    request.session['email'] = email
                    check = check_password(password, user.password)
                    if check:
                        return HttpResponseRedirect('index')
                    else:
                        message = {'message': '用户名或密码错误，请重新登录'}
                        data = json.dumps(message,separators=(',',':'))                
                        return JsonResponse(data, safe=False)
                        #return render(request, 'blog/login.html', {'message': '用户名或密码错误,请重新登录', 'form': f}) 
                else:
                    message = {'message': '注册未被审核，请联系管理员'}
                    data = json.dumps(message,separators=(',',':'))                
                    return JsonResponse(data, safe=False)
                    #return render(request, 'blog/login.html', {'message': '注册未被审核，请联系管理员', 'form': f}) 
            else:
                message = {'message': '该用户未注册'}
                data = json.dumps(message,separators=(',',':'))                
                return JsonResponse(data, safe=False)
                #return render(request, 'blog/login.html', {'message': '该用户未注册', 'form': f}) 
        else:
            message = {'message': '请填写信息'}
            data = json.dumps(message,separators=(',',':'))                
            return JsonResponse(data, safe=False)
            #return render(request, 'blog/login.html', {'form': f})

def user_logout(request):#TTTTTTTTODO
    try:
        del request.session['username']
        del request.session['email']
    except KeyError:
        pass

    return render(request, 'blog/index.html', {'message': '注销成功！'}) #alert????

def change_password(request):
    #TODO username in header
    if request.session.get('username', None) and request.session.get('email', None):
        username = request.session['username']
        email = request.session['email']
        if request.method == 'GET':
            f = UserChangePasswordForm()
            return render(request, 'blog/change_password.html', {'username': username, 'email': email, 'form': f})
        elif request.method == 'POST':
            f = UserChangePasswordForm(request.POST)
            if f.is_valid():
                old_password = f.cleaned_data['old_password']
                new_password = f.cleaned_data['new_password']
                password_confirm = f.cleaned_data['password_confirm']
                user = UserProfile.objects.get(email=email)
                check = check_password(old_password, user.password)
                if check:
                    user.password = new_password
                    user.save()
                    message = {'message': '修改成功'}
                    data = json.dumps(message,separators=(',',':'))                
                    return JsonResponse(data, safe=False)
                    #return render(request, 'blog/change_password.html', {'message': '修改成功！', 'form': f})#alert success & loginagain???
                else:
                    message = {'message': '旧密码输入错误'}
                    data = json.dumps(message,separators=(',',':'))                
                    return JsonResponse(data, safe=False)
                    #return render(request, 'blog/change_password.html', {'message': '旧密码输入错误！', 'form': f})
            else:
                message = {'message': '请填写信息'}
                data = json.dumps(message,separators=(',',':'))                
                return JsonResponse(data, safe=False)
                #return render_to_response('blog/index.html',{'username':username, 'email':email})
    else:
        return render(request, 'blog/login.html', {'form': UserLoginForm(), 'message': '请先登录！'})

def forget_password(request):
    if request.method == 'GET':
        f = ForgetPasswordForm()
        return render(request, 'blog/forget_password.html', {'form': f})
    if request.method == 'POST':
        f = ForgetPasswordForm(request.POST)
        if f.is_valid():
            username = f.cleaned_data['username']
            email = f.cleaned_data['email']
            try:
                user = UserProfile.objects.all().get(email=email)
                if not user or user.username != username:
                    message = {'message': '用户信息不正确'}
                    data = json.dumps(message,separators=(',',':'))                
                    return JsonResponse(data, safe=False)
                else:
                    user.status = True
                    user.save()
                    message = {'message': '已通知管理员重置密码'}
                    data = json.dumps(message,separators=(',',':'))                
                    return JsonResponse(data, safe=False)
            except UserProfile.DoesNotExist:
                message = {'message': '用户不存在'}
                data = json.dumps(message,separators=(',',':'))                
                return JsonResponse(data, safe=False)
        else:
            message = {'message': '请填写信息'}
            data = json.dumps(message,separators=(',',':'))                
            return JsonResponse(data, safe=False)

