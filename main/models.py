# coding=utf8
from django.db import models
from django.contrib.auth.models import User
# Create your models here.


class UserExtend(models.Model):
    user = models.ForeignKey(User)
    avatar = models.CharField(verbose_name=u'Аватар', max_length=200, blank=True, null=True)
    phone = models.CharField(verbose_name=u'Телефон', max_length=20, blank=True, null=True, unique=True)
    position = models.CharField(verbose_name=u'Должность', max_length=200)
    status = models.CharField(verbose_name=u'Статус', max_length=200, blank=True, null=True)
    rank = models.CharField(verbose_name=u'Ранг', max_length=200, blank=True, null=True)
    role = models.CharField(verbose_name=u'Роль', max_length=200, blank=True, null=True)

    class Meta:
        verbose_name = u'Пользователь'
        verbose_name_plural = u'Пользователи'

    def __str__(self):
        return self.username


class ProjectUser(models.Model):
    isCreator = models.BooleanField(default=False)
    project = models.ForeignKey('main.Project')
    user = models.ForeignKey(User)

    class Meta:
        verbose_name = u'Пользователи в проектах'
        verbose_name_plural = u'Пользователи в проектах'


class Category(models.Model):
    category_name = models.CharField(verbose_name=u'Категория', max_length=200)

    class Meta:
        ordering = ('category_name', )
        verbose_name = u'Категория'
        verbose_name_plural = u'Категории'

    def __str__(self):
        return self.category_name


class Project(models.Model):
    STATUS_CHOICES = (
        (0, u'To Do'),
        (1, u'Doing'),
        (2, u'Done'),
        (3, u'Testing'),
        (4, u'Complete')
    )
    category = models.ForeignKey(Category)
    project_name = models.CharField(verbose_name=u'Название проекта', max_length=200, unique=True)
    description = models.TextField(verbose_name=u'Описание проекта')
    created_date = models.DateTimeField(auto_now_add=True)
    mission = models.CharField(verbose_name=u'Миссия проекта', max_length=400, blank=True, null=True)
    location = models.CharField(verbose_name=u'Расположение', max_length=200, blank=True, null=True)
    url = models.CharField(verbose_name=u'Ссылка на проект', max_length=200, blank=True, null=True)
    date_public = models.DateTimeField(verbose_name=u'Дата основания', blank=True, null=True)
    target = models.CharField(verbose_name=u'Целевая аудитория', max_length=200)
    team = models.TextField(verbose_name=u'Участники проекта')
    contacts = models.CharField(verbose_name=u'Контакты', max_length=400)
    status = models.IntegerField(verbose_name=u'Статус проекта', choices=STATUS_CHOICES)
    project_user = models.ManyToManyField(to=User, verbose_name=u'Команда проекта', through=ProjectUser)

    class Meta:
        ordering = ('project_name', )
        verbose_name = u'Проект'
        verbose_name_plural = u'Проекты'

    def __str__(self):
        return self.project_name


class Update(models.Model):
    update_author = models.ForeignKey(User, verbose_name=u'Автор новости')
    update_project = models.ForeignKey(Project, verbose_name=u'Проект')
    heading = models.CharField(verbose_name=u'Заголовок', max_length=200, unique=True)
    text = models.TextField(verbose_name=u'Тело')
    pub_date = models.DateTimeField(auto_now_add=True)
    isNotification = models.BooleanField(default=False)

    class Meta:
        ordering = ('heading', )
        verbose_name = u'Новость'
        verbose_name_plural = u'Новости'

    def __str__(self):
        return self.heading


class ChannelUser(models.Model):
    isCreator = models.BooleanField(default=False)
    channel = models.ForeignKey('main.Channel')
    user = models.ForeignKey(User)


class Channel(models.Model):
    channel_project = models.ForeignKey(Project, verbose_name=u'Проект')
    channel_name = models.CharField(verbose_name=u'Канал', max_length=200)
    open_date = models.DateTimeField(auto_now_add=True)
    close_date = models.DateTimeField()
    isArchived = models.BooleanField(default=False)
    channel_user = models.ManyToManyField(to=User, verbose_name=u'Участники канала', through=ChannelUser)

    class Meta:
        ordering = ('channel_name', )
        verbose_name = u'Канал'
        verbose_name_plural = u'Каналы'

    def __str__(self):
        return self.channel_name


class Chat(models.Model):
    message_author = models.ForeignKey(User, verbose_name=u'Автор сообщения')
    message_project = models.ForeignKey(Project)
    message_channel = models.ForeignKey(Channel)
    message = models.CharField(max_length=500)
    message_date = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ('message', )
        verbose_name = u'Сообщение'
        verbose_name_plural = u'Сообщения'

    def __str__(self):
        return self.message


class Comment(models.Model):
    comment_author = models.ForeignKey(User, verbose_name=u'Автор комментария')
    comment_update = models.ForeignKey(Update, verbose_name=u'Новость')
    comment = models.CharField(verbose_name=u'Коммент', max_length=500)
    comment_date = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ('comment', )
        verbose_name = u'Коммент'
        verbose_name_plural = u'Комментарии'

    def __str__(self):
        return self.comment


class Notification(models.Model):
    to_user = models.ForeignKey(User)
    notification = models.CharField(verbose_name=u'Оповещение', max_length=200)
    notification_date = models.DateTimeField()

    class Meta:
        ordering = ('notification', )
        verbose_name = u'Оповещение'
        verbose_name_plural = u'Оповещения'

    def __str__(self):
        return self.notification


class SubscribeProject(models.Model):
    subscribe_author = models.ForeignKey(User)
    subscribe_project = models.ForeignKey(Project)
    subscribe_date = models.DateTimeField(auto_now_add=True)


class Like(models.Model):
    like_author = models.ForeignKey(User)
    like_update = models.ForeignKey(Update)
    like_date = models.DateTimeField(auto_now_add=True)