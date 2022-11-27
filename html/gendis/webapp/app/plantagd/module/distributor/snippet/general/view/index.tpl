{include file="index.css.tpl"}
<div class="card card-custom gutter-b example example-compact">
    <div class="card-header py-3">
        <div class="card-title">
            <span class="card-icon"><i class="flaticon2-next text-dark-25"></i></span>
            <h3 class="card-label text-dark-50">{#title#}</h3>
        </div>
    </div>

    <div class="card-body pt-0 pb-0 pl-5 pr-5">
        <div class="alert alert-custom fade show pt-1 pb-1 pl-5 pr-5 ayuda" role="alert">
            <div class="alert-icon">
                <i class="flaticon-notes"></i>
            </div>
            <div class="alert-text text-justify text-dark-65" >
                {#message#}
            </div>

        </div>
    </div>

    <!--begin::Form-->
    <form method="POST"
          action="{$path_url}/{$subcontrol}_/{if $type=="update"}{$id}/{/if}save/"
          id="general_form">

        <div class="card-body pt-0 pb-0">

        <div class="form-group row">
            <div class="col-lg-4">
                <label>{#fieldCiae#}  <span class="text-danger bold">*</span> :</label>
                <div class="input-group">
                    <input type="text" class="form-control"
                           name="item[ciae]" value="{$item.ciae|escape:"html"}"
                           required
                           data-fv-not-empty___message="{#glFieldRequired#}"
                           minlength=3"
                           data-fv-string-length___message="{#fieldCiaeLength#}"
                    >
                    <div class="input-group-append"><span class="input-group-text"><i class="fa fa-wallet"></i></span></div>
                </div>
                <span class="form-text text-black-50">{#fieldCiaeMsg#}</span>
            </div>


            <div class="col-lg-8">
                <label>{#fieldName#} <span class="text-danger bold">*</span> :</label>
                <div class="input-group">
                    <input type="text" class="form-control"
                           name="item[nombre]"
                           value="{$item.nombre|escape:"html"}"
                           placeholder=""
                           required
                           data-fv-not-empty___message="{#glFieldRequired#}"
                           minlength=3"
                           data-fv-string-length___message="{#fieldNameLength#}"
                    >
                    <div class="input-group-append"><span class="input-group-text"><i class="fa fa-users"></i></span></div>
                </div>
                <span class="form-text text-muted">{#fieldNameMsg#}</span>
            </div>

            <div class="col-lg-4">
                <label>{#fieldSigla#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[sigla]" value="{$item.sigla|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-file-alt"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#fieldSiglaMsg#}</span>
            </div>


            <div class="col-lg-8">
                <label>{#fieldLicense#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[licencia]" value="{$item.licencia|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-id-card-alt"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#fieldLicenseMsg#}</span>
            </div>

            <div class="col-lg-9">
                <label>{#fieldActivity#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[actividad]" value="{$item.actividad|escape:"html"}"

                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-money-check"></i></span></div>
                    </div>
                <span class="form-text text-black-50">{#fieldActivityMsg#}</span>
            </div>
            <div class="col-lg-3">
                <label>{#fieldActiveMsg#}:</label>
                <div class="input-group">
                    <span class="switch switch-icon">
                        <label><input type="checkbox" {if $item.estado == 1}checked="checked"{/if} name="item[estado]" value="1" ><span></span></label>
                    </span>
                </div>

                <span class="form-text text-muted">{#fieldActiveMsg#}</span>
            </div>
            <div class="col-lg-6">
                <label>{#fieldSystem#}:</label>
                    <div class="input-group">
                        <textarea rows="2" class="form-control"
                               name="item[sistema]" value="{$item.sistema|escape:"html"}"

                        >{$item.sistema|escape:'html'}</textarea>
                    </div>
                    <span class="form-text text-black-50">{#fieldSystemMsg#}</span>
            </div>

            <div class="col-lg-6">
                <label>{#fieldDescriptionName#} </label>
                <div class="input-group">
                        <textarea rows="2" class="form-control"
                                  name="item[descripcion]" value="{$item.descripcion|escape:"html"}"

                        >{$item.descripcion|escape:'html'}</textarea>
                </div>
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