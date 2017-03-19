# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('demo', '0002_auto_20170319_0724'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='code',
            options={'verbose_name': '\u6570\u636e\u8bb0\u5f55', 'verbose_name_plural': '\u6570\u636e\u8bb0\u5f55'},
        ),
        migrations.AlterModelOptions(
            name='zone',
            options={'verbose_name': '\u5730\u533a', 'verbose_name_plural': '\u5730\u533a'},
        ),
        migrations.AlterField(
            model_name='code',
            name='status',
            field=models.IntegerField(default=0, null=True, verbose_name='\u8d28\u91cf', blank=True),
        ),
    ]
