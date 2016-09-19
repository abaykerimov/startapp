from django.http import JsonResponse

from main.models import *
from main.serializers import *
from rest_framework import generics


class ProjectList(generics.ListCreateAPIView):
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer


class ProjectDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer


class UserList(generics.ListCreateAPIView):
    queryset = UserExtend.objects.all()
    serializer_class = UserExtendSerializer


class UserDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = UserExtend.objects.all()
    serializer_class = UserExtendSerializer


class ProjectUserList(generics.ListCreateAPIView):
    queryset = ProjectUser.objects.all()
    serializer_class = ProjectUserSerializer


class ProjectUserDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = ProjectUser.objects.all()
    serializer_class = ProjectUserSerializer


class UpdateList(generics.ListCreateAPIView):
    queryset = Update.objects.all()
    serializer_class = UpdateSerializer


class UpdateDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Update.objects.all()
    serializer_class = UpdateSerializer


class CommentList(generics.ListCreateAPIView):
    queryset = Comment.objects.all()
    serializer_class = CommentSerializer


class CommentDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Comment.objects.all()
    serializer_class = CommentSerializer


def get_1_project_many_user(request):
    result = {}
    tmp = []
    for i in Project.objects.all():
        a = {}
        a['id'] = i.id
        a['project_name'] = i.project_name
        tmp_b = []
        for j in i.project_user.all():
            b ={}
            b['username'] = j.username
            tmp_b.append(b)
        a['users'] = tmp_b
        tmp.append(a)
    result['result'] = tmp
    return JsonResponse(data=result)

