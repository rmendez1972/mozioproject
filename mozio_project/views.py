from django.template import RequestContext
from django.shortcuts import get_object_or_404, render_to_response, redirect
from mozio_project.forms import LoginForm
from django.contrib.auth import authenticate, login, logout
from mozioproject.models import Materia, Counter, Counter2
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth.models import User, Group

def login_page(request):
	message=None
	if request.method=="POST":
		form=LoginForm(request.POST)
		#counter=Counter()
		#counter2=Counter()

		if form.is_valid():
			username=request.POST['username']
			password=request.POST['password']
			user=authenticate(username=username, password=password)
			if user is not None:
				if user.is_active:
					login(request, user)

					message="Bienvenido usuario "+user.username+", haz iniciado sesión correctamente"
					#materias_secundaria=Materia.objects.filter(nivel_escolar_id=1).order_by('nombre')
					#materias_bachillerato= Materia.objects.filter(nivel_escolar_id=2).order_by('nombre')
					#algebra=Materia.objects.get(id=2)

					#temas_algebra= algebra.tema_set.all()
					#grupo=user.groups.all()
					if user.groups.filter(name='asesor').exists():
						nombre_grupo='asesor'
					else:
						nombre_grupo='alumno'

					request.session['message']=message
					request.session['usuario_id']=user.id
					request.session['nombre_grupo']=nombre_grupo
					request.session['nombre_usuario']=user.first_name+' '+user.last_name


					return redirect('privado')
				else:
					message="Tu usuario ha sido desactivado, te invitamos a renombar tu plan de pago"
			else:
				message="Usuario y/o Contraseña incorrectos, inténtalo nuevamente"
				return render_to_response('login.html',{'message':message, 'form':form}, context_instance=RequestContext(request))
	else:
		form=LoginForm()
	return render_to_response('login.html', {'message':message, 'form':form}, context_instance=RequestContext(request))

def homepage(request):
	return render_to_response('bootstrap.html', context_instance=RequestContext(request))


def logout_view(request):
	logout(request)
	return redirect('homepage')




