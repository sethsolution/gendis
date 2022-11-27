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

        <div class="card-body">
            <div class="form-group row">
                <div class="col-lg-12">
                    <label>{#field_title#}  <span class="text-danger bold">*</span> :</label>
                        <div class="input-group">
                            <input type="text" class="form-control"
                                   name="item[titulo]" value="{$item.titulo|escape:"html"}"
                                   required
                                   data-fv-not-empty___message="{#glFieldRequired#}"
                                   minlength=3"
                                   data-fv-string-length___message="{#field_length_title#}"
                            >
                            <div class="input-group-append"><span class="input-group-text"><i class="fa fa-book"></i></span></div>
                        </div>
                        <span class="form-text text-black-50">{#field_msg_title#}</span>
                </div>

                <div class="col-lg-4">
                    <label>{#field_category_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[categoria_id]" id="type_select"
                                data-placeholder="{#field_Holder_category_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.archivo_categoria selected=$item.categoria_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_category_id#}</span>
                </div>

                <div class="col-lg-4">
                    <label>{#field_date#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="valid_until"
                               name="item[fecha_publicacion]" value="{$item.fecha_publicacion|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>

                    <span class="form-text text-black-50">{#field_msg_date#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_active#}:</label>
                    <div class="input-group">
                    <span class="switch switch-icon">
                        <label><input type="checkbox" {if $item.activo == 1}checked="checked"{/if}
                                      name="item[activo]" id="checkbox_activo" value="1" ><span></span></label>
                    </span>
                    </div>
                    <span class="form-text text-muted">{#field_msg_active#}</span>
                </div>

                <div class="col-lg-12">

                    <label>{#field_sumary#} </label>
                    <div class="m-input-icon-icon--right">
                        <div class="summernote" id="resumen">{$item.resumen}</div>
                        <input class="form-control" type="hidden" name="item[resumen]"
                               id="resumen_input" {$privFace.input}>
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