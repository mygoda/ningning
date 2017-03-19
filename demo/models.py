# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.db import models


__all__ = ["Water", "Pesticide", "Metal", "Code"]


class Water(models.Model):
    """
        水
    """
    LEVEL = (
        ("low", "差"),
        ("middle", "中等"),
        ("high", "优良")
    )

    quality = models.CharField(u"质量", default=u"low", choices=LEVEL, max_length=16)

    value = models.FloatField(u"参数", default=0)

    def __unicode__(self):
        return "%s-%s" % (self.quality, self.value)


class Pesticide(models.Model):
    """
        农药
    """

    LEVEL = (
        ("low", "低"),
        ("middle", "中"),
        ("high", "高")
    )

    quality = models.CharField(u"级别", default=u"low", choices=LEVEL, max_length=16)

    value = models.FloatField(u"参数", default=0)

    def __unicode__(self):
        return "%s-%s" % (self.quality, self.value)


class Metal(models.Model):
    """
        金属含量
    """

    LEVEL = (
        ("low", "低"),
        ("middle", "中"),
        ("high", "高")
    )

    quality = models.CharField(u"级别", default=u"low", choices=LEVEL, max_length=16)

    value = models.FloatField(u"参数", default=0)

    def __unicode__(self):
        return "%s-%s" % (self.quality, self.value)


class Code(models.Model):
    """
        编码
    """

    code = models.CharField(u"编码", default="1", max_length=32)
    metal = models.ForeignKey(Metal, verbose_name=u"金属", null=True, blank=True)
    pesticide = models.ForeignKey(Pesticide, verbose_name=u"农药", null=True, blank=True)
    water = models.ForeignKey(Water, verbose_name=u"水", null=True, blank=True)

    status = models.CharField(u"状态", max_length=16, null=True, blank=True)

    def __unicode__(self):
        return self.code
