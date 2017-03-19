# -*- coding: utf-8 -*-
import json
from django.http import JsonResponse
from demo.models import *

def index(req):
    """
        首页
    :param req:
    :return:
    """
    seach = req.GET.get("search")
    if seach:
        code = Code.objects.filter(code__icontains=seach)



