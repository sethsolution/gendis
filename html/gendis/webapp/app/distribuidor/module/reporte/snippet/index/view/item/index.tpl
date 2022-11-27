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
                <!--begin::Body-->
                <div class="card-body d-flex align-items-center pt-2 pb-2">
                    <div>
                        <h3 class="text-white font-weight-bolder line-height-lg mb-5">{#msg_title#}</h3>
                        {if $item.estado_id == 1 or $item.estado_id == 3}
                            <a href="#" class="btn btn-primary font-weight-bolder" id="btn_enviar" rel="new">
                                <span><i class="fa fa-plus"></i><span> {#btn_send#}</a>
                        {elseif $item.estado_id == 4}
                            <a href="#" class="btn btn-primary font-weight-bolder" id="btn_print" rel="new">
                                <span><i class="fa fa-print"></i><span> {#btn_print#}</a>
                        {/if}
                        <a href="{$path_url}" class="btn btn-light-primary ">
                            <i class="ki ki-double-arrow-back"></i> {#glBtnBack#}
                        </a>
                    </div>
                </div>
                <!--end::Body-->
            </div>
            {if $item.estado_id == 3}
                <div class="alert alert-custom alert-notice alert-light-danger fade show" role="alert">
                    <div class="alert-icon"><i class="flaticon-warning"></i></div>
                    <div class="alert-text">{#msg_obs#}</div>

                </div>
                <div class="text-dark-75">{#msg_obs1#}</div>
            {elseif $item.estado_id == 4}
                <div class="alert alert-custom alert-notice alert-light-primary fade show" role="alert">
                    <div class="alert-icon"><i class="flaticon2-check-mark"></i></div>
                    <div class="text-black">{#msg_aprobado#}</div>
                </div>
            {elseif $item.estado_id == 2}
                <div class="alert alert-custom alert-notice alert-light-warning fade show" role="alert">
                    <div class="alert-icon"><i class="flaticon2-check-mark"></i></div>
                    <div class="text-black">{#msg_send#}</div>
                </div>
                <div class="text-dark-75">{#msg_send1#}</div>
            {elseif $item.estado_id == 1}
                <div class="alert alert-custom alert-notice alert-light-warning fade show" role="alert">
                    <div class="alert-icon"><i class="flaticon2-writing"></i></div>
                    <div class="text-black">{#msg_inicio#}</div>
                </div>
            {/if}

            {if $type !="new"}
            {/if}

        </div>
    </div>

{else}
    {include file=$frontend.error_01}
{/if}

