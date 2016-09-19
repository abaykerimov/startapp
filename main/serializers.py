from rest_framework import serializers
from main.models import *
from django.contrib.auth.models import User


class ProjectSerializer(serializers.ModelSerializer):

    class Meta:
        model = Project
        fields = ('id', 'project_name', 'description', 'created_date', 'mission', 'location', 'url', 'date_public', 'team', 'contacts', 'category', 'status')


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('username', 'email', 'first_name', 'last_name')


class UserExtendSerializer(serializers.HyperlinkedModelSerializer):
    users = UserSerializer(source='user')

    class Meta:
        model = UserExtend
        fields = ('users', 'phone', 'position', 'status', 'rank', 'role')


class ProjectUserSerializer(serializers.ModelSerializer):
    #users = serializers.StringRelatedField(many=True)
    #team = serializers.ReadOnlyField(source='user.username')
    #projects = serializers.ReadOnlyField(source='project.project_name')

    class Meta:
        model = ProjectUser
        fields = ('id', 'project', 'user')


class UpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Update
        fields  = ('id', 'heading', 'text', 'update_author', 'update_project')


class CommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = ('id', 'comment', 'comment_date', 'comment_author', 'comment_update')
