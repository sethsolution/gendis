<div class="row" >
    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filterCiae#}:</label>
        <input type="text" class="filtro-buscar-text form-control"
               placeholder="{#filterCiae#}" data-col-index="0">
    </div>
    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filterCompanyName#}:</label>
        <input type="text" class="filtro-buscar-text form-control"
               placeholder="{#filterCompanyName#}" data-col-index="1">
    </div>
    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filterSigla#}:</label>
        <input type="text" class="filtro-buscar-text form-control"
               placeholder="{#filterSigla#}" data-col-index="2">
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

