<?PHP
/**
 * Configuramos todas las grillas que utilizaremos en este snippet
 */
$grid = array();
$grid_table_join = array();

\Core\Core::setLenguage("tableIndex"); //cargamos idioma

$grid_item[]=array("field"=> "ciae", "label"=> $smarty->config_vars["table_ciae"]);
$grid_item[]=array("field" => "nombre","label"=> $smarty->config_vars["table_name_company"]);
$grid_item[]=array("field"=> "sigla","label"=> $smarty->config_vars["table_sigla"]);
$grid_item[]=array("field"=> "licencia","label"=> $smarty->config_vars["table_license"]);
$grid_item[]=array("field"=> "actividad","label"=> $smarty->config_vars["table_activity"]);
$grid_item[]=array("field"=> "estado", "label"=> $smarty->config_vars["table_status"]);

$grid_item[]=array("field"=> "sistema", "label"=> $smarty->config_vars["table_sistema"]);
$grid_item[]=array("field"=> "descripcion", "label"=> $smarty->config_vars["table_descripcion"]);


$grid_item[]=array("field" => "created_at","label"=> $smarty->config_vars["gl_table_created_at"]);
$grid_item[]=array("field" => "updated_at","label"=> $smarty->config_vars["gl_table_updated_at"]);

$group = "item";
$grid[$group]= $grid_item;
$grid_table_join[$group]= $grid_table;
unset($grid_item);
unset($grid_table);
/**
 * A partir de aca puede añadir todas las grillas que sean necesarias para esta vista
 */
