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
    "table" => $appVars["table"]["instalador_tipo"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "t" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"instalador_tipo_id" //Campo de relación en la tabla principal
);
$grid_table[] = array(
    "table" => $appVars["table"]["instalador_tipoempresa"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "j" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"instalador_tipoempresa_id" //Campo de relación en la tabla principal
);

/**
 * Configuración de los campos que mostraremos en la grilla
 */

$grid_item[]=array("field"=> "nombre", "label"=> $smarty->config_vars["table_name"]);
$grid_item[]=array("field" => "nit","label"=> $smarty->config_vars["table_nit"]);
$grid_item[]=array("field" => "direccion","label"=> $smarty->config_vars["table_address"]);
$grid_item[]=array("field" => "telefono","label"=> $smarty->config_vars["table_phone"]);
$grid_item[]=array("field" => "instalador_tipo_id","label"=> $smarty->config_vars["table_tiponombre"]);

//$grid_item[]=array("field" => "nombre", "label"=> $smarty->config_vars["table_tiponombre"]
//,"table_as"=> "t","as" => "tiponombre");

$grid_item[]=array("field" => "nombre", "label"=> $smarty->config_vars["table_tipoempresanombre"]
,"table_as"=> "j","as" => "tipoempresanombre");

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
/*/
print_struc($grid_table_join);
print_struc($grid);
exit;
/**/