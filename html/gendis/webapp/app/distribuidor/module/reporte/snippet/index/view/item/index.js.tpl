{literal}
<script>
    var snippet_tab_item = function () {
        "use strict";
        var urlsys = '{/literal}{$path_url}{literal}';
        var handler_tab_build = function(){
            coreUyuni.setTabs();
        };
        /**
         * Envio de formulario
         */
        var btn_enviar = $('#btn_enviar');
        var btn_print = $('#btn_print');
        var handle_enviar = function() {
            btn_enviar.click(function(e) {
                e.preventDefault();
                /**
                 * Copiamos los datos de summerNote a una variable
                 */
                swal.fire({
                    title: '¿Esta seguro de enviar el reporte?',
                    html: 'Recuerde que una vez enviada la información  <br>'+
                        '<span style="color:red;"><strong>NO PODRÁ REALIZAR NINGUNA MODIFICACIÓN </strong></span>',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '¡Si, Enviar!',
                    cancelButtonText: "No, Cancelar"
                }).then(function(result) {
                    if (result.value) {
                        enviar_accion();
                    }
                });
            });
        };
        var enviar_accion = function () {
            Swal.fire({
                title: 'Enviando reporte',
                html: 'Procesando datos',
                showConfirmButton: false,
                allowEnterKey: false,
                allowOutsideClick: false,
                allowEscapeKey: false,
            });
            var id = '{/literal}{$id}{literal}';
            var url = urlsys+"/"+id+"/enviar";
            $.get( url, {},
                function(res){
                    if(res.res == 1){
                        Swal.close();
                        Swal.fire({icon: 'success',title: 'El reporte fue enviado con exito!!!',showConfirmButton: false,timer: 1000});
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
        var handler_print = function () {
            btn_print.click(function(e) {
                e.preventDefault();
                var id = '{/literal}{$id}{literal}';
                var url = urlsys+"/"+id+"/print";
                window.open(url,'impresion_distribuidora');
                });
        }

        return {
            init: function() {
                handler_tab_build();
                handle_enviar();
                handler_print();
            }
        };
    }();

    jQuery(document).ready(function() {
        snippet_tab_item.init();
        $('#{/literal}{$menu_tab_active}{literal}_tab').trigger('click');
    });
</script>
{/literal}

