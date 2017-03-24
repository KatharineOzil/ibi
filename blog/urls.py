# -*- coding:utf-8 -*-

from django.conf.urls import url
from . import views
from material.frontend import urls as frontend_urls
from django.conf.urls import include
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'', include(frontend_urls)),
    url(r'^$', views.index, name='index'),
    url(r'^index$', views.index, name='index'),
    url(r'^user_detail$', views.user_detail, name='user_detail'),    
    url(r'^register$', views.user_register, name='user_register'),
    url(r'^login$', views.user_login, name='user_login'),
    url(r'^sci_news$', views.sci_news, name='sci_news'),
    url(r'^direction$', views.direction, name='direction'),
    url(r'^team$', views.team, name='team'),
    url(r'^tools$', views.tools, name='tools'),
    url(r'^logout$', views.user_logout, name='user_logout',),
    url(r'^change_password$', views.change_password, name='change_password',),
    url(r'^forget_password$', views.forget_password, name='forget_password',),
    url(r'^search$', views.search, name='search',),
    url(r'^news$', views.news, name='news',),
    url(r'^announcement$', views.announcement, name='announcement',),
    url(r'^ajax_fp$', views.forget_password, name='ajax-fp',),
]
