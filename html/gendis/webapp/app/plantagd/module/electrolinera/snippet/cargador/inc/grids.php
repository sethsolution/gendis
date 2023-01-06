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
$grid_table[] = array(
    "table" => $appVars["table"]["gd_tipo_cargador"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "t" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"tipo_id" //Campo de relación en la tabla principal
);
$grid_table[] = array(
    "table" => $appVars["table"]["gd_estado_conector"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "e" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"estado_conector_id" //Campo de relación en la tabla principal
);

/**
 * Configuración de los campos que mostraremos en la grilla
 */
$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_tipo"]
, "table_as"=> "t", "as" => "tipo_id");

$grid_item[]=array("field" => "potencia","label"=> $smarty->config_vars["table_potencia"]);
$grid_item[]=array("field" => "cantidad_conector","label"=> $smarty->config_vars["table_cantidad_conector"]);

$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_estado_conector"]
, "table_as"=> "e", "as" => "estado_conector_id");

$grid_item[]=array("field" => "con_cable","label"=> $smarty->config_vars["table_con_cable"]);

$grid_item[]=array("field" => "created_at","label"=> $smarty->config_vars["gl_table_created_at"]);
$grid_item[]=array("field" => "updated_at","label"=> $smarty->config_vars["gl_table_updated_at"]);


$group = "index";
$grid[$group]= $grid_item;
$grid_table_join[$group]= $grid_table;
unset($grid_item);
unset($grid_table);
