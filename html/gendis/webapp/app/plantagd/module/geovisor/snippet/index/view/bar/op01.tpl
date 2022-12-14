<h4 class="titulo_esta">Filtro</h4>

<div class="row  fade show mb-5 p-2" >

    <div class="col-lg-12 alert-text">
        <label>Departamento:</label>
        <select class="filtro-buscar form-control select2_busqueda"
                name="filtro[departamento]" id="filtro_departamento"
                multiple placeholder="Buscar por nombre">
            {html_options options=$cataobj.departamento}
        </select>
    </div>

    <div class="col-lg-12 alert-text">
        <label>Categoría GD:</label>
        <select class="filtro-buscar form-control select2_busqueda"
                name="filtro[gd_categoria]" id="filtro_gd_categoria"
                multiple placeholder="Buscar por nombre">
            {html_options options=$cataobj.gd_categoria}
        </select>
    </div>

    <div class="col-lg-12 alert-text">
        <label>Tipo de fuente de generación:</label>
        <select class="filtro-buscar form-control select2_busqueda"
                name="filtro[gd_tipo_fuente_generacion]" id="filtro_gd_tipo_fuente_generacion"
                multiple placeholder="Buscar por nombre">
            {html_options options=$cataobj.gd_tipo_fuente_generacion}
        </select>
    </div>

</div>

<div class=" card-custom gutter-b">
    <!--begin::Body-->
    <div class="card-body p-0">
        <!--begin::Wrapper-->

        <h4 class="titulo_esta">Cantidad de GD por Categoria</h4>

        <div class="d-flex justify-content-between flex-column h-100 mb-5">
            <!--begin::Container-->
                <div class="mt-0 mb-0">
                    <div class="row row-paddingless mb-10">
                        <!--begin::Item-->
                        <div class="col">
                            <div class="d-flex align-items-center mr-2">
                                <div  class="symbol symbol-45 symbol-info mr-4 flex-shrink-0" >
                                    <div class="symbol-label" style="background: #00801d!important;">
																				<span class="svg-icon svg-icon-lg svg-icon-white">
																			<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24" height="24"></rect>
																					<rect fill="#000000" opacity="0.3" x="13" y="4" width="3" height="16" rx="1.5"></rect>
																					<rect fill="#000000" x="8" y="9" width="3" height="11" rx="1.5"></rect>
																					<rect fill="#000000" x="18" y="11" width="3" height="9" rx="1.5"></rect>
																					<rect fill="#000000" x="3" y="13" width="3" height="7" rx="1.5"></rect>
																				</g>
																			</svg>
																		</span>
                                    </div>
                                </div>
                                <div>
                                    <div class="font-size-h4 text-dark-75 font-weight-bolder" id="total"></div>
                                    <div class="font-size-sm text-dark-65 font-weight-bold mt-1">Total GD</div>
                                </div>
                            </div>
                        </div>
                        <!--end::Item-->
                        <!--begin::Item-->
                        <div class="col">
                            <div class="d-flex align-items-center mr-2">
                                <!--begin::Symbol-->
                                <div class="symbol symbol-45 symbol-danger mr-4 flex-shrink-0">
                                    <div class="symbol-label" style="background: #ea6d18;">
																				<span class="svg-icon svg-icon-lg svg-icon-white">
																			<!--begin::Svg Icon | path:assets/media/svg/icons/Layout/Layout-4-blocks.svg-->
																			<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24" height="24"></rect>
																					<rect fill="#000000" x="4" y="4" width="7" height="7" rx="1.5"></rect>
																					<path d="M5.5,13 L9.5,13 C10.3284271,13 11,13.6715729 11,14.5 L11,18.5 C11,19.3284271 10.3284271,20 9.5,20 L5.5,20 C4.67157288,20 4,19.3284271 4,18.5 L4,14.5 C4,13.6715729 4.67157288,13 5.5,13 Z M14.5,4 L18.5,4 C19.3284271,4 20,4.67157288 20,5.5 L20,9.5 C20,10.3284271 19.3284271,11 18.5,11 L14.5,11 C13.6715729,11 13,10.3284271 13,9.5 L13,5.5 C13,4.67157288 13.6715729,4 14.5,4 Z M14.5,13 L18.5,13 C19.3284271,13 20,13.6715729 20,14.5 L20,18.5 C20,19.3284271 19.3284271,20 18.5,20 L14.5,20 C13.6715729,20 13,19.3284271 13,18.5 L13,14.5 C13,13.6715729 13.6715729,13 14.5,13 Z" fill="#000000" opacity="0.3"></path>
																				</g>
																			</svg>
                                                                                    <!--end::Svg Icon-->
																		</span>
                                    </div>
                                </div>
                                <!--end::Symbol-->
                                <!--begin::Title-->
                                <div>
                                    <div class="font-size-h4 text-dark-75 font-weight-bolder" id="total_nanogeneracion"></div>
                                    <div class="font-size-sm text-dark-65  font-weight-bold mt-1">Nanogeneración</div>
                                </div>
                                <!--end::Title-->
                            </div>
                        </div>
                        <!--end::Item-->
                    </div>
                    <div class="row row-paddingless">
                        <!--begin::Item-->
                        <div class="col">
                            <div class="d-flex align-items-center mr-2">
                                <!--begin::Symbol-->
                                <div class="symbol symbol-45 symbol-light-success mr-4 flex-shrink-0">
                                    <div class="symbol-label" style="background: #1e8ed2;">
																				<span class="svg-icon svg-icon-lg svg-icon-white">
																			<!--begin::Svg Icon | path:assets/media/svg/icons/Layout/Layout-4-blocks.svg-->
																			<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24" height="24"></rect>
																					<rect fill="#000000" x="4" y="4" width="7" height="7" rx="1.5"></rect>
																					<path d="M5.5,13 L9.5,13 C10.3284271,13 11,13.6715729 11,14.5 L11,18.5 C11,19.3284271 10.3284271,20 9.5,20 L5.5,20 C4.67157288,20 4,19.3284271 4,18.5 L4,14.5 C4,13.6715729 4.67157288,13 5.5,13 Z M14.5,4 L18.5,4 C19.3284271,4 20,4.67157288 20,5.5 L20,9.5 C20,10.3284271 19.3284271,11 18.5,11 L14.5,11 C13.6715729,11 13,10.3284271 13,9.5 L13,5.5 C13,4.67157288 13.6715729,4 14.5,4 Z M14.5,13 L18.5,13 C19.3284271,13 20,13.6715729 20,14.5 L20,18.5 C20,19.3284271 19.3284271,20 18.5,20 L14.5,20 C13.6715729,20 13,19.3284271 13,18.5 L13,14.5 C13,13.6715729 13.6715729,13 14.5,13 Z" fill="#000000" opacity="0.3"></path>
																				</g>
																			</svg>
                                                                                    <!--end::Svg Icon-->
																		</span>
                                    </div>
                                </div>
                                <!--end::Symbol-->
                                <!--begin::Title-->
                                <div>
                                    <div class="font-size-h4 text-dark-75 font-weight-bolder" id="total_microgeneracion"></div>
                                    <div class="font-size-sm text-dark-65  font-weight-bold mt-1">Microgeneración</div>
                                </div>
                                <!--end::Title-->
                            </div>
                        </div>
                        <!--end::Item-->
                        <!--begin::Item-->
                        <div class="col">
                            <div class="d-flex align-items-center mr-2">
                                <!--begin::Symbol-->
                                <div class="symbol symbol-45 symbol-light-primary mr-4 flex-shrink-0">
                                    <div class="symbol-label" style="background:#a9347d;">
																				<span class="svg-icon svg-icon-lg svg-icon-white">
																			<!--begin::Svg Icon | path:assets/media/svg/icons/Layout/Layout-4-blocks.svg-->
																			<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24" height="24"></rect>
																					<rect fill="#000000" x="4" y="4" width="7" height="7" rx="1.5"></rect>
																					<path d="M5.5,13 L9.5,13 C10.3284271,13 11,13.6715729 11,14.5 L11,18.5 C11,19.3284271 10.3284271,20 9.5,20 L5.5,20 C4.67157288,20 4,19.3284271 4,18.5 L4,14.5 C4,13.6715729 4.67157288,13 5.5,13 Z M14.5,4 L18.5,4 C19.3284271,4 20,4.67157288 20,5.5 L20,9.5 C20,10.3284271 19.3284271,11 18.5,11 L14.5,11 C13.6715729,11 13,10.3284271 13,9.5 L13,5.5 C13,4.67157288 13.6715729,4 14.5,4 Z M14.5,13 L18.5,13 C19.3284271,13 20,13.6715729 20,14.5 L20,18.5 C20,19.3284271 19.3284271,20 18.5,20 L14.5,20 C13.6715729,20 13,19.3284271 13,18.5 L13,14.5 C13,13.6715729 13.6715729,13 14.5,13 Z" fill="#000000" opacity="0.3"></path>
																				</g>
																			</svg>
                                                                                    <!--end::Svg Icon-->
																		</span>
                                    </div>
                                </div>
                                <!--end::Symbol-->
                                <!--begin::Title-->
                                <div>
                                    <div class="font-size-h4 text-dark-75 font-weight-bolder" id="total_minigeneracion"></div>
                                    <div class="font-size-sm text-dark-65  font-weight-bold mt-1">Minigeneración</div>
                                </div>
                                <!--end::Title-->
                            </div>
                        </div>
                        <!--end::Item-->
                    </div>
                </div>


            <!--eng::Container-->
        </div>
        <!--end::Wrapper-->


    </div>
    <!--end::Body-->
</div>
