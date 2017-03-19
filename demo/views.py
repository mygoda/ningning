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
    q = req.GET.get("q")
    q_type = req.GET.get("q_type", "code")
    codes = []
    if not q:
        codes = Code.objects.all()
    if q and q_type == "code":
        codes = Code.objects.filter(code__icontains=q)
    elif q and q_type == "zone":
        codes = Code.objects.filter(zone__name__icontains=q)
    elif q and q_type == "good":
        codes = Code.objects.filter(goods__name__icontains=q)
    data = [code.to_json() for code in codes]
    return JsonResponse({"status": 1, "data": data})






