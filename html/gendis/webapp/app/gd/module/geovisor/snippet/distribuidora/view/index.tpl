{include file="index.css.tpl"}

{*<div class="card card-custo p-1 m-0" >*}
<div class=" card-custom gutter-b">
    <div class="row p-0">
        <div class="col-lg-12">
            <h4 class="titulo_esta">Potencia Instalada (kW)</h4>
            <canvas id="chart_cantidad" width="auto" height="350"  ></canvas>
        </div>

        <div class="col-lg-12">
            <h4 class="titulo_esta">Potencia instala por categoria (kW)</h4>
            <canvas id="chart_monto_dos" width="auto" height="450"></canvas>
        </div>

        <div class="col-lg-12">
            <h4 class="titulo_esta">Cantidad de GD por Distribuidoras y Categoría </h4>
            <canvas id="chart_gd_tipo_fuente_generacion" width="auto" height="350"  ></canvas>
        </div>
    </div>
</div>

{include file="index.js.tpl"}
