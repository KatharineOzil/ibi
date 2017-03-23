from django.contrib import admin
from .models import Article
from .models import UserProfile
from .models import ArticleCategory

# Register your models here.

class UserProfileAdmin(admin.ModelAdmin):
	list_display = ('username', 'status')

class ArticleAdmin(admin.ModelAdmin):
	list_display = ('title', 'category', 'created_date')

admin.site.register(Article, ArticleAdmin)
admin.site.register(UserProfile, UserProfileAdmin)
admin.site.register(ArticleCategory)
