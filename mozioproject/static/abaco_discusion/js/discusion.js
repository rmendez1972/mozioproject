$(document).on('ready', main_discusiones);

function main_discusiones() {

	$.ajaxSetup({
		beforeSend: function(xhr, settings) {
			if(settings.type == "POST"){
				xhr.setRequestHeader("X-CSRFToken", $('[name="csrfmiddlewaretoken"]').val());
			}
		}
	});

	$('#preguntas button').on('click', enviar_pregunta);

	$('#preguntas').on('click', 'a', cargar_respuestas);
}

function enviar_pregunta() {

	var name = $('#pregunta');

	if(name != ''){


		var pregunta=$('#pregunta').val();

		var correo=$('#correo').val();

		var tel=$('#tel').val();

		var leng=$('#leng').val();

		var currency=$('#currency').val();


		$.post('guardar_pregunta/', { name: pregunta, email: correo, phone: tel, language: leng, currency: currency }, actualizar_preguntas);
	}
}

/* recibo por json los datos de la pregunta desde el controlador guardar_pregunta */
function actualizar_preguntas (data) {

	var ul = $('#preguntas ul');

	ul.html('');
	$('#crear-pregunta input:visible').val('');

	$.each(data.preguntas, function(i, element){
		if (i==0)
		{

			$('<li><a data-id="' + element.id + '" title="click to edit data">' + element.name + '</a><p><strong class="text-success">Email:</strong>'+ element.email +'</p><p><strong class="text-success">Phone:</strong>'+ element.phone + '</p><p><strong class="text-success">Language:</strong>'+ element.language + '</p><p><strong class="text-success">Currency:</strong>'+ element.currency + '</p> <p class="small">Data supplied by: <strong class="text-success">'+ element.user_name + '</strong><br>Date: <strong class="text-success">'+ element.fecha +'</strong></p></li>').css({background: '#fed136'}).appendTo(ul);
		}else{
			$('<li><a data-id="' + element.id + '" title="click to edit data">' + element.name + '</a><p><strong class="text-success">Email:</strong>'+ element.email + '</p><p><strong class="text-success">Phone:</strong>'+ element.phone + '</p><p><strong class="text-success">Language:</strong>'+ element.language + '</p><p><strong class="text-success">Currency:</strong>'+ element.currency + '</p><p class="small">Data supplied by: <strong class="text-success">'+ element.user_name + '</strong><br>Date: <strong class="text-success">'+ element.fecha +'</strong></p></li>').appendTo(ul);

		}

	});
}

function cargar_respuestas(data) {

	/* recuperamos el id de la pregunta donde hicimos click */
	var id = $(data.currentTarget).data('id');

	$.get('cargar_respuestas/' + id, mostrar_respuestas);
}

function mostrar_respuestas (data) {

	/* get posts for the provider id selected */
	var respuestas = $('#respuestas');
	var nombre_grupo=data.nombre_grupo;


	respuestas.html('');

	/* i get data-id property */
	var pregunta = $('#preguntas a[data-id="' + data.pregunta + '"]').html();

	/* creo un div dinámicamente contenedor de todo lo que va a haber en respuestas */
	var div = $('<div>');

	$('<a class="regresar">').html('Back').appendTo(div);

	/* poblo el div con un parrafo con el contenido de la pregunta */
	div.append('<p data-id="' + data.pregunta + '">' + pregunta + '</p>');

	/* se agrega un hipervínculo al div recientemente creado dinámicamente para anexar respuesta si el nombre_grupo==asesor */
	if (nombre_grupo=='asesor')
	{
		$('<a class="respuesta">').html('Send Polygon Data').appendTo(div).on('click', responder);
	}
	div.appendTo(respuestas);

	/* se crea un ul q va a contener las respuestas existentes en el modelo*/
	var ul = $('<ul>')

	/* se agreagan los li a la ul recientemente creada de forma dinámica */
	if(nombre_grupo=='asesor')
	{
		$.each(data.respuestas, function(i, elemento){
			//var contenido="<h3><strong class='text-warning'>Respuesta:</strong></h3><pre>"+elemento.titulo+" " + "</pre><a data-editid='"+ elemento.id + "' title='editar respuesta'>editar</a><a data-elimid='"+ elemento.id + "' title='eliminar respuesta'>eliminar</a><br><small class='text-muted'>Respuesta realizada por: <strong class='text-success'>"+ elemento.nombre_usuario + "</strong><br>Fecha: <strong class='text-success'>" + elemento.fecha +"</strong></small>";
			var contenido="<h3><strong class='text-warning'>Polygon:</strong></h3><pre>Name:"+elemento.name+" " + ",Price:"+elemento.price+" "+",Lat:"+elemento.lat+" " +",Long:"+elemento.lon+" "+"</pre><br><small class='text-muted'>Post by provider: <strong class='text-success'>"+ elemento.nombre_usuario + "</strong><br>Date: <strong class='text-success'>" + elemento.fecha +"</strong></small><br><a  data-editarid='"+elemento.id+"' title='edit data' onClick='editar_respuesta("+elemento.id+")'><span class='abacoicons-lapiz'></span></a><a data-eliminarid='"+elemento.id+"' title='delete data' onClick='eliminar_respuesta("+elemento.id+")'><span class='abacoicons-mal'></span></a>";
			if (i==0)
			{
				$('<li data-id="' + elemento.id + '">').html(contenido).css({background: '#fed136'}).appendTo(ul);
			}else{
				$('<li data-id="' + elemento.id + '">').html(contenido).appendTo(ul);

			}


			//$("<a data-editarid='"+elemento.id+"'>").html('editar').appendTo(ul).on('click', editar_respuesta);
			//$("<a data-eliminarid='"+elemento.id+"'>").html('eliminar').appendTo(ul).on('click', eliminar_respuesta);
		});
	}else
	{
		$.each(data.respuestas, function(i, elemento){
			var contenido="<h3><strong class='text-warning'>Post by provider:</strong></h3><pre>"+elemento.name+"</pre><br><small class='text-muted'>Post by: <strong class='text-success'>"+ elemento.nombre_usuario + "</strong><br>Date: <strong class='text-success'>"+ elemento.fecha + "</strong></small>";
			$('<li data-id="' + elemento.id + '">').html(contenido).appendTo(ul);
		});

	}

	/* se anexa la ul con sus li a el article respuestas que inicialmente esta vacío */
	ul.appendTo(respuestas);

	/* muevo al article preguntas a la derecha fuera del contenedor principal */
	$('#preguntas').css('right', '-120%');
	respuestas.css('right', '10px');

	respuestas.on('click', '.regresar', function(){
		respuestas.css('right', '-120%');
		$('#preguntas').css('right', '0');
	});

}

function responder(data) {
	/* se crea un div con id responder */
	var div = $('<div id="responder">');
	/* se crea el text area y el boton para enviar la respuesta al modelo */
	$('<textarea id="name" placeholder="type poligon name here..">').appendTo(div);
	$('<textarea id="price" placeholder="type price here..">').appendTo(div);
	$('<textarea id="lat" placeholder="type latitude here..">').appendTo(div);
	$('<textarea id="lon" placeholder="type longitude here..">').appendTo(div);
	$('<button>').html('Save Polygon').appendTo(div).on('click', enviar_respuesta);

	$('#respuestas div:first').after(div);
}

function enviar_respuesta() {
	/* recupero el contenido del textarea */
	var name = $('#name');
	var price = $('#price');
	var lat = $('#lat');
	var lon = $('#lon');


	if(name.val() != ''){
		$.post(
			'guardar_respuesta/',
			{ name: name.val(),price: price.val(),lat: lat.val(),lon: lon.val(), pregunta: $('#respuestas p').data('id') },
			actualizar_respuestas
		);
	}
}

function actualizar_respuestas(data) {

	var ul = $('#respuestas ul');
	var nombre_grupo=data.nombre_grupo;

	ul.html('');

	if(nombre_grupo=='asesor')
	{
		$.each(data.respuestas, function(i, elemento){
			var contenido="<h3><strong class='text-warning'>Polygon:</strong></h3><pre>Name:"+elemento.name+" " + ",Price:"+elemento.price+" "+",Lat:"+elemento.lat+" " +",Long:"+elemento.lon+" "+"</pre><br><small class='text-muted'>Post by provider:<strong class='text-success'>"+ elemento.nombre_usuario + "</strong><br>Date: <strong class='text-success'>" + elemento.fecha +"</strong><br><a  data-editarid='"+elemento.id+"' title='edit data' onClick='editar_respuesta("+elemento.id+")'><span class='abacoicons-lapiz'></span></a><a data-eliminarid='"+elemento.id+"' title='delete data' onClick='eliminar_respuesta("+elemento.id+")'><span class='abacoicons-mal'></span></a>";
			if (i==0)
			{
				$('<li data-id="' + elemento.id + '">').html(contenido).css({background: '#fed136'}).appendTo(ul).on('click', editar_respuesta);
			}else{
				$('<li data-id="' + elemento.id + '">').html(contenido).appendTo(ul).on('click', editar_respuesta);
			}
			//$("<a data-editarid='"+elemento.id+"'>").html('editar').appendTo(ul).on('click', editar_respuesta);
			//$("<a data-eliminarid='"+elemento.id+"'>").html('eliminar').appendTo(ul).on('click', eliminar_respuesta);
		});
	}else
	{
		$.each(data.respuestas, function(i, elemento){
			var contenido="<h3><strong class='text-warning'>Respuesta:</strong></h3><pre>"+elemento.name+"</pre><br><small class='text-muted'>Post by provider:<strong class='text-success'>"+ elemento.nombre_usuario + "</strong><br>Date: <strong class='text-success'>" + elemento.fecha +"</strong>";
			$('<li data-id="' + elemento.id + '">').html(contenido).appendTo(ul);
		});

	}

	$('#responder').remove();
}

function editar_respuesta(data) {

	//var id = $(data.currentTarget).data('editarid');

	$.get('cargar_respuesta/' + data, mostrar_respuesta);

}

function eliminar_respuesta(data) {


	//var id = $(data.currentTarget).data('eliminarid');

	$.get('eliminar_respuesta/' + data, mostrar_respuestas);

}


function mostrar_respuesta(data) {

	/* se crea un div con id editar */
	var div = $('<div id="editar">');
	/* se crea el text area y el boton para enviar la edicion de respuesta al modelo */
	$.each(data.respuesta, function(i, elemento){

		$('<textarea id="nombre">').html(elemento.name).appendTo(div);
		$('<textarea id="price">').html(elemento.price).appendTo(div);
		$('<textarea id="lat">').html(elemento.lat).appendTo(div);
		$('<textarea id="lon">').html(elemento.lon).appendTo(div);
		$('<input id="respuesta_id" type="hidden" value="'+ elemento.id +'">').appendTo(div);
	});



	$('<button>').html('Update Polygon').appendTo(div).on('click', actualizar_respuesta);

	$('#respuestas div:first').after(div);
}


function actualizar_respuesta() {
	/* recupero el contenido del textarea modificado y del hidden con el id de respuesta */
	//var respuesta = $('#editar textarea').val();
	var nombre = $('#nombre').val();
	alert('nombre'+nombre);
	var price = $('#price').val();
	alert('price'+price);
	var lat = $('#lat').val();
	var lon = $('#lon').val();
	var id = $('#respuesta_id').val();

	if(nombre != ''){
		alert('apunto hacer post');
		$.post(
			'editar_respuesta/'+ id,
			{ nombre: nombre, price: price, lat: lat, lon: lon },
			actualizar_respuestas
		);
		$('#editar').remove();
	}else{ $('#editar').remove(); }
}
