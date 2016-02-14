from django.conf.urls import *
from django.contrib import admin



admin.autodiscover()

urlpatterns = [

    url(r'^admin/doc', include('django.contrib.admindocs.urls')),
    url(r'^admin/', include(admin.site.urls)),
    #url a la raiz del proyecto
    url(r'^$', 'mozio_project.views.homepage',name="homepage"),
    #url de login y logout
    url(r'^login/$', 'mozio_project.views.login_page',name="login"),
    url(r'^logout/$','mozio_project.views.logout_view',name="logout"),
    #urls de la aplicacion
    url(r'^privado/$','mozioproject.views.privado',name="privado"),
    url(r'^privado/videos/$', 'mozioproject_videos.views.mozioproject_list_videos', name='abaco_videos'),
    url(r'^privado/videos/cargar-videos/(?P<id>\d+)$', 'mozioproject_videos.views.abaco_cargar_videos', name='abaco_cargar_videos'),
    url(r'^privado/videos/guardar_pregunta/$', 'mozioproject_discusion.views.guardar_pregunta', name='abaco_guardar_pregunta'),
    url(r'^privado/videos/cargar_respuestas/(?P<id>\d+)$', 'mozioproject_discusion.views.cargar_respuestas', name='abaco_cargar_respuestas'),
    url(r'^privado/videos/guardar_respuesta/$', 'mozioproject_discusion.views.guardar_respuestas', name='abaco_guardar_respuesta'),
    url(r'^privado/videos/cargar_respuesta/(?P<id>\d+)$', 'mozioproject_discusion.views.cargar_respuesta', name='abaco_cargar_respuesta'),
    url(r'^privado/videos/editar_respuesta/(?P<id>\d+)$', 'mozioproject_discusion.views.editar_respuesta', name='abaco_editar_respuesta'),
    url(r'^privado/videos/eliminar_respuesta/(?P<id>\d+)$', 'mozioproject_discusion.views.eliminar_respuesta', name='abaco_eliminar_respuesta'),
    url(r'^privado/videos/video-agregar/$', 'mozioproject_videos.views.abaco_video_agregar', name='abaco_video_agregar'),
    url(r'^privado/videos/grabar_video/$', 'mozioproject_videos.views.abaco_video_grabar', name='abaco_video_grabar'),
    url(r'^privado/videos/actualizar_video/(?P<id>\d+)$', 'mozioproject_videos.views.abaco_video_actualizar', name='abaco_video_actualizar'),
    url(r'^privado/videos/video-editar/(?P<id>\d+)$', 'mozioproject_videos.views.abaco_video_editar', name='abaco_video_editar'),
    url(r'^privado/videos/video-eliminar/(?P<id>\d+)$', 'mozioproject_videos.views.abaco_video_eliminar', name='abaco_video_eliminar'),

    #menú de catálogos
    #url(r'^catalogos/departamentos$', 'abaco.views.catalogos_departamentos_listar',name="catalogos_departamentos_listar"),
    #url(r'^catalogos/departamentos/eliminar/(?P<departamento_id>\d+)$', 'abaco.views.catalogos_departamentos_eliminar',name="catalogos_departamentos_eliminar"),
    #url(r'^catalogos/departamentos/crear$', 'abaco.views.catalogos_departamentos_crear',name="catalogos_departamentos_crear"),
    #url(r'^catalogos/departamentos/editar/(?P<departamento_id>\d+)$', 'abaco.views.catalogos_departamentos_editar',name="catalogos_departamentos_editar"),
    #url(r'^catalogos/departamentos/reporte$', Catalogos_departamentos_reporte.as_view(),name="catalogos_departamentos_reporte"),
    #url(r'^catalogos/departamentos/reporteprueba$', 'abaco.views.catalogos_departamentos_reporteprueba'),

]
