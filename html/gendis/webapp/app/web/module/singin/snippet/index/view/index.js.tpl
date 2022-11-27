<script type="text/javascript" src="/js/md5.js"></script>
{literal}
<script>

var snippet_general_form = function() {
        "use strict";
        /**
         * Datos del formulario y el boton
         */
        var form = $('#general_form');
        var btn_submit = $('#general_submit');

        var formv;

        /**
         * Antes de enviar el formulario se ejecuta la siguiente funcion
         */
         var showRequest= function(formData, jqForm, op)  {
            btn_submit.addClass('spinner spinner-white spinner-right').attr('disabled', true);
            return true;
        };


        var showResponse = function (res, statusText) {
            //
            if(res.res ==1){
                Swal.fire({
                    icon: 'success',
                    title: 'Se registro al usuario con exito!!!',
                    showConfirmButton: false,
                    html: 'Se envio un correo a tu correo electrónico,<strong> sigue las instrucciones para terminar tu registro </string>',
                    timer: 2500,
                    willClose: () => {
                        location = "/login";
                    }
                });
            }else{
                btn_submit.removeClass('spinner spinner-white spinner-right').attr('disabled', false);
                var errorname = "<strong>El Usuario ya se encuentra registrado</strong><br>";
                Swal.fire({icon: "error", title: 'No se puede registrar al usuario', html:errorname,
                    showClass: {popup: 'animate__animated animate__wobble'},
                });
            }
        };
        /**
         * Opciones para generar el objeto del formulario
         */
        var options = {
            beforeSubmit:showRequest
            , dataType: 'json'
            , success:  showResponse
            , data: {type:'{/literal}{$type}{literal}'}
        };

        /**
         * Se da las propiedades de ajaxform al formulario
         */
        var handle_form_submit=function(){
            form.ajaxForm(options);
            formv = FormValidation.formValidation(
                document.getElementById('general_form'),
                {
                    plugins: {
                        declarative: new FormValidation.plugins.Declarative({html5Input: true,}),
                        trigger: new FormValidation.plugins.Trigger(),
                        bootstrap: new FormValidation.plugins.Bootstrap(),
                        submitButton: new FormValidation.plugins.SubmitButton(),
                    }
                }
            );

        };


        //== Private Functions
        
        var showResponse2 = function (responseText, statusText) {
            general_btn_submit.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
            if(responseText.res ==1){

                    swal({type: 'success'
                        ,title: 'Se registro al usuario con exito!!!'
                        ,showConfirmButton: false
                        ,timer: 2000
                        ,onClose: () => {
                            //$('#especie_tab').trigger('click');
                            location = "/ingreso";
                        }
                    });


            }else{
                //msg_error = '<strong>Ocurrio error al registrar</strong><br>'+responseText.msg;
                msg_error = '<strong>El Usuario ya se encuentra registrado</strong><br>';
                if (responseText.msgdb !== undefined){
                    //msg_error += '<br><br><div class="m-alert m-alert--outline alert alert-danger alert-dismissible fade show" role="alert">';
                    //msg_error += '<strong>Dato Técnico: </strong>'+responseText.msgdb+'</div>';
                }
                swal({position: 'top-center'
                    ,html: msg_error
                    ,type: 'error'
                    ,title: 'No se puede registrar al usuario'});
            }
        };

        /**
         * Se da las funcionalidades al boton enviar
         */
        var handle_btn_submit = function() {
            btn_submit.click(function(e) {
                e.preventDefault();
                /**
                 * Copiamos los datos de summerNote a una variable
                 */
                formv.validate().then(function(status) {
                    if(status === 'Valid'){
                        form.submit();
                    }else{
                        Swal.fire({icon: 'error',title: 'No se puede realizar el registro', text: "Ingrese todos los campos requeridos para poder realizar el registro"});
                    }
                });

            });
        };

        /**
         * Iniciamos los componentes necesarios como , summernote, select2 entre otros
         */
         var handle_components = function(){
            coreUyuni.setComponents();
        };


        //== Public Functions
        return {
            // public functions
            init: function() {
                handle_form_submit();
                handle_btn_submit();
                handle_components();
            }
            {/literal}
            {if $item.itemId == "" and $type == "update"}
            {literal}
            msg_error();
        {/literal}
        {/if}
        {literal}
    };
    }();

    //== Class Initialization
    jQuery(document).ready(function() {
        snippet_general_form.init();
    });

</script>
{/literal}