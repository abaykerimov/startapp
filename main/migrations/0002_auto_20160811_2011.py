# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-08-11 14:11
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Project',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('project_name', models.CharField(max_length=200, unique=True, verbose_name='Название проекта')),
                ('description', models.TextField(verbose_name='Описание проекта')),
                ('created_date', models.DateTimeField()),
            ],
            options={
                'verbose_name': 'Проект',
                'ordering': ('project_name',),
                'verbose_name_plural': 'Проекты',
            },
        ),
        migrations.CreateModel(
            name='ProjectUser',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('isCreator', models.BooleanField(default=False)),
                ('project', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.Project')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.User')),
            ],
        ),
        migrations.AddField(
            model_name='project',
            name='project_user',
            field=models.ManyToManyField(through='main.ProjectUser', to='main.User', verbose_name='Команда проекта'),
        ),
    ]
