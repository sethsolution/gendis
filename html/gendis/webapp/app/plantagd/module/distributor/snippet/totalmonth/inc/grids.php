<?PHP
/**
 * Configuramos todas las grillas que utilizaremos en este snippet
 */
$grid = array();
$grid_table_join = array();

\Core\Core::setLenguage("tableIndex"); //cargamos idioma
/**
 * Configuración de tablas relacionales, (JOIN)
 */
/**
 * Configuración de los campos que mostraremos en la grilla
 */
$grid_item[]=array("field" => "anio","label"=> $smarty->config_vars["field_anio"]);
$grid_item[]=array("field" => "mes","label"=> $smarty->config_vars["field_mes"]);
$grid_item[]=array("field" => "gd_categoria_id","label"=> $smarty->config_vars["field_gd_categoria_id"]);
$grid_item[]=array("field" => "numero_gd","label"=> $smarty->config_vars["field_numero_gd"]);

$grid_item[]=array("field"=> "energia_generada","label"=> $smarty->config_vars["field_energia_generada"]);
$grid_item[]=array("field" => "energia_autoconsumida","label"=> $smarty->config_vars["field_energia_autoconsumida"]);

$grid_item[]=array("field" => "energia_inyectada","label"=> $smarty->config_vars["field_energia_inyectada"]);
$grid_item[]=array("field" => "energia_neta","label"=> $smarty->config_vars["field_energia_neta"]);
$grid_item[]=array("field" => "energia_nocompensada_mensual","label"=> $smarty->config_vars["field_energia_nocompensada_mensual"]);
$grid_item[]=array("field" => "energia_nocompensada_total","label"=> $smarty->config_vars["field_energia_nocompensada_total"]);
$grid_item[]=array("field" => "importe_inyectada","label"=> $smarty->config_vars["field_importe_inyectada"]);

$grid_item[]=array("field" => "importe_neta","label"=> $smarty->config_vars["field_importe_neta"]);
$grid_item[]=array("field" => "importe_total","label"=> $smarty->config_vars["field_importe_total"]);

$grid_item[]=array("field" => "created_at","label"=> $smarty->config_vars["gl_table_created_at"]);
$grid_item[]=array("field" => "updated_at","label"=> $smarty->config_vars["gl_table_updated_at"]);


$group = "index";
$grid[$group]= $grid_item;
$grid_table_join[$group]= $grid_table;
unset($grid_item);
unset($grid_table);
