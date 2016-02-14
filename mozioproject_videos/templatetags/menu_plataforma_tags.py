from django import template

from mozioproject.models import Materia,Tema,Topico,Counter,Counter2

register = template.Library()

@register.inclusion_tag('mozioproject_menu/menu_plataforma.html', takes_context=True)
def mostrar_menu(context):

	message=None
	counter=Counter()
	counter2=Counter()
	materias_secundaria=Materia.objects.filter(nivel_escolar_id=1).order_by('nombre')
	materias_bachillerato= Materia.objects.filter(nivel_escolar_id=2).order_by('nombre')
	algebra=Materia.objects.get(id=2)

	temas_algebra= algebra.tema_set.all()

	return {'message':message,'materias_secundaria':materias_secundaria,'materias_bachillerato':materias_bachillerato,'temas_algebra':temas_algebra,'counter':counter,'counter2':counter2}

