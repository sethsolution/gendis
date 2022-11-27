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

        <div class="card-body pt-0 pb-0">
            <div class="form-group row">
                <div class="col-lg-5"></div>
                <div class="col-lg-3">
                    <label>{#field_active#}:</label>
                    <div class="input-group">
                    <span class="switch switch-icon">
                        <label><input type="checkbox" {if $item.active == 1}checked="checked"{/if} name="item[active]" value="1" ><span></span></label>
                    </span>
                    </div>

                    <span class="form-text text-muted">{#field_msg_active#}</span>
                </div>

                <div class="col-lg-4">
                    <label>{#field_presentation_date#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="valid_until"
                               required
                               name="item[fecha_presentacion]" value="{$item.fecha_presentacion|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="flaticon-event-calendar-symbol text-info"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_presentation_date#}</span>
                </div>
            </div>
        </div>

        <div class="card-header pt-0 pb-0">
            <h4 class="card-title pt-3 pb-3 m-0 text-black-50">{#title1#}</h4>
        </div>

        <div class="card-body">

            <div class="form-group row">
                <div class="col-lg-12">
                    <label>{#field_name#}  <span class="text-danger bold">*</span> :</label>
                        <div class="input-group">
                            <input type="text" class="form-control"
                                   name="item[nombre]" value="{$item.nombre|escape:"html"}"
                                   required
                                   data-fv-not-empty___message="{#glFieldRequired#}"
                                   minlength=3"
                                   data-fv-string-length___message="{#field_length_name#}"
                            >
                            <div class="input-group-append"><span class="input-group-text"><i class="far fa-building"></i></span></div>
                        </div>
                        <span class="form-text text-black-50">{#field_msg_name#}</span>
                </div>
                <div class="col-lg-12">
                    <label>{#field_address#}:</label>
                        <div class="input-group">
                            <input type="text" class="form-control"
                                   name="item[direccion]" value="{$item.direccion|escape:"html"}"

                                   minlength=3"
                                   data-fv-string-length___message="{#field_length_address#}"
                            >
                        </div>
                        <span class="form-text text-black-50">{#field_msg_address#}</span>
                </div>

                <div class="col-lg-6">
                    <label>{#field_phone#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[telefono]" value="{$item.telefono|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fas fa-phone"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_phone#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#fiel_fax#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer"
                               name="item[fax]" value="{$item.fax|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fas fa-fax"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#fiel_Msg_fax#}</span>
                </div>

                <div class="col-lg-12">
                    <label>{#fiel_email#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[email]" value="{$item.email|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                               minlength=3"
                               data-fv-string-length___message="{#field_length_email#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fas fa-mail-bulk"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#fiel_Msg_email#}</span>
                </div>

                <div class="col-lg-12">
                    <label>{#fiel_nit#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer"
                               name="item[nit]" value="{$item.nit|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                               minlength=3"
                               data-fv-string-length___message="{#field_length_nit#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fas fa-barcode"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#fiel_Msg_nit#}</span>
                </div>

                <div class="col-lg-8">
                    <label>{#field_juridico_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[instalador_tipoempresa_id]" id="type_select"
                                data-placeholder="{#field_Holder_juridico_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.instalador_tipoempresa selected=$item.instalador_tipoempresa_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_juridico_id#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_tipo_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group group">
                        <select class="form-control m-select2 select2_general"
                                name="item[instalador_tipo_id]" id="instalador_tipo_id"
                                data-placeholder="{#field_Holder_tipo_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.instalador_tipo selected=$item.instalador_tipo_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_tipo_id#}</span>
                </div>
            </div>
        </div>

        <div class="card-header pt-0 pb-0">
            <h4 class="card-title pt-3 pb-3 m-0 text-black-50">{#title2#}</h4>
        </div>

        <div class="card-body pb-5">
            <div class="form-group row">
                <div class="col-lg-8">
                    <label>{#field_fundempresa#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer"
                               name="item[fundempresa]" value="{$item.fundempresa|escape:"html"}"

                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="far fa-building"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_fundempresa#}</span>
                </div>

                <div class="col-lg-4">
                    <label>{#field_fundempresa_date#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="valid_until"
                               name="item[fecha_expedicion]" value="{$item.fecha_expedicion|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>

                    <span class="form-text text-black-50">{#field_msg_fundempresa_date#}</span>
                </div>
            </div>
        </div>

        <div class="card-header pt-0 pb-0 {if $item.instalador_tipoempresa_id != '2'}d-none{/if}" id="sociedad_title_div">
            <h4 class="card-title pt-3 pb-3 m-0 text-dark-65">{#title3#}</h4>
        </div>

        <div class="card-body {if $item.instalador_tipoempresa_id != '2'}d-none{/if}" id="sociedad_div">
            <div class="form-group row">
                <div class="col-lg-8">
                    <label>{#field_nro_testimony#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer"
                               name="item[testimonio_numero]" value="{$item.testimonio_numero|escape:"html"}"

                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="flaticon-file-2"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_nro_testimony#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_testimony_date#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="valid_until"
                               name="item[testimonio_fecha]" value="{$item.testimonio_fecha|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>

                    <span class="form-text text-black-50">{#field_msg_testimony_date#}</span>
                </div>

                <div class="col-lg-8">
                    <label>{#fiel_representative#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[representante_legal]" value="{$item.representante_legal|escape:"html"}"

                               minlength=3"
                               data-fv-string-length___message="{#field_length_representative#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="flaticon2-user"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#fiel_Msg_representative#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#fiel_representative_ci#} :</label>
                        <div class="input-group">
                            <input type="text" class="form-control"
                                   name="item[representante_legal_ci]" value="{$item.representante_legal_ci|escape:"html"}"


                            >
                            <div class="input-group-append"><span class="input-group-text"><i class="flaticon2-user"></i></span></div>
                        </div>
                        <span class="form-text text-black-50">{#fiel_Msg_representative_ci#}</span>
                </div>

                <div class="col-lg-8">
                    <label>{#field_representative_nro#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer"
                               name="item[testimonio_poder_numero]" value="{$item.testimonio_poder_numero|escape:"html"}"

                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="flaticon-file-2"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_representative_nro#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_representative_date#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="valid_until"
                               name="item[testimonio_poder_fecha]" value="{$item.testimonio_poder_fecha|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_representative_date#}</span>
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