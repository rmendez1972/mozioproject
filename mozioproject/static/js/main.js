$(document).ready(function(){


		$("#entrar0").on( "click", function() {
			$('#entrar').show(); //muestro mediante id
			$('.entrar').show(); //muestro mediante clase

			 });
		$("#ocultar").on( "click", function() {
			$('#entrar').hide(); //oculto mediante id
			$('.entrar').hide(); //muestro mediante clase
		});
	});