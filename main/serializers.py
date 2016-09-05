from rest_framework import serializers
from main.models import *
from django.contrib.auth.models import User


class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = ('id', 'project_name', 'description', 'team', 'contacts')