from django import forms

class LoginForm(forms.Form):
	username=forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'type user','class':'form-control'}))
	password=forms.CharField(widget=forms.PasswordInput(attrs={'placeholder': 'type password','class':'form-control'}))