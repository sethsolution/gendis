<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCYOLt6GKV-5_FGHg_gWVU4R1gU_oCc3G8"></script>
<script src="/js/geo/leaflet.1.7.1/leaflet.js"></script>




<script src="/js/geo/leaflet.spin/example/spin/dist/spin.min.js"></script>
<script src="/js/geo/leaflet.spin/leaflet.spin.min.js"></script>

<script src="/js/geo/leaflet.sidebar-v2/js/leaflet-sidebar.js"></script>


<script src="/js/geo/leaflet.extramarkers/dist/js/leaflet.extra-markers.js">

    <script src="/js/geo/leaflet.fullscreen/Control.FullScreen.js"></script>
<script src="/js/geo/Leaflet.GoogleMutant.js"></script>

<script src="/js/geo/leaflet.ajax/dist/leaflet.ajax.js"></script>
<script src="/js/geo/leaflet.ajax/example/spin.js"></script>

<!--script src="/js/geo/leaflet.groupedlayercontrol/dist/leaflet.groupedlayercontrol.min.js"></script-->
<script src="/js/geo/leaflet.panel-layers/dist/leaflet-panel-layers.min.js"></script>
<script src="/js/geo/leaflet.wms/dist/leaflet.wms.js"></script>
<script src="/js/geo/leaflet.minimap/dist/Control.MiniMap.min.js"></script>
<script src="/js/geo/leaflet.control.custom/Leaflet.Control.Custom.js"></script>

<script src="/js/chart.js/Chart.min.js"></script>


{literal}
<script>
    var filtro_var="";
    var filtro_departamento, filtro_programa;
    var filtro_gd_categoria,filtro_gd_tipo_fuente_generacion;
    var urlsys = '{/literal}{$path_url}{literal}';
    var urljson = urlsys+'/get.point';

    var json_layer;
    var recargar;



    var snippet_tab_item = function () {
        var borra_contenido_tabs = function () {
            {/literal}
            {foreach from=$menu_tab item=row key=idx}
            $("#{$row.id_name}_pane").html("");
            {/foreach}
            {literal}
            reset_estado();
        };
        var handler_tab_build = function(){
            $('[data-toggle="tabajax"]').click(function(e) {
                e.preventDefault();
                var $this = $(this),
                    loadurl = $this.attr('data-href') + filtro_var,
                    targ = $this.attr('data-target');
                id_name =targ;
                targ = "#"+targ+"_pane";
                //Vaciamos el tab
                recargar = 0;
                switch(id_name) {
                {/literal}
                {foreach from=$menu_tab item=row key=idx}
                    case '{$row.id_name}':
                        if ({$row.id_name}_var ==0){
                            {$row.id_name}_var =1;
                            recargar = 1;
                        }
                        break;
                {/foreach}
                {literal}
                }

                if(recargar==1){
                    borra_contenido_tabs();
                    cargando = "<div style='text-align: center;padding-top: 50px;'>Cargando datos...</div>";
                    $(targ).html(cargando);
                    $.get(loadurl, function(data) {
                        $(targ).html(data);
                    });

                    switch(id_name) {
                    {/literal}
                    {foreach from=$menu_tab item=row key=idx}
                        case '{$row.id_name}':
                            {$row.id_name}_var =1;
                            break;
                    {/foreach}
                    {literal}
                    }
                }

                return false;
            });
        };


        {/literal}
        {foreach from=$menu_tab item=row key=idx}
        var {$row.id_name}_var;
        {/foreach}
        {literal}


        var reset_estado = function(){
            {/literal}
            {foreach from=$menu_tab item=row key=idx}
            {$row.id_name}_var = 0;
            {/foreach}
            {literal}
        };

        return {
            init: function() {
                handler_tab_build();
                reset_estado();
            },
            reset_estado: function () {
                reset_estado();
            }
        };
    }();



    var map;
    var snippet_geovisor = function () {

        var map_default_center = [-17.403918, -64.354500];
        var map_default_zoom= 6;
        var geoserver_mmaya = '/geoserver/wms';
        var layer_departamento,layer_municipio;

        /**
         * configuración de variables de los departamentos segun geoserver para geosiarh
         */

        var departamento_geo = {
            "2": "Beni",
            "9": "Chuquisaca",
            "1": "Cochabamba",
            "3": "La Paz",
            "6": "Oruro",
            "5": "Pando",
            "4": "Potosí",
            "8": "Santa Cruz",
            "7": "Tarija"
        };
        var iconByName = function(name) {
            return '<i class="icon icon-'+name+'"></i>';
        };
        var getBaseLayers = function(){
            Grayscale =  L.tileLayer(
                'https://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
                    maxZoom: 18,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
                }),
                mapLink = '<a href="https://openstreetmap.org">OpenStreetMap</a>';
            osmLayer = L.tileLayer(
                'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; ' + mapLink + ' Contributors',
                    maxZoom: 19,
                    id: 'osm'
                }).addTo(map);
            OpenTopoMap = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
                maxZoom: 17,
                attribution: 'Map data: &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, <a href="https://viewfinderpanoramas.org">SRTM</a> | Map style: &copy; <a href="https://opentopomap.org">OpenTopoMap</a> (<a href="https://creativecommons.org/licenses/by-sa/3.0/">CC-BY-SA</a>)'
            });
            googleHybrid = L.gridLayer.googleMutant({
                maxZoom: 24,
                type: "hybrid", // valid values are 'roadmap', 'satellite', 'terrain' and 'hybrid'
            });

            var baseLayers = [{
                group: "Mapas Base",
                icon: '<i class="fa fa-map-marked-alt icon-sm"></i>',
                collapsed: true,
                layers: [
                    { name: "Gray Scale", layer: Grayscale},
                    { name: "OpenStreetMap", layer: osmLayer},
                    { name: "OpenTopoMap", layer: OpenTopoMap},
                    { name: "Google Hybrid", layer: googleHybrid}
                ]
            }];
            return baseLayers;
        };
        var getGroupedOverlays = function(){
            /**
             * Base
             */
            layer_departamento = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'aetn:departamento',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 1.0,
                //styles:'siarh_geovisor_rojo'
            }).addTo(map);
            layer_municipio = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'aetn:municipio',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 0.5
            });

            var overLayers =[
                {
                    group: "Administrativos",
                    collapsed: true,
                    className: "administrativos",
                    name: "grp-admin",
                    layers: [
                        {
                            active: true,
                            name: "Departamento",
                            icon: '<i class="fa fa-map-marked-alt icon-sm"></i>',
                            layer: layer_departamento
                        },
                        {
                            active: true,
                            name: "Municipio",
                            icon: '<i class="fa fa-map-marked-alt icon-sm"></i>',
                            layer: layer_municipio
                        },
                    ]
                },
            ];
            return overLayers;
        };


        var initialiseMap = function(){
            var mapOptions = {
                center: map_default_center//punto
                , zoom: map_default_zoom
                ,fullscreenControl: true
                ,scrollWheelZoom: true
            };
            var m = L.map('map',mapOptions);
            L.control.scale({metric: true, imperial: false}).addTo(m);
            return m;
        };

        var getIconStyle = function(cate,fuente){
            cate = cate -1;
            fuente = fuente-1;
            var icons1 = [
                { markerColor: 'orange'}, //Nanogeneración
                { markerColor: 'cyan'}, //Microgeneración
                { markerColor: 'pink'} //Minigeneración
            ];
            var icons2 = [
                { icon: 'fa-vial',shape: 'circle'}, //Otros
                { icon: 'fa-solar-panel',shape: 'penta'}, //Paneles solares - Fotovoltaica
                { icon: 'fa-fan',shape: 'star'}, // Eólica
                { icon: 'fa-tint',shape: 'star'} // Hidro
            ];
            let resp = L.ExtraMarkers.icon({
                icon: icons2[fuente].icon,
                markerColor: icons1[cate].markerColor,
                shape: icons2[fuente].shape,
                prefix: 'fa'
            });
            return resp;
        };

        var createMap = function(){
            var mapDiv = $('#map');
            mapDiv.parent().addClass("p-0");
            $('#kt_content').addClass("p-0");



            map = initialiseMap();
            // Define a style

            json_layer = new L.GeoJSON.AJAX([urljson],{
                pointToLayer: function(point, latlng) {
                    let ic = getIconStyle(point.properties["gd_categoria_id"],point.properties["gd_tipo_fuente_generacion_id"]);
                    return L.marker(latlng, {icon: ic});
                },
                onEachFeature:popUp

            }).addTo(map);

            /**
             * Mini Mapa
             */
            var osmUrl='https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
            var osmAttrib='';
            var osm2 = new L.TileLayer(osmUrl, {minZoom: 0, maxZoom: 13, attribution: osmAttrib });
            var miniMap = new L.Control.MiniMap(osm2, {
                toggleDisplay: true,
                minimized: true,
                position: "bottomleft",
                //collapsedWidth: 25,
                //collapsedHeight: 25,
                //zoomLevelFixed: 3
            }).addTo(map);

            var sidebar = L.control.sidebar({ container: 'sidebar' }).addTo(map);

            /**
             * Geoserver
             */
            var options = {
                //compact: false,
                collapsibleGroups: !0,
                collapsed: !0,
                //title:"Mapas",
            };
            //layerControl = L.control.groupedLayers(getBaseLayers(), getGroupedOverlays(), options).addTo(map);
            var controlLayers = new L.Control.PanelLayers(getBaseLayers(), getGroupedOverlays(), options);
            map.addControl(controlLayers);
            //controlLayers._map = map;
            //var panelLayers = controlLayers.onAdd(map);
            //$('#vista_control_capas').append(panelLayers)
        };



        var popUp = function(f,l){
            var out = [];
            if (f.properties){
                let info = "";
                info += "<h2 class='titulo'>No. Cuenta: "+f.properties["numero_cuenta"]+"</h2>";
                info +="<div class='titulo2'>Datos técnicos de la instalación </div>";
                info +="<span class=''> Potencia instalada (kW): "+ new Intl.NumberFormat('en-US',{ minimumFractionDigits: 2 }).format(f.properties["potencia_instalada"])+"</span><br>";
                info +="<span class=''>Tensión de servicio (V): "+ new Intl.NumberFormat('en-US',{ minimumFractionDigits: 2 }).format(f.properties["tension"])+"</span>";
                info +="<div class=''>Tipo de conexión del suministro: "+ f.properties["tipo_conexion"]+"</div>";

                info +="<div class='titulo2'>Datos técnicos de la GD </div>";
                info +="<span class=''>Potencia instalada de GD en CA (kW): "+ new Intl.NumberFormat('en-US',{ minimumFractionDigits: 2 }).format(f.properties["potencia"])+"</span><br>";
                info +="<div class=''>Tipo de fuente de generación: "+ f.properties["tipo_fuente_generacion"]+"</div>";
                out.push(info);



                ubicacion ="";
                ubicacion += "<div class='ubicacion_titulo'>Ubicación:</div>";
                ubicacion += "<div class='ubicacion'>Latitud :"+ f.properties["location_latitude_decimal"];
                ubicacion += "/ Longitud:"+ f.properties["location_longitude_decimal"];
                ubicacion += "</div>";
                out.push(ubicacion);

                l.bindPopup(out.join("<br />"));
            }
        };

        var editGd = function(id){
            url = "/plantagd/gd/"+id;
            var win = window.open(url, '_blank');
            win.focus();
        }



        var handle_filtro = function () {
            $('.filtro-buscar').change(function(evt, params){
                filtro_accion();
            });
        };

        var get_filtros_var = function(){
            /**
             * recogemos los datos de los filtros
             */
            filtro_departamento =  $("#filtro_departamento").val();
            filtro_departamento = filtro_departamento==null? '': filtro_departamento.toString();

            filtro_gd_categoria =  $("#filtro_gd_categoria").val();
            filtro_gd_categoria = filtro_gd_categoria==null? '': filtro_gd_categoria.toString();

            filtro_gd_tipo_fuente_generacion =  $("#filtro_gd_tipo_fuente_generacion").val();
            filtro_gd_tipo_fuente_generacion = filtro_gd_tipo_fuente_generacion==null? '': filtro_gd_tipo_fuente_generacion.toString();

            /**
             * variables Get
             */
            filtro_var = "?filter[departamento]="+filtro_departamento+"&filter[filtro_gd_categoria]="+filtro_gd_categoria+"&filter[filtro_gd_tipo_fuente_generacion]="+filtro_gd_tipo_fuente_generacion;
        };

        var wmsGetDepartamentFilter = function(){
            var filtro_cql_str="";
            if (filtro_departamento=="") {
                filtro_cql_str = " name <> 'dato'";
            }else{
                filtro_cql_str = " id in ("+filtro_departamento+")";
            }
            return filtro_cql_str;
        };

        var filtro_accion = function(){
            get_filtros_var();
            snippet_tab_item.reset_estado();
            urljson_filter = urljson + filtro_var;
            json_layer.refresh(urljson_filter);
            /**
             * Para la capa de departamentos
             */
            filtro_cql_str =  wmsGetDepartamentFilter();
            layer_departamento.setParams({CQL_FILTER: filtro_cql_str });
            handle_summary();
        };
        var handle_summary = function (){
            $.get( urlsys+'/get.summary',
                {
                    'item[departamento]': filtro_departamento
                    ,'item[filtro_gd_categoria]': filtro_gd_categoria
                    ,'item[filtro_gd_tipo_fuente_generacion]': filtro_gd_tipo_fuente_generacion
                },
                function(res){
                    $("#total").html(new Intl.NumberFormat('en-US',{ minimumFractionDigits: 0 }).format(res.total)+" ");
                    $("#total_nanogeneracion").html(new Intl.NumberFormat('en-US',{ minimumFractionDigits: 0 }).format(res.nanogeneracion)+" ");
                    $("#total_minigeneracion").html(new Intl.NumberFormat('en-US',{ minimumFractionDigits: 0 }).format(res.minigeneracion)+" ");
                    $("#total_microgeneracion").html(new Intl.NumberFormat('en-US',{ minimumFractionDigits: 0 }).format(res.microgeneracion)+" ");
                },"json");
        };
        /**
         * Funcionalidades de botones
         */
        var setCenterMap = function() {
            map.flyTo(map_default_center, map_default_zoom);
        };

        var window_layers = $('#window_layers');

        var toolButtons = function () {
            /*
            $('#btn_center_map').click(function() {
                setCenterMap();
            });
             */
        };

        var handle_components = function(){
            coreUyuni.setComponents();
        };

        return {
            //main function to initiate the module
            init: function() {
                createMap();
                //toolButtons();
                //closeLayersWindow();

                handle_components();
                handle_filtro();
                handle_summary();
            },
            resumen:function() {
                resumen();
            },
            editGd:function(id){
                editGd(id);
            }

        };

    }();


    jQuery(document).ready(function() {
        snippet_geovisor.init();
        snippet_tab_item.init();
    });

</script>
{/literal}