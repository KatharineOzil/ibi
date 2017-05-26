from django.contrib import admin
from .models import UserProfile
from .models import Lab
from .models import News
from .models import Tools
from .models import Announcement

# Register your models here.
class UserProfileAdmin(admin.ModelAdmin):
	list_display = ('username', 'email', 'is_staff', 'status')

class NewsAdmin(admin.ModelAdmin):
	list_display = ('title', 'name', 'place', 'lec_time')

admin.site.register(News, NewsAdmin)
admin.site.register(UserProfile, UserProfileAdmin)
admin.site.register(Lab)
admin.site.register(Tools)
admin.site.register(Announcement)
