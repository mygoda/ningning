# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Code',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('code', models.CharField(default='1', max_length=32, verbose_name='\u7f16\u7801')),
                ('status', models.CharField(max_length=16, null=True, verbose_name='\u72b6\u6001', blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='Metal',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('quality', models.CharField(default='low', max_length=16, verbose_name='\u7ea7\u522b', choices=[('low', '\u4f4e'), ('middle', '\u4e2d'), ('high', '\u9ad8')])),
                ('value', models.FloatField(default=0, verbose_name='\u53c2\u6570')),
            ],
        ),
        migrations.CreateModel(
            name='Pesticide',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('quality', models.CharField(default='low', max_length=16, verbose_name='\u7ea7\u522b', choices=[('low', '\u4f4e'), ('middle', '\u4e2d'), ('high', '\u9ad8')])),
                ('value', models.FloatField(default=0, verbose_name='\u53c2\u6570')),
            ],
        ),
        migrations.CreateModel(
            name='Water',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('quality', models.CharField(default='low', max_length=16, verbose_name='\u8d28\u91cf', choices=[('low', '\u5dee'), ('middle', '\u4e2d\u7b49'), ('high', '\u4f18\u826f')])),
                ('value', models.FloatField(default=0, verbose_name='\u53c2\u6570')),
            ],
        ),
        migrations.AddField(
            model_name='code',
            name='metal',
            field=models.ForeignKey(verbose_name='\u91d1\u5c5e', blank=True, to='demo.Metal', null=True),
        ),
        migrations.AddField(
            model_name='code',
            name='pesticide',
            field=models.ForeignKey(verbose_name='\u519c\u836f', blank=True, to='demo.Pesticide', null=True),
        ),
        migrations.AddField(
            model_name='code',
            name='water',
            field=models.ForeignKey(verbose_name='\u6c34', blank=True, to='demo.Water', null=True),
        ),
    ]
