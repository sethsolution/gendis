<div class="row" >
    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filter_instalador_tipo#}:</label>
        <select class="filtro-buscar form-control select2_busqueda"  data-col-index="2" >
            <option value="3">{#filter_instalador_tipo_all#}</option>
            {html_options options=$cataobj.instalador_tipo}
        </select>
    </div>

    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filterName#}:</label>
        <input type="text" class="filtro-buscar-text form-control" placeholder="{#filterName#}" data-col-index="0">
    </div>
    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filterNIT#}:</label>
        <input type="text" class="filtro-buscar-text form-control" placeholder="{#filterNIT#}" data-col-index="1">
    </div>
    {*
    <div class="col-lg-4 alert-text">
        <label>{#filterAppStatus#}:</label>
        <select class="filtro-buscar form-control select2_busqueda"  data-col-index="3">
            <option value="3">{#filterAppStatusSelectAll#}</option>
            {html_options options=$cataobj.activo}
        </select>
    </div>
    *}

</div>

