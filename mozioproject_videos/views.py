import json

from mozioproject.models import Video,Niveles_dificultad
from django.http import HttpResponse, Http404
from django.shortcuts import render_to_response,get_object_or_404
from django.template import RequestContext

def mozioproject_list_videos(request):
	videos = Video.objects.all()
	return render_to_response('mozioproject_videos/videos.html', {'videos':videos }, context_instance=RequestContext(request))

def abaco_cargar_videos(request, id):
	if request.is_ajax():
		video = Video.objects.get(pk=id)
		return HttpResponse(
			json.dumps({'descripcion_corta': video.descripcion_corta, 'descripcion_larga': video.descripcion_larga, 'url': video.url }),
			content_type="application/json; charset=utf8"
			)
	else:
		raise Http404


def abaco_video_agregar(request):
	if request.is_ajax():
		niveles_dificultad = Niveles_dificultad.objects.all()
		data = list()
		for nivel_dificultad in niveles_dificultad:
			data.append({'descripcion':nivel_dificultad.descripcion})

		return HttpResponse(
			json.dumps({'niveles_dificultad': data}),
			content_type="application/json; charset=utf8"
			)
	else:
		raise Http404

def abaco_video_grabar(request):
	if request.is_ajax():
		usuario_id=request.session['usuario_id']
		if request.POST['descripcion_corta']:

			video = Video(descripcion_corta=request.POST['descripcion_corta'],descripcion_larga=request.POST['descripcion_larga'],url=request.POST['url'],nivel_dificultad_id=request.POST['nivel_dificultad'],duracion_aprox=request.POST['duracion_aprox'],thumb=request.POST['thumb'])
			video.save()

		videos = Video.objects.all()

		data = list()
		for video in videos:
			data.append({ 'id': video.id, 'descripcion_corta': video.descripcion_corta })

		return HttpResponse(
			json.dumps({ 'videos': data }),
			content_type="application/json; charset=utf8"
			)
	else:
		raise Http404

def abaco_video_editar(request,id):
	if request.is_ajax():
		video= get_object_or_404(Video, pk=id)
		nombre_grupo=request.session['nombre_grupo']


		return HttpResponse(
			json.dumps({'id': video.id,'descripcion_corta':video.descripcion_corta,'descripcion_larga':video.descripcion_larga,'url':video.url,'thumb':video.thumb,'nivel_dificultad':video.nivel_dificultad_id,'duracion_aprox':video.duracion_aprox.strftime('%M:%S')}),
			content_type="application/json; charset=utf8"
			)
	else:
		raise Http404



def abaco_video_actualizar(request,id):
	if request.is_ajax():
		usuario_id=request.session['usuario_id']
		if request.POST['descripcion_corta']:

			video= get_object_or_404(Video, pk=id)
			video.descripcion_corta=request.POST['descripcion_corta']
			video.descripcion_larga=request.POST['descripcion_larga']
			video.url=request.POST['url']
			video.nivel_dificultad_id=request.POST['nivel_dificultad']
			video.thumb=request.POST['thumb']
			video.url=request.POST['url']
			video.duracion_aprox=request.POST['duracion_aprox']
			video.save()

		videos = Video.objects.all()

		data = list()
		for video in videos:
			data.append({ 'id': video.id, 'descripcion_corta': video.descripcion_corta })

		return HttpResponse(
			json.dumps({ 'videos': data }),
			content_type="application/json; charset=utf8"
			)
	else:
		raise Http404


def abaco_video_eliminar(request,id):
	if request.is_ajax():
		video= get_object_or_404(Video, pk=id)
		nombre_grupo=request.session['nombre_grupo']
		video.delete()

		return abaco_listar_videos(request)
	else:
		raise Http404
