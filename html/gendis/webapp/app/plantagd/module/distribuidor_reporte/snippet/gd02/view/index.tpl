{include file="index.css.tpl"}
<div class="card card-custom gutter-b example example-compact">
    <div class="card-body pt-0 pb-0 pl-5 pr-5">
        <div class="alert alert-custom fade show pt-1 pb-1 pl-5 pr-5 ayuda" role="alert">
            <div class="alert-icon"><i class="flaticon-upload"></i></div>
            <div class="alert-text text-justify text-dark-65" >{#message#}</div>
        </div>
    </div>

    {if $item.gd02 == 1}
    <div class="card-header py-3">
        <div class="card-title">
            <span class="card-icon"><i class="flaticon2-next text-dark-25"></i></span>
            <h3 class="card-label text-dark-50">{#title2#}</h3>
        </div>
    </div>
    <div class="card-body pb-0 pt-0">

        <div class="row pb-0 mb-0">
            <div class="col-lg-12">
                <div>
                    {#field_adjunto#} :

                    <a href="javascript:snippet_general_form.download('{$item_file.id}');"
                    class="btn btn-icon btn-circle btn-s btn-light-success">
                    <i class="fas fa-cloud-download-alt"></i></a> <span class="text-info" >{$item_file.attached_name}</span>
                    , <span class="text-primary"> {$item_file.attached_size} Mb.</span>,
                    <br>
                    <span class="font-size-xs text-dark-50">
                    Fecha y hora de subida: {$item_file.updated_at}</span>

                </div>
                <span class="form-text text-black-50">{#field_msg_adjunto#}</span>
            </div>
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

                <div class="col-lg-12">
                    <label>{#field_file#} </label>
                    <div class="custom-file">
                        <input type="file" class="form-control m-input custom-file-input"
                               placeholder="{#field_holder_file#}"
                               name="input_file" id="input_file" required data-fv-not-empty___message="Tiene que seleccionar 1 archivo"
                               {*accept="application/msaccess,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/msaccess"*}
                                {$privFace.input}

                        >
                        <label class="custom-file-label file-name" id="input_file_name" for="input_file"></label>
                    </div>

                    <span class="form-text text-black-50">{#field_msg_file#}</span>

                    {if $item.attached_name != ""}
                        {if $type == 'update'}
                            <strong>Archivo:</strong> <span class="m--font-success">{$item.attached_name}</span>
                        {/if}
                    {/if}
                    </span>
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