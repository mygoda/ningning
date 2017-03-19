# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('demo', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Goods',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default='\u852c\u83dc', max_length=16, null=True, verbose_name='\u852c\u83dc\u540d\u79f0', blank=True)),
            ],
            options={
                'verbose_name': '\u852c\u83dc',
                'verbose_name_plural': '\u852c\u83dc',
            },
        ),
        migrations.CreateModel(
            name='Zone',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default='\u9ed1\u9f99\u6c5f', max_length=16, null=True, verbose_name='\u4ea7\u5730', blank=True)),
                ('source', models.CharField(default='low', max_length=16, verbose_name='\u73af\u5883\u6c61\u67d3', choices=[('low', '\u4f18'), ('middle', '\u826f\u597d'), ('high', '\u6c61\u67d3')])),
                ('work', models.BooleanField(default=False, verbose_name='\u6709\u65e0\u5de5\u4e1a')),
            ],
        ),
        migrations.AlterModelOptions(
            name='metal',
            options={'verbose_name': '\u91d1\u5c5e\u542b\u91cf', 'verbose_name_plural': '\u91d1\u5c5e\u542b\u91cf'},
        ),
        migrations.AlterModelOptions(
            name='pesticide',
            options={'verbose_name': '\u519c\u836f', 'verbose_name_plural': '\u519c\u836f'},
        ),
        migrations.AlterModelOptions(
            name='water',
            options={'verbose_name': '\u6c34\u8d44\u6e90', 'verbose_name_plural': '\u6c34\u8d44\u6e90'},
        ),
        migrations.AddField(
            model_name='goods',
            name='zone',
            field=models.ForeignKey(verbose_name='\u5730\u533a', blank=True, to='demo.Zone', null=True),
        ),
        migrations.AddField(
            model_name='code',
            name='goods',
            field=models.ForeignKey(verbose_name='\u852c\u83dc', blank=True, to='demo.Goods', null=True),
        ),
        migrations.AddField(
            model_name='code',
            name='zone',
            field=models.ForeignKey(verbose_name='\u5730\u533a', blank=True, to='demo.Zone', null=True),
        ),
        migrations.AddField(
            model_name='metal',
            name='zone',
            field=models.ForeignKey(verbose_name='\u5730\u533a', blank=True, to='demo.Zone', null=True),
        ),
        migrations.AddField(
            model_name='pesticide',
            name='zone',
            field=models.ForeignKey(verbose_name='\u5730\u533a', blank=True, to='demo.Zone', null=True),
        ),
        migrations.AddField(
            model_name='water',
            name='zone',
            field=models.ForeignKey(verbose_name='\u5730\u533a', blank=True, to='demo.Zone', null=True),
        ),
    ]
