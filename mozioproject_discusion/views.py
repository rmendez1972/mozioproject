import json

from django.http import HttpResponse
from mozioproject.models import Pregunta, Respuesta
from django.template import RequestContext
from django.contrib.auth.models import User, Group
from django.shortcuts import get_object_or_404, render_to_response, redirect
from django.contrib.auth.models import User, Group

def guardar_pregunta(request):
	if request.is_ajax():
		usuario_id=request.session['usuario_id']
		if request.POST['name']:
			pregunta = Pregunta(name=request.POST['name'],email=request.POST['email'],phone=request.POST['phone'],language=request.POST['language'],currency=request.POST['currency'],user_id=usuario_id)
			pregunta.save()

		preguntas = Pregunta.objects.all().order_by('-id')

		data = list()
		for pregunta in preguntas:
			data.append({ 'id': pregunta.pk, 'name': pregunta.name,'email': pregunta.email,'phone': pregunta.phone,'language': pregunta.language,'currency': pregunta.currency, 'user_name': pregunta.user.username, 'fecha' : pregunta.fecha.strftime('%d-%m-%Y') })

		return HttpResponse(
			json.dumps({ 'preguntas': data }),
			content_type="application/json; charset=utf8"
			)
	else:
		raise Http404

def cargar_respuestas(request, id):
	if request.is_ajax():
		nombre_grupo=request.session['nombre_grupo']
		respuestas = Respuesta.objects.filter(pregunta__id=id).order_by('-id')

		data = list()
		for respuesta in respuestas:
			data.append({'name':respuesta.name,'price':respuesta.price,'lat':respuesta.lat,'lon':respuesta.lon,'id':respuesta.id, 'nombre_usuario': respuesta.user.username, 'fecha' : respuesta.fecha.strftime('%d-%m-%Y')})

		return HttpResponse(
			json.dumps({'respuestas': data, 'pregunta': id, 'nombre_grupo':nombre_grupo}),
			content_type="application/json; charset=utf8"
			)
	else:
		raise Http404

def guardar_respuestas(request):
	if request.is_ajax():
		usuario_id=request.session['usuario_id']
		if request.POST['name']:
			respuesta = Respuesta(name=request.POST['name'],price=request.POST['price'],lat=request.POST['lat'],lon=request.POST['lon'], pregunta_id=request.POST['pregunta'],user_id=usuario_id)
			respuesta.save()

		return cargar_respuestas(request, request.POST['pregunta'])
	else:
		raise Http404


def editar_respuesta(request,id):
	if request.is_ajax():
		usuario_id=request.session['usuario_id']

		if request.POST['nombre']:

			respuesta= get_object_or_404(Respuesta, pk=id)
			pregunta_id=respuesta.pregunta_id
			respuesta.name=request.POST['nombre']
			respuesta.price=request.POST['price']
			respuesta.lat=request.POST['lat']
			respuesta.lon=request.POST['lon']
			respuesta.user_id=usuario_id
			# actualizamos la respuesta editada
			respuesta.save()

		return cargar_respuestas(request, pregunta_id)
	else:
		raise Http404

def eliminar_respuesta(request,id):
	if request.is_ajax():
		usuario_id=request.session['usuario_id']

		respuesta= get_object_or_404(Respuesta, pk=id)
		pregunta_id=respuesta.pregunta_id
		respuesta.delete()

		return cargar_respuestas(request, pregunta_id)
	else:
		raise Http404


def cargar_respuesta(request, id):
	if request.is_ajax():
		respuesta = Respuesta.objects.filter(pk=id)
		nombre_grupo=request.session['nombre_grupo']
		data = list()
		for resp in respuesta:
			data.append({'name':resp.name,'price':resp.price,'lat':resp.lat,'lon':resp.lon,'id':resp.id})

		return HttpResponse(
			json.dumps({'respuesta': data,'nombre_grupo':nombre_grupo}),
			content_type="application/json; charset=utf8"
			)
	else:
		raise Http404
