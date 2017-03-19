# -*- coding:utf-8 -*-
import json

error_dict = {}


class ServerError(Exception):

    def __init__(self, code, *args):
        self.code = code
        self.msg = error_dict[code]

    def __str__(self):
        return json.dumps({"code": self.code, "msg": self.msg, "data": {}})

    def json(self):
        return {"code": self.code, "msg": self.msg, "data": {}}

error_dict[1] = u"没有权限,无法执行该请求"
