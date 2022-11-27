{literal}
<script>
    var table_list_1;
    var table_list_2;
    var table_list_3;

    var snippet_list = function() {
        "use strict";
        var urlsys = '{/literal}{$path_url}/{$subcontrol}_/{$id}{literal}';

        var initTable = function(category_id) {

            let table_list_var = $('#tabla_{/literal}{$subcontrol}{literal}_'+category_id);
            let export_title = "{/literal}{#dataTableExportTitle#}{literal}";
            let noExport = tableSetting.noExport;
            let table_list_temp = table_list_var.DataTable({
                initComplete: function(settings, json) {
                    table_list_var.removeClass('d-none');
                },
                keys: {
                    columns: noExport,
                    clipboard: false,
                },
                //dom: tableSetting.dom,
                dom: `<'row'>
                <'row'<'col-sm-12'tr>>
                <'row'>`,
                buttons: [
                    {extend:'colvis',text:lngUyuni.dataTableWatch
                        ,columnText: function ( dt, idx, title ) {
                            return (idx+1)+': '+title;
                        }
                    },
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
                colReorder: true,
                responsive: true,
                language: {"url": "/language/js/datatable."+lng+".json"},
                lengthMenu: [[10, 25, 50,-1], [10, 25, 50, lngUyuni.dataTableAll]],
                pageLength: -1,
                order: [[ 0, "asc" ]], // Por que campo ordenara al momento de desplegar
                InfoFiltered: false,
                searchDelay: 500,
                processing: true,
                serverSide: true,
                ajax: {
                    url: urlsys+'/list?category_id='+category_id,
                    type: 'POST',
                    data: {},
                },
                columns: [
                    {/literal}{foreach from=$gridItem item=row key=idx}
                    {if $idx != 0},{/if}{literal}{data: '{/literal}{if $row.as}{$row.as}{else}{$row.field}{/if}{literal}'{/literal}{if $row.responsive}, responsivePriority: -1{/if}{literal}}{/literal}
                    {/foreach}{literal}
                ],
                columnDefs: [
                    {
                        targets: -1,
                        width: "90px",
                        className: 'noExport',
                        orderable: false,
                        searchable: false,
                        render: function(data, type, full, meta) {
                            var boton = '<div class="btn-group btn-group-sm " role="group" aria-label="Accion">';
                            var lbEdit = {/literal}{if $privFace.edit == 1}lngUyuni.btnEdit{else}lngUyuni.btnViewData{/if}{literal};
                            boton += '<a href="javascript:snippet_list.update(\''+data+'\');" class="btn btn-success btn-sm" title="'+lbEdit+'">'+lbEdit+'</a>';
                            if(full["attached_name"]!=null){
                            {/literal}{if $privFace.edit ==1 and $privFace.delete == 1}{literal}
                            boton += '<a href="javascript:snippet_list.delete(\''+data+'\',\''+category_id+'\');" class="btn btn-icon btn-light-danger btn-sm" title="'+lngUyuni.btnDelete+'"><i class="flaticon-delete-1"></i></a>';
                            {/literal}{/if}{literal}
                            }

                            boton += '<div>';

                            return boton;
                        },
                    },

                    /*
                    {
                        targets: [0],
                        searchable: false,
                    },
                    {
                        targets: [0],
                        render: function(data,type,full,meta){
                            return '<span class="text-primary">' + data+ '</span>';
                        },
                    },
                    {
                        targets: [2],
                        render: function(data,type,full,meta){
                            return '<span style="color: #7708bd;">' + new Intl.NumberFormat('en-US',{ minimumFractionDigits: 0 }).format(data) + ' </span>';
                        },
                    },
                    {
                        targets: [1],
                        render: function(data,type,full,meta){
                            return '<span style="color: #27780f;">' + new Intl.NumberFormat('en-US',{ minimumFractionDigits: 2 }).format(data) + ' </span>';
                        },
                    },
                    {
                        targets: [1,2,5],
                        className:"text-right",
                    },




                     */

                    {
                        targets: [-6],
                        render: function(data,type,full,meta){
                            var download = "";
                            if(data) {
                                download = '<a href="javascript:snippet_list.download(\''+full.actions+'\');"  ' +
                                    'class="btn btn-icon btn-circle btn-s btn-light-success">' +
                                    '<i class="fas fa-cloud-download-alt"></i></a> <span class="font-size-xs">' + data+'</span>';
                            }
                            return download;
                        },
                    },
                    {
                        targets: [-5],
                        render: function(data,type,full,meta){
                            //return '<span style="color: #7708bd;">' + new Intl.NumberFormat('en-US',{ minimumFractionDigits: 0 }).format(data) + ' </span>';

                            var size_file = "";
                            if(data) {
                                var size = parseInt(data);
                                size =  (size / (1024*1024)).toFixed(2);
                                size_file = '<span style="color: #517e03;" class="font-size-xs">' + size+' Mb.</span>';
                            }
                            return size_file;
                        },
                    },
                    {
                        targets: [-2,-3],
                        searchable: false,
                    },
                    {
                        targets: [-2,-3,-4],
                        className: "none"
                    },
                    {
                        targets: [-2,-3],
                        render: function(data,type,full,meta){
                            if (data == null){ data = "";}
                            return '<span class="text-primary font-size-xs">' + data+ '</span>';
                        },
                    },

                ],
            });

            switch (category_id) {
                case 1:
                    table_list_1 = table_list_temp;
                    break;
                case 2:
                    table_list_2 = table_list_temp;
                    break;
                case 3:
                    table_list_3 = table_list_temp;
                    break;
            }
        };



        /**
         * Download File
         */
        function download(id){
            var url = urlsys+"/"+id+"/download";
            window.open(url, '_blank');
        }

        /**
         * New and Update
         */
        var item_update = function(id,type){
            var subcontrol = "{/literal}{$subcontrol}{literal}";
            coreUyuni.itemUpdateTabs(id,type,urlsys,subcontrol);
        };
        /**
         * Delete
         */
        var  item_delete = function(id,category_id){
            var url = urlsys+"/"+id+"/delete";
            itemDelete(id,url,category_id);
        };
        var itemDeleteAction = function(id,url,category_id){
            Swal.fire({
                title: lngUyuni.deleteActionTitle,
                html: lngUyuni.deleteActionMsg+cargando_vista,
                showConfirmButton: false,
                allowEnterKey: false,
                allowOutsideClick: false,
                allowEscapeKey: false,
            });
            //var url = urlsys+"/"+id+"/borrar";
            $.get( url, {},
                function(res){
                    if(res.res == 1){
                        Swal.close();
                        Swal.fire({icon: 'success',title: lngUyuni.deleteActionSucess,showConfirmButton: false,timer: 1000});
                        //console.log(category_id+" <--ya volvio de borrar");
                        switch (category_id) {
                            case '1':
                                table_list_1.ajax.reload();
                                break;
                            case '2':
                                table_list_2.ajax.reload();
                                break;
                            case '3':
                                table_list_3.ajax.reload();
                                break;
                        }

                    }else{
                        var msg_error = res.msg;
                        if (res.msgdb !== undefined){
                            msg_error += '<div class="alert alert-danger font-size-xs" role="alert">';
                            msg_error += '<strong>'+lngUyuni.technicalData+': </strong>'+res.msgdb+'</div>';
                        }
                        Swal.fire({
                            icon: "error", title: lngUyuni.deleteErrorTitle,
                            html:msg_error, showClass: {popup: 'animate__animated animate__wobble'}
                        });

                    }
                },"json");
        };


        var itemDelete = function (id,url,category_id) {
            Swal.fire({
                title: lngUyuni.deleteTitle,
                html: lngUyuni.deleteMsg+"<br> <strong>ID : "+id+" </strong> ",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: "<i class='la la-trash'></i> "+lngUyuni.deleteBtnYes,
                cancelButtonText: "<i class='la la-thumbs-down'></i> "+lngUyuni.deleteBtnNo,
                customClass: {
                    confirmButton: "btn btn-danger",
                    cancelButton: "btn btn-default"
                }
            }).then(function(result) {
                if (result.value) {
                    itemDeleteAction(id,url,category_id);
                }
            });
        };


        return {
            //main function to initiate the module
            init: function() {
                //handle_button_update();
                initTable(1);
                initTable(2);
                {/literal}
                {if $item.instalador_tipo_id==2}initTable(3);{/if}
                {literal}
            },
            update: function(id,type){
                item_update(id,"update");
            },
            delete: function(id,category_id){
                item_delete(id,category_id);
            },
            download: function (id) {
                download(id);
            },
        };
    }();

    jQuery(document).ready(function() {
        snippet_list.init();
    });
</script>

{/literal}
