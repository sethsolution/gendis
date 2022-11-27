{literal}
<script>
    var bgcolorHtml = [
        '#de1f0a',
        '#940fc9',
        '#0098fe',
        '#7dc400',
        '#ffcc00',
        '#dc7633',
        '#ff51f5',
        '#00d8ad',
        '#00eaff',
        '#48c9b0',
        '#f5b041',
        '#58d68d',
        '#eb984e',
        '#52be80',

        '#cd6155',
        '#a569bd',
        '#5499c7',
        '#45b39d',
        '#f4d03f',
        '#dc7633',
        '#af7ac5',
        '#ec7063',
        '#5dade2',
        '#48c9b0',
        '#f5b041',
        '#58d68d',
        '#eb984e',
        '#52be80'
    ];

    var bgcolorRgb = [
        'rgba(222, 31, 10, 1)',
        'rgba(148, 15, 201, 1)',
        'rgba(84, 153, 199, 1)',
        'rgba(69, 179, 157, 1)',
        'rgba(244, 208, 63, 1)',
        'rgba(220, 118, 51, 1)',
        'rgba(175, 122, 197, 1)',
        'rgba(236, 112, 99, 1)',
        'rgba(93, 173, 226, 1)',
        'rgba(72, 201, 176, 1)',
        'rgba(245, 146, 65, 1)',
        'rgba(88, 214, 141, 1)',
        'rgba(235, 152, 78, 1)',
        'rgba(82, 190, 128, 1)',

        'rgba(205, 97, 85, 1)',
        'rgba(165, 105, 189, 1)',
        'rgba(84, 153, 199, 1)',
        'rgba(69, 179, 157, 1)',
        'rgba(244, 208, 63, 1)',
        'rgba(220, 118, 51, 1)',
        'rgba(175, 122, 197, 1)',
        'rgba(236, 112, 99, 1)',
        'rgba(93, 173, 226, 1)',
        'rgba(72, 201, 176, 1)',
        'rgba(245, 146, 65, 1)',
        'rgba(88, 214, 141, 1)',
        'rgba(235, 152, 78, 1)',
        'rgba(82, 190, 128, 1)'
    ];


    var ctx = document.getElementById("chart_cantidad").getContext('2d');
    var chart_cantidad = new Chart(ctx, {
        type: 'horizontalBar',
        data: {
            labels: [
                {/literal}
                {foreach from=$data item=row key=idx}
                {if $idx != 0},{/if}"{$row.distribuidor}"
                {/foreach}{literal}
            ],
            datasets: [{
                label: 'Potencia Instalada',
                data: [
                    {/literal}
                    {foreach from=$data item=row key=idx}
                    {if $idx != 0},{/if}{$row.potencia_instalada_total}
                    {/foreach}{literal}
                ],
                backgroundColor: '#7da600',
                borderWidth: 1
            }]
        },
        options: {
            legend: {
                display: true,
                position: 'top',
                labels: {
                    boxWidth: 20,
                    fontSize: 12,
                    padding: 7
                }
            }
        }
    });



    var ctx_monto_dos = document.getElementById("chart_monto_dos").getContext('2d');
    var chart_monto_dos = new Chart(ctx_monto_dos, {
        type: 'horizontalBar',
        data: {
            labels: [
                {/literal}
                {foreach from=$data item=row key=idx}
                {if $idx != 0},{/if}"{$row.distribuidor}"
                {/foreach}{literal}
            ],
            datasets: [
                {/literal}{if $filter.cate.nanogeneracion==1}{literal}
                {
                    label: 'Nanogeneración',
                    data: [
                        {/literal}
                        {foreach from=$data item=row key=idx}
                        {if $idx != 0},{/if}{$row.potencia_instalada_nanogeneracion}
                        {/foreach}{literal}
                    ],
                    backgroundColor: 'rgba(255, 132, 0, 0.9)',
                    borderWidth: 1
                },
                {/literal}{/if}{literal}
                {/literal}{if $filter.cate.microgeneracion==1}{literal}
                {
                    label: 'Microgeneración',
                    data: [
                        {/literal}
                        {foreach from=$data item=row key=idx}
                        {if $idx != 0},{/if}{$row.potencia_instalada_microgeneracion}
                        {/foreach}{literal}
                    ],
                    backgroundColor: 'rgba(0, 84, 255, 0.9)',
                    borderWidth: 1
                },
                {/literal}{/if}{literal}
                {/literal}{if $filter.cate.minigeneracion==1}{literal}
                {
                    label: 'Minigeneracion',
                    data: [
                        {/literal}
                        {foreach from=$data item=row key=idx}
                        {if $idx != 0},{/if}{$row.potencia_instalada_minigeneracion}
                        {/foreach}{literal}
                    ],
                    backgroundColor: 'rgba(145, 220, 0, 0.9)',
                    borderWidth: 1
                }
                {/literal}{/if}{literal}
            ]
        },
        options: {
            legend: {
                display: true,
                position: 'top',
                labels: {
                    boxWidth: 20,
                    fontSize: 12,
                    padding: 7
                }
            }
        }
    });


    var ctx_monto_dos = document.getElementById("chart_gd_tipo_fuente_generacion").getContext('2d');
    var chart_monto_dos = new Chart(ctx_monto_dos, {
        type: 'horizontalBar',
        data: {
            labels: [
                {/literal}
                {foreach from=$data item=row key=idx}
                {if $idx != 0},{/if}"{$row.distribuidor}"
                {/foreach}{literal}
            ],
            datasets: [
                {/literal}{if $filter.cate.nanogeneracion==1}{literal}
                {
                    label: 'Nanogeneración',
                    data: [
                        {/literal}
                        {foreach from=$data item=row key=idx}
                        {if $idx != 0},{/if}{$row.total_nanogeneracion}
                        {/foreach}{literal}
                    ],
                    backgroundColor: 'rgba(255, 132, 0, 0.9)',
                    borderWidth: 1
                },
                {/literal}{/if}{literal}
                {/literal}{if $filter.cate.microgeneracion==1}{literal}
                {
                    label: 'Microgeneración',
                    data: [
                        {/literal}
                        {foreach from=$data item=row key=idx}
                        {if $idx != 0},{/if}{$row.total_microgeneracion}
                        {/foreach}{literal}
                    ],
                    backgroundColor: 'rgba(0, 84, 255, 0.9)',
                    borderWidth: 1
                },
                {/literal}{/if}{literal}
                {/literal}{if $filter.cate.minigeneracion==1}{literal}
                {
                    label: 'Minigeneracion',
                    data: [
                        {/literal}
                        {foreach from=$data item=row key=idx}
                        {if $idx != 0},{/if}{$row.total_minigeneracion}
                        {/foreach}{literal}
                    ],
                    backgroundColor: 'rgba(145, 220, 0, 0.9)',
                    borderWidth: 1
                }
                {/literal}{/if}{literal}
            ]
        },
        options: {
            legend: {
                display: true,
                position: 'top',
                labels: {
                    boxWidth: 20,
                    fontSize: 12,
                    padding: 7
                }
            }
        }
    });

</script>

{/literal}