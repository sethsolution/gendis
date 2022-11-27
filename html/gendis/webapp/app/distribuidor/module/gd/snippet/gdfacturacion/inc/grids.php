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

$grid_item[]=array("field" => "anio","label"=> $smarty->config_vars["table_anio"]);
$grid_item[]=array("field" => "mes","label"=> $smarty->config_vars["table_mes"]);
$grid_item[]=array("field" => "energia_generada","label"=> $smarty->config_vars["table_energia_generada"]);//08
$grid_item[]=array("field" => "energia_consumida","label"=> $smarty->config_vars["table_energia_consumida"]);//09
$grid_item[]=array("field" => "energia_autoconsumida","label"=> $smarty->config_vars["table_energia_autoconsumida"]);//10

$grid_item[]=array("field" => "importe_disponibilidad_red","label"=> $smarty->config_vars["table_importe_disponibilidad_red"]);//11
$grid_item[]=array("field" => "energia_inyectada","label"=> $smarty->config_vars["table_energia_inyectada"]);//12
$grid_item[]=array("field" => "energia_neta","label"=> $smarty->config_vars["table_energia_neta"]);//13
$grid_item[]=array("field" => "energia_nocompensada_mes","label"=> $smarty->config_vars["table_energia_nocompensada_mes"]);//14
$grid_item[]=array("field" => "energia_nocompensada_total","label"=> $smarty->config_vars["table_energia_nocompensada_total"]);//15
$grid_item[]=array("field" => "energia_nocompensada_excluida_mes","label"=> $smarty->config_vars["table_energia_nocompensada_excluida_mes"]);//16
$grid_item[]=array("field" => "energia_nocompensada_excluida_total","label"=> $smarty->config_vars["table_energia_nocompensada_excluida_total"]);//17

$grid_item[]=array("field" => "importe_energia_inyectada","label"=> $smarty->config_vars["table_importe_energia_inyectada"]);  //18
$grid_item[]=array("field" => "importe_total_facturado","label"=> $smarty->config_vars["table_importe_total_facturado"]); //19

$grid_item[]=array("field" => "created_at","label"=> $smarty->config_vars["gl_table_created_at"]);
$grid_item[]=array("field" => "updated_at","label"=> $smarty->config_vars["gl_table_updated_at"]);


$group = "index";
$grid[$group]= $grid_item;
$grid_table_join[$group]= $grid_table;
unset($grid_item);
unset($grid_table);
