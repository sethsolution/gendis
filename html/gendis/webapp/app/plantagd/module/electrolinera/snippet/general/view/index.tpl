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

        <div class="card-body  pt-1 pb-0">
            <div class="form-group row">
                <div class="col-lg-12">
                    <label>{#field_nombre#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[nombre]" value="{$item.nombre|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                               minlength="3"
                               data-fv-string-length___message="{#field_length_nombre#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fas flaticon-layer"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_nombre#}</span>
                </div>
                <div class="col-lg-12">
                    <label>{#field_direccion#}<span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[direccion]" value="{$item.direccion|escape:"html"}"
                               minlength="3"
                               data-fv-string-length___message="{#field_length_direccion#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="la la-map-marker"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_direccion#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_departamento_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[departamento_id]" id="departamento_id"
                                data-placeholder="{#field_Holder_departamento_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.departamento selected=$item.departamento_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_departamento_id#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_municipio_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[municipio_id]" id="municipio_id"
                                data-placeholder="{#field_Holder_municipio_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.municipio selected=$item.municipio_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_municipio_id#}</span>
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