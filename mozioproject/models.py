from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

import datetime

# Create your models here.

class Nivel_escolar(models.Model):
	nombre=models.CharField(max_length=100)

	def __str__(self):
		return self.nombre


class Materia(models.Model):
	nombre=models.CharField(max_length=100)
	nivel_escolar=models.ForeignKey(Nivel_escolar)

	def __str__(self):
		return self.nombre


class Tema(models.Model):
	descripcion = models.CharField(max_length=200)
	imagen = models.CharField(max_length=100)
	materia = models.ForeignKey(Materia)

	def __str__(self):
		return self.descripcion


class Topico(models.Model):
	descripcion=models.CharField(max_length=200)
	imagen=models.CharField(max_length=200)
	tema = models.ForeignKey(Tema)

	def __str__(self):
		return self.descripcion

class Niveles_dificultad(models.Model):
	descripcion=models.CharField(max_length=100)
	imagen=models.CharField(max_length=200)

	def __str__(self):
		return self.descripcion

class Video(models.Model):
	descripcion_corta = models.CharField(max_length=255)
	descripcion_larga = models.TextField()
	url = models.CharField(max_length=100)
	thumb = models.CharField(max_length=100)
	duracion_aprox=models.TimeField(auto_now_add=False, blank=True)
	nivel_dificultad=models.ForeignKey(Niveles_dificultad)

	def __str__(self):
		return self.descripcion_corta

class Pregunta(models.Model):
	name=models.CharField(max_length=300)
	email=models.CharField(max_length=300)
	phone=models.CharField(max_length=300)
	language=models.CharField(max_length=300)
	currency=models.CharField(max_length=300)
	fecha = models.DateField(default=datetime.date.today)
	user=models.ForeignKey(User,default=1)

	def __str__(self):
		return self.name

class Respuesta(models.Model):
	name = models.CharField(max_length=255)
	price = models.CharField(max_length=255)
	lat = models.CharField(max_length=255)
	lon = models.CharField(max_length=255)
	fecha = models.DateField(default=datetime.date.today)
	pregunta = models.ForeignKey(Pregunta)
	user=models.ForeignKey(User,default=1)

	def __str__(self):
		return self.titulo

class Counter:
    count = 1
    count2= 0
    def increment(self):
         self.count += 1

         return self.count
    def decrement(self):
        self.count -= 1

        return ""

    def double(self):
        self.count += 2



class Counter2:
    count = 0

    def increment(self):
         self.count += 1

    def decrement(self,valor):
        self.count = valor-1

    def double(self):
        self.count *= 2

        return self.count