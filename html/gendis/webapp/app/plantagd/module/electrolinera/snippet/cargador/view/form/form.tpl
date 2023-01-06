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
                <div class="col-lg-6">
                    <label>{#field_tipo_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[tipo_id]" id="tipo_id"
                                data-placeholder="{#field_Holder_tipo_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.tipo_cargador selected=$item.tipo_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_tipo_id#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_potencia#} <span class="text-danger bold">*</span> :</label>
                    <input type="text" class="form-control number_integer2"
                           name="item[potencia]"
                           value="{$item.potencia|escape:"html"}"
                           placeholder=""
                           required
                           data-fv-not-empty___message="{#glFieldRequired#}"
                    >
                    <span class="form-text text-black-50">{#field_msg_potencia#}</span>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-lg-4">
                    <label>{#field_cantidad_conector#} <span class="text-danger bold">*</span> :</label>
                    <input type="text" class="form-control number_integer2"
                           name="item[cantidad_conector]"
                           value="{$item.cantidad_conector|escape:"html"}"
                           placeholder=""
                           required
                           data-fv-not-empty___message="{#glFieldRequired#}"
                    >
                    <span class="form-text text-black-50">{#field_msg_cantidad_conector#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_estado_conector_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[estado_conector_id]" id="estado_conector_id"
                                data-placeholder="{#field_Holder_estado_conector_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.estado_conector selected=$item.estado_conector_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_estado_conector_id#}</span>
                </div>
                <div class="col-lg-2">
                    <label>{#field_con_cable#} <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                <span class="switch switch-icon">
                    <label><input type="checkbox" {if $item.con_cable == 1}checked="checked"{/if} name="item[con_cable]" value="1" ><span></span></label>
                </span>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_con_cable#}</span>
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
