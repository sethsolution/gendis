{literal}
<script>

    var table_list;
    var snippet_list = function() {
        "use strict";
        var urlsys = '{/literal}{$path_url}{literal}';
        var initTable = function() {
            let table_list_var = $('#index_list');
            let export_title = "{/literal}{#dataTableExportTitle#}{literal}";
            let noExport = tableSetting.noExport;
            // begin first table
            table_list = table_list_var.DataTable({
                initComplete: function(settings, json) {
                    $('#index_list').removeClass('d-none');
                },
                keys: {
                    columns: noExport,
                    clipboard: false,
                },
                dom: tableSetting.dom,
                buttons: [
                    /*
                    {extend:'colvis',text:lngUyuni.dataTableWatch
                        ,columnText: function ( dt, idx, title ) {
                            return (idx+1)+': '+title;
                        }
                    },

                     */
                    {extend:'excelHtml5'
                        ,exportOptions: {columns: noExport}
                        , title: export_title
                    },
                    {extend:'pdfHtml5'
                        ,exportOptions: {columns: noExport}
                        , title: export_title
                        , download: 'open'

                        , pageSize: 'LETTER'
                        ,customize: function(doc) {
                            doc.styles.tableHeader.fontSize = 7;
                            doc.defaultStyle.fontSize = 7;
                            doc.pageMargins= [ 20, 20];
                        }
                    },
                    {extend:'print'
                        ,exportOptions: {columns: noExport}
                        ,text: lngUyuni.dataTablePrint
                    }

                ],
                responsive: true,
                colReorder: true,
                language: {"url": "/language/js/datatable."+lng+".json"},
                lengthMenu: [[10, 25, 50,-1], [10, 25, 50, lngUyuni.dataTableAll]],
                pageLength: 10,
                //order: [[ 1, "asc" ]], // Por que campo ordenara al momento de desplegar
                InfoFiltered: false,
                searchDelay: 500,
                processing: true,
                serverSide: true,
                ajax: {
                    url: urlsys+'/list',
                    type: 'POST',
                    data: {},
                },
                columns: [
                    {/literal}{foreach from=$gridItem item=row key=idx}
                    {if $idx != 0},{/if}{literal}{data: '{/literal}{if $row.as}{$row.as}{else}{$row.field}{/if}{literal}'{/literal}{if $row.responsive}, responsivePriority: -1{/if}{literal}}{/literal}
                    {/foreach}{literal}
                ],
                /*
                rowGroup: {
                    dataSrc: ['parentname','groupname']
                },

                 */
                columnDefs: [
                    {
                        targets: -1,
                        width: "80px",
                        className: 'noExport',
                        orderable: false,
                        searchable: false,
                        render: function(data, type, full, meta) {
                            var boton = '<div class="btn-group btn-group-sm " role="group" aria-label="Accion">';
                            var lbEdit = lngUyuni.btnViewData;
                            boton += '<a href="javascript:snippet_list.update(\''+data+'\');" class="btn btn-success btn-sm" title="'+lbEdit+'">'+lbEdit+'</a>';
                            boton += '<div>';
                            return boton;
                        },
                    },
                    {
                        targets: 1,
                        render: function(data, type, full, meta) {
                            var status = {
                                '1': {'name': 'Enero'},
                                '2': {'name': 'Febrero'},
                                '3': {'name': 'Marzo'},
                                '4': {'name': 'Abril'},
                                '5': {'name': 'Mayo'},
                                '6': {'name': 'Junio'},
                                '7': {'name': 'Julio'},
                                '8': {'name': 'Agosto'},
                                '9': {'name': 'Septiembre'},
                                '10': {'name': 'Octubre'},
                                '11': {'name': 'Noviembre'},
                                '12': {'name': 'Diciembre'},
                            };
                            if (typeof status[data] === 'undefined') {
                                return data;
                            }
                            return '<span >' + status[data].name + '</span>';
                        },
                    },
                    {
                        targets: [3,4],
                        width: '60px',
                        className: 'text-center',
                        render: function(data, type, full, meta) {
                            var status = {
                                'false': { 'state': 'metal'},
                                'true': { 'state': 'success'}
                            };
                            if (typeof status[data] === 'undefined') {
                                return data;
                            }
                            return '<i class="fa fa-check-double text-' + status[data].state + '"></i>';
                        },
                    },
                    {
                        targets: 7,
                        width: "80px",
                        render: function(data, type, full, meta) {
                            var status = {
                                'En Proceso': {'title': 'En proceso', 'class': ' label-light-primary'},
                                'Enviado': {'title': 'Enviado', 'class': ' label-light-info'},
                                'Observado': {'title': 'Observado', 'class': ' label-light-danger'},
                                'Aprobado': {'title': 'Aprobado', 'class': ' label-light-success'},
                            };
                            if (typeof status[data] === 'undefined') {
                                return data;
                            }
                            return '<span class="label label-lg font-weight-bold' + status[data].class + ' label-inline">' + status[data].title + '</span>';
                        },
                    },
                    {
                        targets: [1],
                        searchable: false,
                    },
                    {
                        targets: [-2,-3, 8],
                        className: "none"
                    },
                    {
                        targets: [5],
                        render: function(data,type,full,meta){
                            if (data == null){ data = "";}
                            return '<span class="text-primary font-size-xl">' + data+ '</span>';
                        },
                    },
                    {
                        targets: [-2,-3],
                        render: function(data,type,full,meta){
                            if (data == null){ data = "";}
                            return '<span class="text-primary font-size-xs">' + data+ '</span>';
                        },
                    },
                    {
                        targets: [6, 8],
                        render: function(data,type,full,meta){
                            if (data == null){ data = "";}
                            return '<span class="text-info font-size-xl">' + data+ '</span>';
                        },
                    },

                ],
            });
        };
        /**
         * New and Update
         */
        var btn_update = $('#btn_update');
        var handle_button_update = function(){
            btn_update.click(function(e){
                e.preventDefault();
                item_update("","new");
            });
        };

        var item_update = function(id,type){
            coreUyuni.itemUpdateIndex(id,type,urlsys);
        };
        /**
         * Delete
         */
        var  item_delete = function(id){
            var url = urlsys+"/"+id+"/delete";
            coreUyuni.itemDelete(id,url,table_list);
        };
        /**
         * Inicializar componentes
         */
        var handle_components = function(){
            coreUyuni.setComponents();
            $('.select2_filter1').select2({
                placeholder: lngUyuni.select2PlaceHolder,
                width: '100%',
                minimumResultsForSearch: -1
            });
        };

        /**
         * Filtros
         */
        var filter_month = $('#filter_month');

        var handle_filtro = function () {
            coreUyuni.tableFilter();
            $('.filter_select').on('change',function(){
                filer_select();
            });
        };
        var url_filter = urlsys+'/list';
        var filer_select = function () {
            var month = filter_month.val();
            var query = "?filter[month]="+month;
            //query += "&filter[skin]="+skin;
            console.log(query);
            table_list.ajax.url( url_filter+query ).load();
        };

        return {
            //main function to initiate the module
            init: function() {
                initTable();
                handle_button_update();
                handle_components();
                handle_filtro();
            },
            update: function(id,type){
                item_update(id,type);
            },
            delete: function(id){
                item_delete(id);
            },
        };

    }();

    jQuery(document).ready(function() {
        snippet_list.init();
    });
</script>
{/literal}