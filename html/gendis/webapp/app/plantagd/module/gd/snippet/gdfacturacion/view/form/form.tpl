{include file="form/form.css.tpl"}
<form method="POST"
      action="{$path_url}/{$subcontrol}_/{$item_id}/{if $type=="update"}{$id}/{/if}save/"
      id="form_{$subcontrol}">
    {if $item.id != "" or $type == 'new'}
        <div class="modal-body">
            <div class="alert alert-primary" role="alert">
                {if $type == 'new'}{#glnew#}{else}{#glupdate#}{/if} - {#title#}
            </div>

            <div class="form-group row">

                <div class="col-lg-6 mb-2 ">
                    <div class="cuadro-verde p-4" >
                        {#field_codigo#}: {$item_padre.numero_cuenta|escape:'html'}
                        <br>{#field_nombre#}: {$item_padre.nombre_consumidor|escape:'html'}
                    </div>
                </div>
                <div class="col-lg-4">
                    <label>{#field_mes#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[mes]" id="mes"
                                data-placeholder="{#field_holder_mes#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.mes selected=$item.mes}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_mes#}</span>
                </div>
                <div class="col-lg-2">
                    <label>{#field_anio#} <span class="text-danger bold">*</span>:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer"
                               name="item[anio]" value="{$item.anio|escape:"html"}"
                               required
                               placeholder=""
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >

                    </div>
                    <span class="form-text text-black-50">{#field_msg_anio#}</span>
                </div>

                {*
                <div class="col-lg-3">
                    <label>{#field_gd_categoria_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[gd_categoria_id]" id="gd_categoria_id"
                                data-placeholder="{#field_holder_gd_categoria_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.categoria selected=$item.gd_categoria_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_gd_categoria_id#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_numero_gd#} <span class="text-danger bold">*</span>:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer text-right"
                               name="item[numero_gd]" value="{$item.numero_gd|escape:"html"}"
                               required
                               placeholder=""
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                    </div>
                    <span class="form-text text-black-50">{#field_msg_numero_gd#}</span>
                </div>
*}
                <div class="col-lg-4">
                    <label>{#field_energia_generada#} <span class="text-danger bold">*</span>:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal text-right"
                               name="item[energia_generada]" value="{$item.energia_generada|escape:"html"}"
                               required
                               placeholder=""
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-clipboard"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_energia_generada#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_energia_cosumida#} <span class="text-danger bold">*</span>:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal text-right"
                               name="item[energia_consumida]" value="{$item.energia_consumida|escape:"html"}"
                               required
                               placeholder=""
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-clipboard"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_energia_cosumida#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_energia_autoconsumida#} <span class="text-danger bold">*</span>:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal text-right"
                               name="item[energia_autoconsumida]" value="{$item.energia_autoconsumida|escape:"html"}"
                               required
                               placeholder=""
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-clipboard"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_energia_autoconsumida#}</span>
                </div>

                <div class="col-lg-4">
                    <label>{#field_importe_disponibilidad_red#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal text-right amount"
                               name="item[importe_disponibilidad_red]" value="{$item.importe_disponibilidad_red|escape:"html"}"
                               placeholder=""
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-money-bill"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_importe_disponibilidad_red#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_energia_inyectada#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal text-right"
                               name="item[energia_inyectada]" value="{$item.energia_inyectada|escape:"html"}"
                               placeholder=""
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-clipboard"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_energia_inyectada#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_energia_neta#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal text-right"
                               name="item[energia_neta]" value="{$item.energia_neta|escape:"html"}"
                               placeholder=""
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-clipboard-check"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_energia_neta#}</span>
                </div>

                <div class="col-lg-4">
                    <label>{#field_energia_nocompensada_mes#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal text-right"
                               name="item[energia_nocompensada_mes]" value="{$item.energia_nocompensada_mes|escape:"html"}"
                               placeholder=""
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-clipboard"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_energia_nocompensada_mes#}</span>

                </div>
                <div class="col-lg-4">
                    <label>{#field_energia_nocompensada_total#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal totalamount text-right"
                               name="item[energia_nocompensada_total]" value="{$item.energia_nocompensada_total|escape:"html"}"
                               placeholder=""
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-clipboard-check"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_energia_nocompensada_total#}</span>

                </div>
                <div class="col-lg-4">
                    <label>{#field_energia_excluida_mes#} <span class="text-danger bold">*</span>:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal text-right"
                               name="item[energia_nocompensada_excluida_mes]" value="{$item.energia_nocompensada_excluida_mes|escape:"html"}"
                               required
                               placeholder=""
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-clipboard"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_energia_excluida_mes#}</span>

                </div>

                <div class="col-lg-4">
                    <label>{#field_energia_excluida_total#} <span class="text-danger bold">*</span>:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal totalamount text-right"
                               name="item[energia_nocompensada_excluida_total]" value="{$item.energia_nocompensada_excluida_total|escape:"html"}"
                               required
                               placeholder=""
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-clipboard-check"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_energia_excluida_total#}</span>

                </div>
                <div class="col-lg-4">
                    <label>{#field_importe_energia_inyectada#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal amount text-right"
                               name="item[importe_energia_inyectada]" value="{$item.importe_energia_inyectada|escape:"html"}"
                               placeholder=""
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-money-bill"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_importe_energia_inyectada#}</span>

                </div>
                <div class="col-lg-4">
                    <label>{#field_importe_total_facturado#} <span class="text-danger bold">*</span>:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal amount text-right"
                               name="item[importe_total_facturado]" value="{$item.importe_total_facturado|escape:"html"}"
                               required
                               placeholder=""
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-money-bill"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_importe_total_facturado#}</span>

                </div>

            </div>
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-light-primary" id="form_close_{$subcontrol}" data-dismiss="modal"><i class="la la-angle-double-left"></i>{#glBtnCloce#}</button>
            <button type="button" class="btn btn-primary font-weight-bold" id="form_submit_{$subcontrol}"><i class="la la-save"></i>{#glBtnSave#}</button>
        </div>

    {else}
        <div class="modal-body">
            No existe el registro
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-light-primary" id="form_close_{$subcontrol}" data-dismiss="modal"><i class="la la-angle-double-left"></i>Cerrar</button>
        </div>
    {/if}

</form>

{include file="form/form.js.tpl"}
