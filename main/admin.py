from django.contrib import admin
from main.models import User, Project, Update, ProjectUser
# Register your models here.

"""
class UserAdmin(admin.ModelAdmin):
    list_display = ('fullname', 'email')


class ProjectAdmin(admin.ModelAdmin):
    list_display = ('project_name', 'created_date')


class ProjectUserAdmin(admin.ModelAdmin):
    list_display = ('project', 'user')
    list_select_related = ('project', 'user')


admin.site.register(User, UserAdmin)
admin.site.register(Project, ProjectAdmin)
admin.site.register(ProjectUser, ProjectUserAdmin)
"""