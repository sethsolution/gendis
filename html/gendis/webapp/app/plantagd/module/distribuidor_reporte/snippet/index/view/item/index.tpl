{if ($item.id != 0 && $item.id != "" && $type == "update") || $type == "new"}
    {include file="item/index.css.tpl"}
    <div class="d-flex flex-column flex-md-row">
        <div class="flex-md-row-fluid ">
            <div class="card card-custom gutter-b">
                <div class="card-header card-header-tabs-line">
                    <div class="card-toolbar">
                        <ul class="nav nav-tabs nav-tabs-space-lg nav-tabs-line nav-tabs-bold nav-tabs-line-3x" id="myTab" role="tablist">
                            {foreach from=$menu_tab item=row key=idx}
                                <li class="nav-item">
                                    <a class="nav-link"
                                       role="tab"
                                       data-toggle="tabajax"
                                       data-target="#{$row.id_name}_pane"
                                       id = "{$row.id_name}_tab"
                                            {if $type == 'update'}
                                                href="{$path_url}/{$row.id_name}_/{$id}"
                                            {else}
                                                href="{$path_url}/{$row.id_name}_/new/"
                                            {/if}
                                    >
                                        <span class="nav-icon"><i class="{$row.icon}"></i></span>
                                        <span class="nav-text">{$row.label}</span>
                                    </a>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
                <div class="card-body p-0" >
                    <div class="tab-content mt-5" >
                        {foreach from=$menu_tab item=row key=idx}
                            <div class="tab-pane fade" id="{$row.id_name}_pane" role="tabpanel" aria-labelledby="{$row.id_name}-tab"></div>
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
        <div class="flex-md-row-auto w-md-275px w-xl-325px ml-md-6 ml-lg-8">
            <div class="card card-custom bgi-no-repeat gutter-b " style="height: 140px; background-color: #663259;
                        background-position: calc(100% + 0.5rem) 100%; background-size: 100% auto;
                        background-image: url(/themes/metro72/assets/media/svg/patterns/taieri.svg)">
                <div class="card-body d-flex align-items-center pt-2 pb-2">
                    <div>
                        <h3 class="text-white font-weight-bolder line-height-lg mb-5">{#title#}</h3>
                        {if $item.estado_id != '2'}
                            <a href="{$path_url}" class="btn btn-light-primary ">
                                <i class="ki ki-double-arrow-back"></i> {#glBtnBack#}
                            </a>
                        {elseif $item.estado_id == '2'}
                            <div class="{if $item.observado != '0'}d-none{/if}" id="boton_aprobar_div">
                                <a href="#" class="btn btn-primary font-weight-bolder" id="btn_aprobar" rel="new">
                                    <span><i class="fa fa-plus"></i><span> {#btnAprobar#}</a>
                                <a href="{$path_url}" class="btn btn-light-primary ">
                                    <i class="ki ki-double-arrow-back"></i> {#glBtnBack#}
                                </a>
                            </div>
                            <div class="{if $item.observado != '1'}d-none{/if}" id="boton_observar_div">
                                <a href="#" class="btn btn-danger font-weight-bolder" id="btn_observar" rel="new">
                                    <span><i class="fa fa-plus"></i><span> {#btnObservar#}</a>
                                <a href="{$path_url}" class="btn btn-light-primary ">
                                    <i class="ki ki-double-arrow-back"></i> {#glBtnBack#}
                                </a>
                            </div>
                        {/if}
                    </div>
                </div>
                <!--end::Body-->
            </div>
            {if $item.estado_id != 1}
                <div class="card card-custom bgi-no-repeat gutter-b " style=" background-color: #f5ecf5;">
                    {if $item.estado_id != 3 && $item.estado_id != 4}
                        <span class="form-text text-black"> {#mensaje_obs#}</span>
                        <div class="modal-body">
                            <div class="form-group row">
                                <div class="col-lg-12">
                                    <label class="text-blacke font-weight-bolder line-height-lg mb-5">¿Observar?:</label>
                                    <div class="input-group">
                                            <span class="switch switch-icon">
                                                <label><input type="checkbox" {if $item.observado == 1}checked="checked"{/if}
                                                        name="item[observado]" value="1" id="checkbox_observado"
                                                            {$privFace.input}><span></span></label>
                                            </span>
                                    </div>
                                </div>
                                <div class="col-lg-12 {if $item.observado != '1'}d-none{/if}" id="observado_div">
                                    <div class="m-input-icon m-input-icon--right">
                                        <div class="summernote" id="observacion">{$item.observado_mensaje}</div>
                                        <input class="form-control m-input" type="hidden" name="item[observado_mensaje]"
                                               id="observacion_input" {$privFace.input}>
                                    </div>
                                    <a href="#" class="btn btn-light-danger font-weight-bolder" id="btn_guardar_observacion" rel="new">
                                        <span><i class="fa fa-save"></i><span> {#btnGuardarObs#}</a>
                                </div>
                            </div>
                        </div>
                     {elseif $item.estado_id == 4}
                        <div class="alert alert-custom alert-notice alert-light-primary fade show" role="alert">
                            <div class="alert-icon"><i class="flaticon2-check-mark"></i></div>
                            <div class="alert-text">{#msgApro#}</div>
                        </div>
                    {elseif $item.estado_id == 3}
                        <div class="alert alert-custom alert-notice alert-light-danger fade show" role="alert">
                            <div class="alert-icon"><i class="flaticon-warning"></i></div>
                            <div class="alert-text">{#msgObs#}</div>
                        </div>
                    {/if}
                </div>
            {/if}
            {if $type !="new"}{/if}
        </div>
    </div>
{else}
    {include file=$frontend.error_01}
{/if}

