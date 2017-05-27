from django.contrib import admin
from .models import UserProfile
from .models import Lab
from .models import News
from .models import Tools
from .models import Announcement
from .models import Graduate

# Register your models here.
class UserProfileAdmin(admin.ModelAdmin):
	list_display = ('username', 'email', 'is_staff', 'status')

class AnnAdmin(admin.ModelAdmin):
	list_display = ('title', 'name', 'place', 'lec_time')

class GraduateAdmin(admin.ModelAdmin):
	list_display = ('name', 'reg_year', 'status')

admin.site.register(News)
admin.site.register(UserProfile, UserProfileAdmin)
admin.site.register(Lab)
admin.site.register(Tools)
admin.site.register(Announcement, AnnAdmin)
admin.site.register(Graduate, GraduateAdmin)
