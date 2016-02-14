# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import datetime
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Materia',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Nivel_escolar',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Niveles_dificultad',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('descripcion', models.CharField(max_length=100)),
                ('imagen', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Pregunta',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=300)),
                ('email', models.CharField(max_length=300)),
                ('phone', models.CharField(max_length=300)),
                ('language', models.CharField(max_length=300)),
                ('fecha', models.DateField(default=datetime.date.today)),
                ('user', models.ForeignKey(default=1, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Respuesta',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('titulo', models.CharField(max_length=255)),
                ('fecha', models.DateField(default=datetime.date.today)),
                ('pregunta', models.ForeignKey(to='mozioproject.Pregunta')),
                ('user', models.ForeignKey(default=1, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Tema',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('descripcion', models.CharField(max_length=200)),
                ('imagen', models.CharField(max_length=100)),
                ('materia', models.ForeignKey(to='mozioproject.Materia')),
            ],
        ),
        migrations.CreateModel(
            name='Topico',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('descripcion', models.CharField(max_length=200)),
                ('imagen', models.CharField(max_length=200)),
                ('tema', models.ForeignKey(to='mozioproject.Tema')),
            ],
        ),
        migrations.CreateModel(
            name='Video',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('descripcion_corta', models.CharField(max_length=255)),
                ('descripcion_larga', models.TextField()),
                ('url', models.CharField(max_length=100)),
                ('thumb', models.CharField(max_length=100)),
                ('duracion_aprox', models.TimeField(blank=True)),
                ('nivel_dificultad', models.ForeignKey(to='mozioproject.Niveles_dificultad')),
            ],
        ),
        migrations.AddField(
            model_name='materia',
            name='nivel_escolar',
            field=models.ForeignKey(to='mozioproject.Nivel_escolar'),
        ),
    ]
