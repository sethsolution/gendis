<div class="row">
    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filter_gd_categoria#}:</label>
        <select class="filtro-buscar form-control select2_busqueda"  data-col-index="3" >
            <option value="3">{#filter_gd_categoria_all#}</option>
            {html_options options=$cataobj.gd_categoria}
        </select>
    </div>

    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filterCode#}:</label>
        <input type="text" class="filtro-buscar-text form-control"
               placeholder="{#filterFolderNameHolder#}" data-col-index="0">
    </div>
    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filterName#}:</label>
        <input type="text" class="filtro-buscar-text form-control"
               placeholder="{#filterNameHolder#}" data-col-index="1">
    </div>
    <!--<div class="col-lg-4 alert-text">
        <label>{#filterStatus#}:</label>
        <select class="filtro-buscar form-control select2_busqueda"  data-col-index="3">
            <option value="3">{#filterAppStatusSelectAll#}</option>
            {html_options options=$cataobj.activo}
        </select>
    </div>-->

</div>

