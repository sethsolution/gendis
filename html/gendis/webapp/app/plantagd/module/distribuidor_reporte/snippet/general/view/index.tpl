{include file="index.css.tpl"}
<div class="card card-custom gutter-b example example-compact">
    {if $item.estado_id == 1 || $item.estado_id == 2}
        <div class="card-body pt-0 pb-0 pl-5 pr-5">
            <div class="alert alert-custom fade show pt-1 pb-1 pl-5 pr-5 ayuda" role="alert">
                <div class="alert-icon"><i class="flaticon-notes"></i></div>
                <div class="alert-text text-justify text-dark-65" >{#message#}</div>
            </div>
        </div>
    {elseif $item.estado_id == 4}
        <div class="card-body pt-0 pb-0 pl-5 pr-5">
            <div class="alert alert-custom fade show pt-1 pb-1 pl-5 pr-5 ayuda" role="alert">
                <div class="alert-icon"><i class="flaticon2-check-mark"></i></div>
                <div class="alert-text text-justify text-black" >{#message_check#}</div>
            </div>
        </div>
    {elseif $item.estado_id == 3}
        <div class="alert alert-custom alert-outline-danger fade show mb-5" role="alert">
            <div class="alert-icon"><i class="flaticon-warning"></i></div>
            <div class="alert-text">OBSERVACIÓN: {$item.observado_mensaje}</div>
            <div class="alert-close">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true"><i class="ki ki-close"></i></span>
                </button>
            </div>
        </div>
    {/if}

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

        <div class="card-body">
            <div class="form-group row">
                <div class="col-lg-6">
                    <label>{#field_month_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[mes]" id="mes"
                                data-placeholder="{#field_Holder_month_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.mes selected=$item.mes}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_month_id#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_year#} <span class="text-danger bold">*</span>:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer"
                               name="item[anio]" value="{$item.anio|escape:"html"}"
                               required {$privFace.input}
                               placeholder=""
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                    </div>
                    <span class="form-text text-black-50">{#field_msg_year#}</span>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-lg-12">
                    <div class="card-header py-3">
                        <h4 class="card-label text-dark-50">{#field_background#} </h4>
                    </div>
                    {$item.antecedentes}
                </div>
                <div class="col-lg-12">
                    <div class="card-header py-3">
                        <h4 class="card-label text-dark-50">{#fiel_description#} </h4>
                    </div>
                    {$item.descripcion}
                </div>
                <div class="col-lg-12">
                    <div class="card-header py-3">
                        <h4 class="card-label text-dark-50">{#fiel_observation#} </h4>
                    </div>
                   {$item.observaciones}

                </div>
                <div class="col-lg-12">
                    <div class="card-header py-3">
                        <h4 class="card-label text-dark-50">{#fiel_conclusions#} </h4>
                    </div>
                    {$item.conclusiones}
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