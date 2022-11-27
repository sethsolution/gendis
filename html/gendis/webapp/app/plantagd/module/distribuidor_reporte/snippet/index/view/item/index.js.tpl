{literal}
<script>
    var snippet_tab_item = function () {
        "use strict";
        var urlsys = '{/literal}{$path_url}{literal}';
        var pregunta = $('#checkbox_observado').prop('checked');

        var handler_tab_build = function(){
            coreUyuni.setTabs();
        };
        var handle_type_select = function() {
            $('#checkbox_observado').on('change', function () {
                handle_observado();
            });
        }
        var observado_div= $('#observado_div');
        var boton_observar_div= $('#boton_observar_div');
        var boton_aprobar_div= $('#boton_aprobar_div');
        var handle_observado = function(){
            if($('#checkbox_observado').prop('checked')) {
                var id = 1;
            }else{
                var id = 0;
            }
            id = id==null? '': id.toString();
            observado_div.addClass('d-none');
            boton_observar_div.addClass('d-none');
            boton_aprobar_div.addClass('d-none');
            switch (id){
                case '1':
                    observado_div.removeClass('d-none');
                    boton_observar_div.removeClass('d-none');
                    boton_aprobar_div.addClass('d-none');
                    break;
                case '0':
                    observado_div.addClass('d-none');
                    boton_observar_div.addClass('d-none');
                    boton_aprobar_div.removeClass('d-none');
                    break;
            }
        };

        var btn_aprobar = $('#btn_aprobar');
        var btn_observar = $('#btn_observar');
        var btn_guardar_observacion= $('#btn_guardar_observacion');

        var handle_aprobar = function() {
            btn_aprobar.click(function(e) {
                e.preventDefault();
                /**
                 * Copiamos los datos de summerNote a una variable
                 */
                swal.fire({
                    title: '¿Esta seguro que desea APROBAR el reporte?',
                    html: 'Recuerde que una vez aprobada la información  <br>'+
                        '<span style="color:red;"><strong>NO PODRÁ REALIZAR NINGUNA OBSERVACIÓN </strong></span>',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '¡Si, Aprobar!',
                    cancelButtonText: "No, Cancelar"
                }).then(function(result) {
                    if (result.value) {
                        aprobar_accion();
                    }
                });
            });
        };
        var handle_observar = function() {
            btn_observar.click(function(e) {
                e.preventDefault();
                /**
                 * Copiamos los datos de summerNote a una variable
                 */
                swal.fire({
                    title: '¿Esta seguro que desea enviar la observación?',

                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '¡Si, Enviar observación!',
                    cancelButtonText: "No, Cancelar"
                }).then(function(result) {
                    if (result.value) {
                        observar_accion();
                    }
                });
            });
        };
        var handle_guardar_observacion = function() {
            btn_guardar_observacion.click(function(e) {
                e.preventDefault();
                guardar_observacion_accion();
            });
        };
        var aprobar_accion = function () {
            Swal.fire({
                title: 'Revisando reporte',
                html: 'Procesando datos',
                showConfirmButton: false,
                allowEnterKey: false,
                allowOutsideClick: false,
                allowEscapeKey: false,
            });
            var id = '{/literal}{$id}{literal}';
            var url = urlsys+"/"+id+"/aprobar";
            $.get( url, {},
                function(res){
                    if(res.res == 1){
                        Swal.close();
                        Swal.fire({icon: 'success',title: 'La información reportada fue aprobada con exito!!!',showConfirmButton: false,timer: 1000});
                        location.reload();
                    }else{
                        //var msg_error = res.msg;
                        var errorname = '<strong>Ocurrio error al guardar</strong><br>'+res.msg;
                        var msg_error =eval(errorname);
                        if (res.msgdb !== undefined){
                            msg_error += '<div class="alert alert-danger font-size-xs" role="alert">';
                            msg_error += '<strong>'+lngUyuni.technicalData+': </strong>'+res.msgdb+'</div>';
                        }
                        Swal.fire({
                            icon: "error", title: '<strong>Ocurrio error al guardar</strong><br>'+res.msg,
                            html:msg_error, showClass: {popup: 'animate__animated animate__wobble'}
                        });

                    }
                },"json");
        };
        var observar_accion = function () {
            Swal.fire({
                title: 'Enviando observación',
                html: 'Procesando datos',
                showConfirmButton: false,
                allowEnterKey: false,
                allowOutsideClick: false,
                allowEscapeKey: false,
            });
            var id = '{/literal}{$id}{literal}';
            var url = urlsys+"/"+id+"/observar";
            $.get( url, {},
                function(res){
                    if(res.res == 1){
                        Swal.close();
                        Swal.fire({icon: 'success',title: 'La observación fue enviada.',showConfirmButton: false,timer: 1000});
                        location.reload();
                    }else{
                        //var msg_error = res.msg;
                        var errorname = '<strong>Ocurrio error al enviar</strong><br>'+res.msg;
                        var msg_error =eval(errorname);
                        if (res.msgdb !== undefined){
                            msg_error += '<div class="alert alert-danger font-size-xs" role="alert">';
                            msg_error += '<strong>'+lngUyuni.technicalData+': </strong>'+res.msgdb+'</div>';
                        }
                        Swal.fire({
                            icon: "error", title: '<strong>Ocurrio error al enviar</strong><br>'+res.msg,
                            html:msg_error, showClass: {popup: 'animate__animated animate__wobble'}
                        });
                    }
                },"json");
        };

            var guardar_observacion_accion = function () {
            Swal.fire({
                title: 'Enviando observación',
                html: 'Procesando datos',
                showConfirmButton: false,
                allowEnterKey: false,
                allowOutsideClick: false,
                allowEscapeKey: false,
            });
            var id = '{/literal}{$id}{literal}';
            var mensaje = $('#observacion').summernote('code');
            $.post(urlsys+"/saveobservation",{
                    "id_item":id,
                    "pregunta":pregunta,
                    "mensaje":mensaje
                },
                function(res){
                    if(res.res==1){
                            Swal.close();
                            Swal.fire({icon: 'success',title: 'Observación registrada correstamente.',showConfirmButton: false,timer: 1000});
                            location.reload();
                        }else{
                            //var msg_error = res.msg;
                            var errorname = '<strong>Ocurrio error al enviar</strong><br>'+res.msg;
                            var msg_error =eval(errorname);
                            if (res.msgdb !== undefined){
                                msg_error += '<div class="alert alert-danger font-size-xs" role="alert">';
                                msg_error += '<strong>'+lngUyuni.technicalData+': </strong>'+res.msgdb+'</div>';
                            }
                            Swal.fire({
                                icon: "error", title: '<strong>Ocurrio error al enviar</strong><br>'+res.msg,
                                html:msg_error, showClass: {popup: 'animate__animated animate__wobble'}
                            });
                        }
                });
                /*
            $.get( url, {},
                function(res){
                    if(res.res == 1){
                        Swal.close();
                        Swal.fire({icon: 'success',title: 'La observación fue enviada.',showConfirmButton: false,timer: 1000});
                        location.reload();
                    }else{
                        //var msg_error = res.msg;
                        var errorname = '<strong>Ocurrio error al enviar</strong><br>'+res.msg;
                        var msg_error =eval(errorname);
                        if (res.msgdb !== undefined){
                            msg_error += '<div class="alert alert-danger font-size-xs" role="alert">';
                            msg_error += '<strong>'+lngUyuni.technicalData+': </strong>'+res.msgdb+'</div>';
                        }
                        Swal.fire({
                            icon: "error", title: '<strong>Ocurrio error al enviar</strong><br>'+res.msg,
                            html:msg_error, showClass: {popup: 'animate__animated animate__wobble'}
                        });
                    }
                },"json");*/
        };

        return {
            init: function() {
                handler_tab_build();
                handle_type_select();
                handle_aprobar();
                handle_observar();
                handle_guardar_observacion();
            }
        };
    }();

    jQuery(document).ready(function() {
        snippet_tab_item.init();
        $('#{/literal}{$menu_tab_active}{literal}_tab').trigger('click');
    });
</script>
{/literal}


