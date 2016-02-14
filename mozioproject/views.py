from django.template import RequestContext
from django.shortcuts import get_object_or_404, render_to_response, redirect
from mozioproject.models import Materia, Tema, Video, Counter, Counter2
from mozioproject.forms import MateriaForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from reportlab.pdfgen import canvas
from django.http import HttpResponse
from django.contrib.auth.models import User, Group

# clases necesarias para generar reportes pdf con wkhtmltopdf
from django.views.generic.base import View
from wkhtmltopdf.views import PDFTemplateResponse


def privado(request):
	if request.user.is_authenticated():
		message=None
		counter=Counter()
		counter2=Counter()
		message=request.session['message']
		usuario_id=request.session['usuario_id']
		nombre_usuario=request.session['nombre_usuario']
		nombre_grupo=request.session['nombre_grupo']

		materias_secundaria=Materia.objects.filter(nivel_escolar_id=1).order_by('nombre')
		materias_bachillerato= Materia.objects.filter(nivel_escolar_id=2).order_by('nombre')
		algebra=Materia.objects.get(id=2)

		temas_algebra= algebra.tema_set.all()
		return redirect('/privado/videos')
		#return render_to_response('mozioproject/privado.html',{'message':message,'usuario_id':usuario_id,'nombre_usuario':nombre_usuario,'nombre_grupo':nombre_grupo,'materias_secundaria':materias_secundaria,'materias_bachillerato':materias_bachillerato,'temas_algebra':temas_algebra,'counter':counter,'counter2':counter2}, context_instance=RequestContext(request))
	else:
		return redirect('login')

@login_required
def catalogos_materias_listar(request):
	materias=Materia.objects.all()
	titulo_listado="Listado de Materias"




	return render_to_response('mozioproject/materias_listar.html',{'materias':materias,'titulo_listado':titulo_listado},context_instance=RequestContext(request))
