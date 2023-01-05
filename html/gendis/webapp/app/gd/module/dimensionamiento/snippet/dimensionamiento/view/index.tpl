{include file="index.css.tpl"}
<div class="card card-custom gutter-b" id="form" >
    <!--begin::Form-->
    <form id="general_form">

        <div class="card-header py-3">
            <div class="card-title  m-0">
                <span class="card-icon"><i class="flaticon2-next text-dark-25"></i></span>
                <span class="font-weight-bold font-size-h4 text-primary">{#title_datos#}</span>
            </div>
        </div>

        <div class="card-body py-0">
            <div class="form-group">
                <div id="map" style="height:400px;"></div>
            </div>
            <div class="form-group row">


                <div class="col-lg-6">
                    <label>{#fiel_location_latitude_decimal#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="location_latitude_decimal"
                               id="location_latitude_decimal"
                               required
                               value="{$item.location_latitude_decimal|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i
                                        class="fa fa-map-marker-alt text-danger"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_location_latitude_decimal#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#fiel_location_longitude_decimal#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               id="location_longitude_decimal"
                               required
                               name="location_longitude_decimal"
                               value="{$item.location_longitude_decimal|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i
                                        class="fa fa-map-marker-alt text-danger"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_location_longitude_decimal#}</span>
                </div>
                <div class="col-lg-12">
                    <label>{#field_consumo_mensual_promedio#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer2"
                               id="consumo_mensual_promedio"
                               required
                               name="consumo_mensual_promedio"
                               value="{$item.consumo_mensual_promedio|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i
                                        class="far fa-lightbulb text-info"></i></span></div>
                    </div>
                    <span class="form-text text-black-50" id="msgConsumoMensualPromedio">{#field_msg_consumo_mensual_promedio#}</span>
                </div>
                <div class="col-lg-12">
                    <div class="cuadro m--padding-10">
                        <div class="input-group"> {#field_acceso_sol#}
                            <div class="m-radio-list">
                                <br>
                                <input type="radio" id="acceso_sol" name="acceso_sol" value="1" {if $acceso_sol == 1} checked{/if}> SI
                                <input type="radio" id="acceso_sol" name="acceso_sol" value="0" {if $acceso_sol == 0} checked{/if}> NO
                            </div>
                        </div>
                        <span class="form-text text-black-50"  id="msgAccesosol">{#field_msg_acceso_sol#}</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-footer">
            {if $privFace.edit == 1}
                <button type="reset" class="btn btn-primary mr-2" id="btn_calcular">
                    <i class="fas fa-calculator"></i>
                    Calcular</button>
            {/if}
        </div>
    </form>
    <!--end::Form-->
</div>

<div class="card card-custom gutter-b" id="result" hidden >

</div>

{include file="index.js.tpl"}