# -*- coding:utf-8 -*-
import inspect
from django.contrib import admin
from . import models
# Register your models here.
for model_name, obj in inspect.getmembers(models):
    if inspect.isclass(obj):
        admin.site.register(obj)