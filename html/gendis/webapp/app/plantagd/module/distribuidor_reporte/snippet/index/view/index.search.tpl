<div class="row">

    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filterMes#}:</label>
        <select class="form-control select2_filter1 filter_select" id="filter_month">
            <option value="no">{#filterMesSelectAll#}</option>
            {html_options options=$cataobj.mes}
        </select>
    </div>

    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filterAnio#}:</label>
        <input type="number" class="filtro-buscar-num form-control m-input"
               placeholder="{#filterAnioHolder#}" data-col-index="0">
    </div>
</div>

