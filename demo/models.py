# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.db import models


__all__ = ["Water", "Pesticide", "Metal", "Code", "Zone", "Goods"]


class Zone(models.Model):
    """
        地区
    """
    class Meta:
        verbose_name = verbose_name_plural = u"地区"

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
        ("low", "优良"),
        ("middle", "中等"),
        ("high", "污染")
    )

    quality = models.CharField(u"质量", default=u"low", choices=LEVEL, max_length=16)
    value = models.FloatField(u"参数", default=0)
    zone = models.ForeignKey(Zone, verbose_name=u"地区", null=True, blank=True)

    def __unicode__(self):
        return "%s-%s" % (self.quality, self.value)

    @property
    def status_msg(self):
        if self.quality == "low":
            return "优"
        elif self.quality == "middle":
            return "污染"
        else:
            return "中等"

    def save(self, force_insert=False, force_update=False, using=None,
             update_fields=None):
        if self.value < 30:
            self.quality = "low"
        elif self.value > 80:
            self.quality = "high"
        else:
            self.quality = "middle"
        return super(Water, self).save(force_insert=force_insert, force_update=force_update, using=using,
                                       update_fields=update_fields)


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

    @property
    def status_msg(self):
        return str(self.value) + "%"

    def __unicode__(self):
        return "%s-%s" % (self.quality, self.value)

    def save(self, force_insert=False, force_update=False, using=None,
             update_fields=None):
        if self.value < 30:
            self.quality = "low"
        elif self.value > 80:
            self.quality = "high"
        else:
            self.quality = "middle"
        return super(Pesticide, self).save(force_insert=force_insert, force_update=force_update, using=using,
                                       update_fields=update_fields)


class Metal(models.Model):
    """
        金属含量
    """
    class Meta:
        verbose_name = verbose_name_plural = u"土壤盐碱化程度"

    LEVEL = (
        ("low", "低"),
        ("middle", "中"),
        ("high", "高")
    )

    quality = models.CharField(u"级别", default=u"low", choices=LEVEL, max_length=16)
    value = models.FloatField(u"参数", default=0)
    zone = models.ForeignKey(Zone, verbose_name=u"地区", null=True, blank=True)

    @property
    def status_msg(self):
        if self.quality == "low":
            return "轻度"
        elif self.quality == "middle":
            return "重度"
        else:
            return "中度"

    def __unicode__(self):
        return "%s-%s" % (self.quality, self.value)

    def save(self, force_insert=False, force_update=False, using=None,
             update_fields=None):
        if self.value < 30:
            self.quality = "low"
        elif self.value > 80:
            self.quality = "high"
        else:
            self.quality = "middle"

        return super(Metal, self).save(force_insert=force_insert, force_update=force_update, using=using,
                                      update_fields=update_fields)


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


class Rfid(models.Model):

    id = models.CharField(u"ID", default="1", max_length=255, primary_key=True)
    cardId = models.CharField(u"cardID", default="1", max_length=255, null=True, blank=True)
    createtime = models.CharField(u"cardID", default="1", max_length=255, null=True, blank=True)

    def __unicode__(self):
        return self.cardId if self.cardId else ""


class Code(models.Model):
    """
        编码
    """
    class Meta:
        verbose_name = verbose_name_plural = u"数据记录"

    rfid = models.ForeignKey(Rfid, verbose_name=u"rfid", null=True, blank=True)
    goods = models.ForeignKey(Goods, verbose_name=u"蔬菜", null=True, blank=True)
    metal = models.ForeignKey(Metal, verbose_name=u"金属", null=True, blank=True)
    pesticide = models.ForeignKey(Pesticide, verbose_name=u"农药", null=True, blank=True)
    water = models.ForeignKey(Water, verbose_name=u"水", null=True, blank=True)
    zone = models.ForeignKey(Zone, verbose_name=u"地区", null=True, blank=True)
    status = models.IntegerField(u"质量", default=0, null=True, blank=True)
    sale = models.CharField(u"销售地", max_length=32, null=True, blank=True, default="上海")

    def __unicode__(self):
        return self.rfid_id if self.rfid else "无"

    def save(self, force_insert=False, force_update=False, using=None,
             update_fields=None):
        if self.metal and self.pesticide and self.water:
            if self.metal.quality == "low" and self.pesticide.quality == "low" and self.water.quality == "low":
                # 非常好
                self.status = 2
            elif self.metal.quality == "high" and self.pesticide.quality == "high" and self.water.quality == "high":
                self.status = 0
            else:
                self.status = 1
        return super(Code, self).save(force_insert=force_insert, force_update=force_update, using=using, update_fields=update_fields)

    def to_json(self):
        return {
            "name": self.goods.name if self.goods else "无",
            "p_status": self.pesticide.status_msg,
            "m_status": self.metal.status_msg,
            "w_status": self.water.status_msg,
            "status": self.status,
            "zone": self.zone.name,
            "sale": self.sale
        }

