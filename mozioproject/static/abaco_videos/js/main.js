$(document).on('ready', main);

function main () {

	$('#videos').on('click', 'a', cargar_contenido_clase);
	$('#agregar').on('click', video_agregar);
	$('#grabar_video').on('click', grabar_video); //evento que se dispara cuando hago clic en grabar video
	$('#actualizar_video').on('click', actualizar_video); //evento que se dispara cuando hago clic en grabar video

}

function cargar_contenido_clase (data) {

	var id = $(data.currentTarget).data('id');

	$.get('cargar-videos/' + id, cargar_video)
}

function cargar_video(data){

	var contenido = $('#contenido-clase');

	contenido.html('');

	$('<a class="regresar">').html('Back').appendTo(contenido);

	$('<h2>').html(data.descripcion_corta).appendTo(contenido);

	$('<iframe src="http://www.youtube.com/embed/' + data.url + '" allowfullscreen>').appendTo(contenido);

	$('<p class="text-justify text-muted">').html(data.descripcion_larga).appendTo(contenido);

	$('#videos').css('left', '-110%');
	contenido.css('left', '0');

	contenido.on('click', 'a', function(){
		contenido.css('left', '-110%');
		$('#videos').css('left', '0');
	});
}

function video_agregar (data) {



	$.get('video-agregar/', video_nuevo)
}


function video_nuevo(data){

	$('#videos').css('left', '-120%');
	$('#contenido').css('left', '0');

	$('#contenido').on('click', 'a', function(){

		$('#contenido').css('left', '-110%');
		$('#videos').css('left', '0');
	});
}


function grabar_video() {
	/* recupero el contenido de los campos */
	var descrip_corta = $('#descripcion_corta').val();
	var descrip_larga = $('#descripcion_larga').val();
	var ruta = $('#url').val();
	var imagen = $('#thumb').val();

	var duracion='00:'+$('#aprox').val();
	alert('el valor de la duracion formateado es '+duracion);
	var nivel = $('#nivel_dificultad').val();


	if( (descripcion_corta != '') && (descripcion_larga != '') && (url != '') ){

		$.post(
			'grabar_video/',
			{ descripcion_corta: descrip_corta,descripcion_larga: descrip_larga,url: ruta, nivel_dificultad: nivel, duracion_aprox: duracion,thumb: imagen },
			function(){
				alert('Video agregado exitosamente!');
				$('#areatrabajo').html('');
		});

	}
}


function actualizar_video() {
	/* recupero el contenido de los campos */
	var descrip_corta = $('#descrip_corta').val();
	var descrip_larga = $('#descrip_larga').val();
	var url_corta = $('#url_corta').val();
	var imagen = $('#thumb_img').val();
	var video_id = $('#video_id').val();
	alert('el valor de id del video es '+video_id);
	var duracion='00:'+$('#duracion').val();

	var nivel = $('#dificultad').val();
	alert('el valor de la duracion formateado es '+duracion);

	if( (descrip_corta != '') && (descrip_larga != '') && (url_corta != '') ){
		alert('apunto de llamar a ruta actualizarr_video/id');
		$.post(
			'actualizar_video/'+video_id,
			{ id: video_id,descripcion_corta: descrip_corta,descripcion_larga: descrip_larga,url: url_corta, nivel_dificultad: nivel, duracion_aprox: duracion,thumb: imagen },
			function(){
				alert('Video modificado exitosamente!');
				$('#areatrabajo').html('');
		});
	}
}


function listar_videos (mensaje) {

	alert('Video '+mensaje);
	//$('#contenido').css('left', '-110%');
	$('#areatrabajo').html('');
	//$('#videos').css('left', '0');
	//$.get('http://localhost:8000/privado/videos/');
}




function mostrar_edicion_video(data) {

	var descripcion_corta=data.descripcion_corta;
	var descripcion_larga=data.descripcion_larga;
	var url=data.url;
	var nivel_dificultad_id=data.nivel_dificultad;
	var thumb=data.thumb;
	var duracion=data.duracion_aprox;
	var id=data.id;
	//alert('la duracion recuperada es '+duracion);

	//inyecto valores a campos del formulario

	$('#descrip_corta').val(descripcion_corta);
	$('#descrip_larga').html(descripcion_larga);
	$('#url_corta').val(url);
	$('#duracion').val(duracion);
	$('#video_id').val(id);



	var options_dificultad = $('#dificultad option');
	var options_thumb = $('#thumb_img option');

	$.map(options_dificultad ,function(option) {
	    if (option.value==nivel_dificultad_id)
	    {
	    	option.selected=true;
	    }
	});

	$.map(options_thumb ,function(option) {
	    if (option.value==thumb)
	    {
	    	option.selected=true;
	    }
	});


	$('#videos').css('left', '-120%');
	$('#video_editar').css('left', '0');

	$('#video_editar').on('click', 'a', function(){

		$('#video_editar').css('left', '-110%');
		$('#videos').css('left', '0');
	});

}

function editar_video(id) {


	$.get('video-editar/' + id, mostrar_edicion_video);
}

function eliminar_video(id) {


	$.get('video-eliminar/' + id, function(){
				alert('Video eliminado exitosamente!');
				$('#areatrabajo').html('');
		});

}

