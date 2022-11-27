{include file="index.css.tpl"}
<div class="card card-custom gutter-b example example-compact">
    <div class="card-body pt-0 pb-0 pl-5 pr-5">
        <div class="alert alert-custom fade show pt-1 pb-1 pl-5 pr-5 ayuda" role="alert">
            <div class="alert-icon"><i class="flaticon-notes"></i></div>
            <div class="alert-text text-justify text-dark-65" >{#message#}</div>
        </div>
    </div>

    <div class="card-header py-3">
        <div class="card-title">
            <span class="card-icon"><i class="flaticon2-next text-dark-25"></i></span>
            <h3 class="card-label text-dark-50">{#title#}</h3>
        </div>
    </div>
    <!--begin::Form-->
    <form method="POST"
          action="{$path_url}/{$subcontrol}_/{if $type=="update"}{$id}/{/if}save/"
          id="general_form">


        <div class="card-header pt-0 pb-0">
            <h4 class="card-title pt-3 pb-3 m-0 text-black-50">{#title1#}</h4>
        </div>

        <div class="card-body">
            <div class="form-group row">
                <div class="col-lg-6">
                    <label>{#field_nro#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer"
                               name="item[numero_cuenta]" value="{$item.numero_cuenta|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-file-alt"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_nro#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_category_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[gd_categoria_id]" id="type_select_category"
                                data-placeholder="{#field_Holder_category_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.gd_categoria selected=$item.gd_categoria_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_category_id#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_name#}<span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[nombre_consumidor]" value="{$item.nombre_consumidor|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                               minlength=3"
                               data-fv-string-length___message="{#field_length_name#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="flaticon2-user"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_name#}</span>
                </div>

                <div class="col-lg-6">
                    <label>{#field_ci#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[ci]" value="{$item.ci|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-address-card"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_ci#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#fiel_zone#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[barrio_zona]" value="{$item.barrio_zona|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-map-marker-alt"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#fiel_Msg_zone#}</span>
                </div>

                <div class="col-lg-6">
                    <label>{#fiel_city#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[ciudad]" value="{$item.ciudad|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-map-marker-alt"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#fiel_Msg_city#}</span>
                </div>

                <div class="col-lg-4">
                    <label>{#fiel_email#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[email]" value="{$item.email|escape:"html"}"
                               placeholder="{#field_placeholder_email#}"
                               minlength=3"
                               data-fv-string-length___message="{#field_length_email#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fas fa-at"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#fiel_Msg_email#}</span>
                </div>

                <div class="col-lg-4">
                    <label>{#field_phone#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer"
                               name="item[telefono]" value="{$item.telefono|escape:"html"}"

                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-phone"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_phone#}</span>
                </div>

                <div class="col-lg-4">
                    <label>{#field_mobile#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer"
                               name="item[celular]" value="{$item.celular|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-phone"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_mobile#}</span>
                </div>

                <div class="col-lg-8">
                    <label>{#field_legal_person#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[persona_juridica]" value="{$item.persona_juridica|escape:"html"}"
                               minlength=3"
                               data-fv-string-length___message="{#field_length_legal_person#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="flaticon2-user"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_legal_person#}</span>
                </div>

                <div class="col-lg-4">
                    <label>{#fiel_nit#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer"
                               name="item[nit]" value="{$item.nit|escape:"html"}"

                               minlength=3"
                               data-fv-string-length___message="{#field_length_nit#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-address-card"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#fiel_Msg_nit#}</span>
                </div>
            </div>
        </div>

        <div class="card-header pt-0 pb-0">
            <h4 class="card-title pt-3 pb-3 m-0 text-black-50">{#title2#}</h4>
        </div>

        <div class="card-body">
            <div class="form-group row">
                <div class="col-lg-4">
                    <label>{#field_power#}<span class="text-danger bold">*</span>:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal"
                               name="item[potencia_instalada]" value="{$item.potencia_instalada|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="flaticon-dashboard"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_power#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_tension#}<span class="text-danger bold">*</span>:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal"
                               name="item[tension]" value="{$item.tension|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="flaticon-dashboard"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_tension#}</span>
                </div>

                <div class="col-lg-4">
                    <label>{#field_gd_tipo_conexion_id#}: </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[gd_tipo_conexion_id]" id="type_select_conexion"
                                data-placeholder="{#field_Holder_gd_tipo_conexion_id#}" {$privFace.input}
                        >
                            <option value="null">Ninguno</option>
                            {html_options options=$cataobj.gd_tipo_conexion selected=$item.gd_tipo_conexion_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_gd_tipo_conexion_id#}</span>
                </div>
            </div>

            <div class="form-group row {if $item.gd_categoria_id != '3'}d-none{/if}" id="mini_div">
                <div class="col-lg-6">
                    <label>{#field_power_center#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal"
                               name="item[potencia_centro_transformacion]" value="{$item.potencia_centro_transformacion|escape:"html"}"

                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="flaticon-dashboard"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_power_center#}</span>
                </div>

                <div class="col-lg-6">
                    <label>{#field_transformer_type_id#}: </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[gd_tipo_transformacion_id]" id="type_select_trans"
                                data-placeholder="{#field_Holder_transformer_type_id#}" {$privFace.input}
                        >
                            <option value="null">Ninguno</option>
                            {html_options options=$cataobj.gd_tipo_transformacion selected=$item.gd_tipo_transformacion_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_transformer_type_id#}</span>
                </div>

                <div class="col-lg-6">
                    <label>{#fiel_transformer_type#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[transformador_tipo_conexion]" value="{$item.transformador_tipo_conexion|escape:"html"}"
                               minlength=3"
                               data-fv-string-length___message="{#field_length_transformer_type#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="flaticon-time-1"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#fiel_Msg_transformer_type#}</span>
                </div>

                <div class="col-lg-6">
                    <label>{#field_transformer_impedance#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal"
                               name="item[transformador_impedancia]" value="{$item.transformador_impedancia|escape:"html"}"

                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="flaticon-dashboard"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_transformer_impedance#}</span>
                </div>

            </div>
        </div>

        <div class="card-header pt-0 pb-0">
            <h4 class="card-title pt-3 pb-3 m-0 text-dark-65">{#title3#}</h4>
        </div>

        <div class="card-body">
            <div class="form-group row">
                <div class="col-lg-6">
                    <label>{#field_power_ca#}<span class="text-danger bold">*</span>:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal"
                               name="item[potencia]" value="{$item.potencia|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="flaticon-dashboard"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_power_ca#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_font_type_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[gd_tipo_fuente_generacion_id]" id="type_select_font"
                                data-placeholder="{#field_Holder_font_type_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.gd_tipo_fuente_generacion selected=$item.gd_tipo_fuente_generacion_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_font_type_id#}</span>
                </div>
                <div class="col-lg-6 {if $item.gd_tipo_fuente_generacion_id != '1'}d-none{/if}" id="font_div">
                    <label>{#fiel_font_type#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[fuente_generacion_otro]" value="{$item.fuente_generacion_otro|escape:"html"}"

                               minlength=3"
                               data-fv-string-length___message="{#field_length_font_type#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="flaticon-file-2"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#fiel_Msg_font_type#}</span>
                </div>
            </div>
        </div>

        <div class="card-header pt-0 pb-0">
            <h4 class="card-title pt-3 pb-3 m-0 text-dark-65">{#title4#}</h4>
        </div>

        <div class="card-body">
            <div class="form-group row">
                <div class="col-lg-12">
                    <label>{#fiel_name_manager#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[responsable_nombre]" value="{$item.responsable_nombre|escape:"html"}"
                               minlength=3"
                               data-fv-string-length___message="{#field_length_name_manager#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="flaticon2-user"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#fiel_Msg_name_manager#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#fiel_email_manager#} :</label>
                    <div class="input-group">
                        <input type="email" class="form-control"
                               name="item[responsable_email]" value="{$item.responsable_email|escape:"html"}"
                               placeholder="{#field_placeholder_email#}"
                               minlength=3"
                               data-fv-string-length___message="{#field_length_email_manager#}"

                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-at"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#fiel_Msg_email_manager#}</span>
                </div>

                <div class="col-lg-6">
                    <label>{#field_phone_manager#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer"
                               name="item[responsable_telefono]" value="{$item.responsable_telefono|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-phone"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_phone_manager#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_place#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[lugar]" value="{$item.lugar|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-map-marker-alt"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_place#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_date#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="valid_until"
                               name="item[fecha]" value="{$item.fecha|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_date#}</span>
                </div>
            </div>
        </div>

        <div class="card-header pt-0 pb-0">
            <h4 class="card-title pt-3 pb-3 m-0 text-dark-65">{#title5#}</h4>
        </div>
        <div class="card-body">
            <div class="form-group">
                <div id="map" style="height:400px;"></div>
            </div>
            <div class="form-group row">
                {*
                <div class="col-lg-6">
                    <label>{#field_region#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group group">
                        <select class="form-control m-select2 select2_general"
                                name="item[region_id]" id="region_id"
                                data-placeholder="{#field_holder_region#}" {$privFace.input}

                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.region selected=$item.region_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_region#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_subregion#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group group">
                        <select class="form-control m-select2 select2_general"
                                name="item[subregion_id]" id="subregion_id"
                                data-placeholder="{#field_holder_subregion#}" {$privFace.input}

                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.subregion selected=$item.subregion_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_subregion#}</span>
                </div>
                *}
                <div class="col-lg-6">
                    <label>{#fiel_location_latitude_decimal#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[location_latitude_decimal]"
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
                               name="item[location_longitude_decimal]"
                               value="{$item.location_longitude_decimal|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i
                                        class="fa fa-map-marker-alt text-danger"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_location_longitude_decimal#}</span>
                </div>
            </div>

        </div>

        <div class="card-footer">
            {if $privFace.edit == 1}
                <button type="reset" class="btn btn-primary mr-2" id="general_submit">
                    <i class="la la-save"></i>
                    {#glBtnSaveChanges#}</button>
            {/if}
            <a href="{$path_url}" class="btn btn-light-primary ">
                <i class="la la-angle-double-left"></i>{if $type =="new"} {#glBtnCancel#} {else} {#glBtnBackToList#}{/if}
            </a>
        </div>

    </form>
    <!--end::Form-->
</div>

{include file="index.js.tpl"}