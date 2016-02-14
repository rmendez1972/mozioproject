from django.contrib import admin
from .models import Nivel_escolar,Materia,Tema,Topico,Pregunta,Niveles_dificultad,Video

# Register your models here.
admin.site.register(Materia)
admin.site.register(Tema)
admin.site.register(Topico)
admin.site.register(Pregunta)
admin.site.register(Niveles_dificultad)
admin.site.register(Nivel_escolar)
admin.site.register(Video)