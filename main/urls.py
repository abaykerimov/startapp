from django.conf.urls import url
from rest_framework.urlpatterns import format_suffix_patterns
from main import views

urlpatterns = [
    url(r'^projects/$', views.ProjectList.as_view()),
    url(r'^projects/(?P<pk>[0-9]+)/$', views.ProjectDetail.as_view()),
    url(r'^users/$', views.UserList.as_view()),
    url(r'^users/(?P<pk>[0-9]+)/$', views.UserDetail.as_view()),
    url(r'^team/$', views.ProjectUserList.as_view()),
    url(r'^team/(?P<pk>[0-9]+)/$', views.ProjectUserDetail.as_view()),
    url(r'^updates/$', views.UpdateList.as_view()),
    url(r'^updates/(?P<pk>[0-9]+)/$', views.UpdateDetail.as_view()),
    url(r'^comments/$', views.CommentList.as_view()),
    url(r'^comments/(?P<pk>[0-9]+)/$', views.CommentDetail.as_view()),
    url(r'^getUsers/$', views.get_1_project_many_user),

]

urlpatterns = format_suffix_patterns(urlpatterns)