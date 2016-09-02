from rest_framework import serializers
from main.models import *
from django.contrib.auth.models import User


class UserSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email')


class ProjectSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Project
        fields = ('project_name', 'description', 'created_date')


class UpdateSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Update
        fields = ('update_author', 'update_project', 'heading', 'text', 'pub_date', 'isNotification')


class CommentSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Comment
        fields = ('comment_author', 'comment_update', 'comment', 'comment_date')