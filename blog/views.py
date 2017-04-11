# -*- coding:utf-8 -*-
from django.shortcuts import render, HttpResponseRedirect, render_to_response
from .models import UserProfile
from .models import Lab
from .models import News
from .models import Announcement
from .models import Tools
from .forms import UserRegisterForm, UserLoginForm, UserChangePasswordForm, UserDetailForm, SearchForm, ForgetPasswordForm
from django.contrib.auth.decorators import permission_required
from django.http import HttpResponse
from django.contrib.auth.hashers import make_password, check_password
from itertools import chain
from django.db.models import Q
from django.db import connection
from django.contrib import messages
import json
from django.http import JsonResponse
from django.utils.translation import ugettext as _
from .pinyin import PinYin
from django.utils.translation import LANGUAGE_SESSION_KEY
from django.template import RequestContext
from django.template.context_processors import i18n

# Create your views here.
def index(request, lang=None):
    return_result = {}
    news = News.objects.all().order_by('-id')[:1]
    announcement = Announcement.objects.all().order_by('-id')[:1]
    return_result.update({'news': news, 'announcement': announcement})

    if request.session.get('username', None) and request.session.get('email', None) and request.session.get('username_pin', None):
        username = request.session['username']
        email = request.session['email']
        username_pin = request.session['username_pin']
        return_result.update({'username': username, 'email': email, 'username_pin': username_pin})
    else:
        pass

    f = SearchForm()
    return_result.update({'form': f})
    return_result.update({'LANGUAGE_CODE': request.LANGUAGE_CODE})
    return render(request, 'blog/index.html', return_result)

def news(request):
    return_result = {}
    if request.session.get('username', None) and request.session.get('email', None) and request.session.get('username_pin', None):
        username = request.session['username']
        email = request.session['email']
        username_pin = request.session['username_pin']
        return_result.update({'username': username, 'email': email, 'username_pin': username_pin})
    else:
        pass

    news = News.objects.all().order_by('-id')
    return_result.update({'news': news})
    return render(request, 'blog/news.html', return_result)

def announcement(request):
    return_result = {}
    if request.session.get('username', None) and request.session.get('email', None) and request.session.get('username_pin', None):
        username = request.session['username']
        email = request.session['email']
        username_pin = request.session['username_pin']
        return_result.update({'username': username, 'email': email, 'username_pin': username_pin})
    else:
        pass

    announcement = Announcement.objects.all().order_by('-id')
    return_result.update({'announcement': announcement})
    return render(request, 'blog/announcement.html', return_result)

def sci_news(request):
    return_result = {}
    if request.session.get('username', None) and request.session.get('email', None) and request.session.get('username_pin', None):
        username = request.session['username']
        email = request.session['email']
        username_pin = request.session['username_pin']
        return_result.update({'username': username, 'email': email, 'username_pin': username_pin})
    else:
        pass

    user_result = UserProfile.objects. all().values('works', 'patent', 'article', 'username')
    return_result.update({'user_result': user_result})
    return render(request, 'blog/sci_news.html', return_result)

def direction(request):
    return_result = {}
    if request.session.get('username', None) and request.session.get('email', None) and request.session.get('username_pin', None):
        username = request.session['username']
        email = request.session['email']
        username_pin = request.session['username_pin']
        return_result.update({'username': username, 'email': email, 'username_pin': username_pin})
    else:
        pass

    direction = Lab.objects.all()
    return_result.update({'direction': direction})
    for a in direction:
        c = a.user.all()
        a.users = str(c).replace('UserProfile:','').replace('QuerySet','')
        a.users_pin = ""
        for b in c:
            a.users_pin += "<"+b.username_pin+">"

    return render(request, 'blog/direction.html', return_result)

def team(request):
    return_result = {}
    if request.session.get('username', None) and request.session.get('email', None) and request.session.get('username_pin', None):
        username = request.session['username']
        email = request.session['email']
        username_pin = request.session['username_pin']
        return_result.update({'username': username, 'email': email, 'username_pin': username_pin})
    else:
        pass

    team = UserProfile.objects.all()
    return_result.update({'team': team})
    b = ''
    for a in team:
        a.photo = str(a.photo).replace('blog/', '', 1)
    
    return render(request, 'blog/team.html', return_result)

def tools(request):
    return_result = {}
    if request.session.get('username', None) and request.session.get('email', None) and request.session.get('username_pin', None):
        username = request.session['username']
        email = request.session['email']
        username_pin = request.session['username_pin']
        return_result.update({'username': username, 'email': email, 'username_pin': username_pin})
    else:
        pass

    tools = Tools.objects.all()
    return_result.update({'tools': tools})
    for a in tools:
        if a.attachment:
            a.attachment = str(a.attachment).replace('blog/', '', 1)
        else:
            pass
    return render(request, 'blog/tools.html', return_result)
    

def search(request):
    return_result = {}
    if request.session.get('username', None) and request.session.get('email', None) and request.session.get('username_pin', None):
        username = request.session['username']
        email = request.session['email']
        username_pin = request.session['username_pin']
        return_result.update({'username': username, 'email': email, 'username_pin': username_pin})
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
            result_ann = Announcement.objects.filter( Q(title__contains=search) )
            result_news = News.objects.filter( Q(title__contains=search) | Q(text__contains=search) | Q(name__contains=search) | Q(place__contains=search))
            result_tools = Tools.objects.filter( Q(title__contains=search) | Q(text__contains=search))
            #result_room = Lab.objects.filter( Q(name__contains=search) | Q(direction__contains=search))
            #result_user = UserProfile.objects.filter( Q(username__contains=search) | Q(information__contains=search) | Q(patent__contains=search) | Q(project__contains=search) | Q(works__contains=search) | Q(article__contains=search))
            #result = chain(result_user, result_ann, result_room, result_tools, result_news)
            result = chain(result_ann, result_tools, result_news)
            return_result.update({'form': f, 'result': result})
            return render(request, 'blog/search.html',return_result)
        else:
            return_result.update({'form': f})
            return render(request, 'blog/index.html', return_result)

def user_detail(request):
    return_result = {}
    if request.session.get('username', None) and request.session.get('email', None) and request.session.get('username_pin', None):
        username = request.session['username']
        email = request.session['email']
        username_pin = request.session['username_pin']
        return_result.update({'username': username, 'email': email, 'username_pin': username_pin})
    else:
        return HttpResponseRedirect('login')#alert login
    
    if request.method == 'GET':
        user = UserProfile.objects.all().get(email=email)
        user_detail = UserProfile.objects.filter(email=email)
        return_result.update({'user': user_detail})
        photo_url = str(user.photo)
        photo_url = photo_url.replace('blog/', '', 1)
        f = UserDetailForm({'category': user.category, 'job_title': user.job_title, 'education': user.education, 'photo': user.photo, 'information': user.information, 'project': user.project, 'patent': user.patent, 'article': user.article, 'works': user.works, 'introduction_en': user.introduction_en})
        return_result.update({'form': f})
        return_result.update({'photo_url' : photo_url})
        return render(request, 'blog/user_detail.html', return_result)
    if request.method == 'POST':
        f = UserDetailForm(request.POST, request.FILES)
        if f.is_valid():
            category = f.cleaned_data['category']
            job_title = f.cleaned_data['job_title']
            education = f.cleaned_data['education']
            information = f.cleaned_data['information']
            project = f.cleaned_data['project']
            patent = f.cleaned_data['patent']
            works = f.cleaned_data['works']
            article = f.cleaned_data['article']
            introduction_en = f.cleaned_data['introduction_en']
            user_update = UserProfile.objects.filter(email=email).update(category=category, job_title=job_title, education=education, information=information, project=project, patent=patent, works=works, article=article, introduction_en=introduction_en)

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
            output = _("请填写信息")
            message = {'message': output}
            data = json.dumps(message,separators=(',',':'))                
            return JsonResponse(data, safe=False)
            #return render(request, 'blog/register.html', {'form': f})
        else:
            username = f.cleaned_data['username']
            password = f.cleaned_data['password']
            password_confirm = f.cleaned_data['password_confirm']
            email = f.cleaned_data['email']
            if not UserProfile.objects.all().filter(email=email):
                text=PinYin('blog/data/word.data')
                text.load_word()
                user = map(str.upper, text.hanzi2pinyin(username))
                username_pin = '%s %s' % (''.join(user[1:]), user[0])
                UserProfile.objects.create(username=username, username_pin=username_pin, password=password,email=email)
                output = _("注册成功！请等待管理员审核")
                message = {'message': output}
                data = json.dumps(message,separators=(',',':'))  
                return JsonResponse(data, safe=False)
                #return render(request, 'blog/register.html', {'message': '注册成功！请等待管理员审核', 'form': f}) 
            output = _("该邮箱已被注册，有疑问请联系管理员")
            message = {'message': output}
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
                    request.session['username_pin'] = user.username_pin
                    check = check_password(password, user.password)
                    if check:
                        message = {}
                        data = json.dumps(message,separators=(',',':'))                
                        return JsonResponse(data, safe=False)
                    else:
                        output = _("用户名或密码错误")
                        message = {'message': output}
                        data = json.dumps(message,separators=(',',':'))                
                        return JsonResponse(data, safe=False)
                        #return render(request, 'blog/login.html', {'message': '用户名或密码错误,请重新登录', 'form': f}) 
                else:
                    output = _("注册未被审核，请联系管理员")
                    message = {'message': output}
                    data = json.dumps(message,separators=(',',':'))                
                    return JsonResponse(data, safe=False)
                    #return render(request, 'blog/login.html', {'message': '注册未被审核，请联系管理员', 'form': f}) 
            else:
                output = _('该用户未注册')
                message = {'message': output}
                data = json.dumps(message,separators=(',',':'))                
                return JsonResponse(data, safe=False)
                #return render(request, 'blog/login.html', {'message': '该用户未注册', 'form': f}) 
        else:
            output = _('请填写信息')
            message = {'message': output}
            data = json.dumps(message,separators=(',',':'))                
            return JsonResponse(data, safe=False)
            #return render(request, 'blog/login.html', {'form': f})

def user_logout(request):#TTTTTTTTODO
    try:
        del request.session['username']
        del request.session['email']
        del request.session['username_pin']
    except KeyError:
        pass

    return render(request, 'blog/index.html', {'message': '注销成功！'}) #alert????

def change_password(request):
    #TODO username in header
    if request.session.get('username', None) and request.session.get('email', None) and request.session.get('username_pin', None):
        username = request.session['username']
        email = request.session['email']
        username_pin = request.session['username_pin']
        if request.method == 'GET':
            f = UserChangePasswordForm()
            return render(request, 'blog/change_password.html', {'username': username, 'email': email, 'form': f, 'username_pin': username_pin})
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
                    output = _('修改成功')
                    message = {'message': output}
                    data = json.dumps(message,separators=(',',':'))                
                    return JsonResponse(data, safe=False)
                    #return render(request, 'blog/change_password.html', {'message': '修改成功！', 'form': f})#alert success & loginagain???
                else:
                    output = _('旧密码输入错误')
                    message = {'message': output}
                    data = json.dumps(message,separators=(',',':'))                
                    return JsonResponse(data, safe=False)
                    #return render(request, 'blog/change_password.html', {'message': '旧密码输入错误！', 'form': f})
            else:
                output = _('请填写信息')
                message = {'message': output}
                data = json.dumps(message,separators=(',',':'))                
                return JsonResponse(data, safe=False)
                #return render_to_response('blog/index.html',{'username':username, 'email':email})
    else:
        return render(request, 'blog/login.html', {'form': UserLoginForm()})

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
                    output = _('用户信息不正确')
                    message = {'message': output}
                    data = json.dumps(message,separators=(',',':'))                
                    return JsonResponse(data, safe=False)
                else:
                    user.status = '需重置密码'
                    user.save()
                    output = _('已通知管理员重置密码')
                    message = {'message': output}
                    data = json.dumps(message,separators=(',',':'))                
                    return JsonResponse(data, safe=False)
            except UserProfile.DoesNotExist:
                output = _('用户不存在')
                message = {'message': output}
                data = json.dumps(message,separators=(',',':'))                
                return JsonResponse(data, safe=False)
        else:
            output = _('请填写信息')
            message = {'message': output}
            data = json.dumps(message,separators=(',',':'))                
            return JsonResponse(data, safe=False)

