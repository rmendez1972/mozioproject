from django import template

from mozioproject.models import Pregunta

register = template.Library()

@register.inclusion_tag('mozioproject_discusion/discusiones.html', takes_context=True)
def mostrar_discusiones(context):
	preguntas = Pregunta.objects.all().order_by('-id')

	return {'preguntas': preguntas}

