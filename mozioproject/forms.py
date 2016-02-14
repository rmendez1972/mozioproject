from django import forms
from mozioproject.models import Materia

class MateriaForm(forms.ModelForm):
	nombre=forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'escribe el nombre de la Materia','size':'50','maxlength':'200'}))

	class Meta:
		model = Materia
		fields = "__all__"




