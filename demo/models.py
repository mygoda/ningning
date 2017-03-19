# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.db import models


__all__ = ["Water", "Pesticide", "Metal", "Code", "Zone", "Goods"]


class Zone(models.Model):
    """
        地区
    """
    LEVEL = (
        ("low", "优"),
        ("middle", "良好"),
        ("high", "污染")
    )

    name = models.CharField(u"产地", max_length=16, default="黑龙江", null=True, blank=True)
    source = models.CharField(u"环境污染", default=u"low", choices=LEVEL, max_length=16)
    work = models.BooleanField(u"有无工业", default=False)

    def __unicode__(self):
        return self.name


class Water(models.Model):
    """
        水
    """
    class Meta:
        verbose_name = verbose_name_plural = u"水资源"
    LEVEL = (
        ("low", "差"),
        ("middle", "中等"),
        ("high", "优良")
    )

    quality = models.CharField(u"质量", default=u"low", choices=LEVEL, max_length=16)
    value = models.FloatField(u"参数", default=0)
    zone = models.ForeignKey(Zone, verbose_name=u"地区", null=True, blank=True)

    def __unicode__(self):
        return "%s-%s" % (self.quality, self.value)


class Pesticide(models.Model):
    """
        农药
    """
    class Meta:
        verbose_name = verbose_name_plural = u"农药"

    LEVEL = (
        ("low", "低"),
        ("middle", "中"),
        ("high", "高")
    )

    quality = models.CharField(u"级别", default=u"low", choices=LEVEL, max_length=16)
    value = models.FloatField(u"参数", default=0)
    zone = models.ForeignKey(Zone, verbose_name=u"地区", null=True, blank=True)

    def __unicode__(self):
        return "%s-%s" % (self.quality, self.value)


class Metal(models.Model):
    """
        金属含量
    """
    class Meta:
        verbose_name = verbose_name_plural = u"金属含量"

    LEVEL = (
        ("low", "低"),
        ("middle", "中"),
        ("high", "高")
    )

    quality = models.CharField(u"级别", default=u"low", choices=LEVEL, max_length=16)
    value = models.FloatField(u"参数", default=0)
    zone = models.ForeignKey(Zone, verbose_name=u"地区", null=True, blank=True)

    def __unicode__(self):
        return "%s-%s" % (self.quality, self.value)


class Goods(models.Model):
    """
        蔬菜
    """
    class Meta:
        verbose_name = verbose_name_plural = u"蔬菜"

    name = models.CharField(u"蔬菜名称", max_length=16, null=True, blank=True, default="蔬菜")
    zone = models.ForeignKey(Zone, verbose_name=u"地区", null=True, blank=True)

    def __unicode__(self):
        return "%s-%s" % (self.name, self.zone)


class Code(models.Model):
    """
        编码
    """

    code = models.CharField(u"编码", default="1", max_length=32)
    goods = models.ForeignKey(Goods, verbose_name=u"蔬菜", null=True, blank=True)
    metal = models.ForeignKey(Metal, verbose_name=u"金属", null=True, blank=True)
    pesticide = models.ForeignKey(Pesticide, verbose_name=u"农药", null=True, blank=True)
    water = models.ForeignKey(Water, verbose_name=u"水", null=True, blank=True)
    zone = models.ForeignKey(Zone, verbose_name=u"地区", null=True, blank=True)
    status = models.CharField(u"状态", max_length=16, null=True, blank=True)

    def __unicode__(self):
        return self.code
