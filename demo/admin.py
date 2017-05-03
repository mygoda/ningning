# -*- coding:utf-8 -*-
import inspect
from django.contrib import admin
from django.http import HttpResponseRedirect

from . import models
# Register your models here.

URL = "http://qr.liantu.com/api.php?&w=200&text=http://103.241.231.154:8888/result/?number="


class CodeAdmin(admin.ModelAdmin):

    list_display = ["rfid_show", "status"]

    def rfid_show(self, obj):
        return obj.rfid.cardId if obj.rfid else obj.code
    rfid_show.short_description = u"rfid"

    def response_add(self, request, obj, post_url_continue=None):
        return HttpResponseRedirect("%s%s" % (URL, obj.code))


for model_name, obj in inspect.getmembers(models):
    if inspect.isclass(obj):
        if model_name == "Code":
            admin.site.register(obj, CodeAdmin)
        else:
            admin.site.register(obj)