{*include file="result/index.css.tpl"*}

<form method="POST"
      action="{$path_url}/{$subcontrol}_/{$item_id}/{if $type=="update"}{$id}/{/if}save/"
      id="form_{$subcontrol}">
        <div class="modal-body">
            <div class="alert alert-primary" role="alert">
                {if $type == 'new'}{#glnew#}{else}{#glupdate#}{/if} - {#title#}
            </div>

            <div class="form-group row">
                <div class="col-lg-12">
                    <label>{#field_name#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[nombre]" value="{$item.nombre|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                               minlength=3"
                               data-fv-string-length___message="{#fieldLength_name#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-layer-group"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#fieldMsg_name#}</span>
                </div>
            </div>
            {foreach from=$numeroModulos item=item}
                <p>{$numeroModulos}</p>
            {/foreach}

            <p>{$item.numeroModulos}</p>
            <p>{$item.numeroModulos}</p>
            {foreach from=$numeroModulos item=item}
                <p> {$numeroModulos}</p>
            {/foreach}
            <p>Soy el modal</p>
            <p>capacidad</p>
            <p>{$item.numeroModulos}</p>
            <p>{$numeroModulos}</p>
            <p>capacidad</p>

        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-light-primary" id="form_close_{$subcontrol}" data-dismiss="modal"><i class="la la-angle-double-left"></i>{#glBtnCloce#}</button>
            <button type="button" class="btn btn-primary font-weight-bold" id="form_submit_{$subcontrol}"><i class="la la-save"></i>{#glBtnSave#}</button>
        </div>
{*        <div class="modal-body">*}
{*            No existe el registro*}
{*        </div>*}

{*        <div class="modal-footer">*}
{*            <button type="button" class="btn btn-light-primary" id="form_close_{$subcontrol}" data-dismiss="modal"><i class="la la-angle-double-left"></i>Cerrar</button>*}
{*        </div>*}

</form>

{include file="result/index.js.tpl"}
