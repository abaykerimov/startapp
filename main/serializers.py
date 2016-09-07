from rest_framework import serializers
from main.models import *
from django.contrib.auth.models import User


class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = ('id', 'project_name', 'description', 'created_date', 'mission', 'location', 'url', 'date_public', 'team', 'contacts', 'category', 'status')