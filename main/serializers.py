from rest_framework import serializers
from main.models import *


class UserSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = User
        fields = ('avatar', 'username', 'fullname', 'email', 'phone', 'position', 'status', 'rank', 'role')


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