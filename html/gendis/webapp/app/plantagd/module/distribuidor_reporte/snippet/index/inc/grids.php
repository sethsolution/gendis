<?PHP
/**
 * Configuramos todas las grillas que utilizaremos en este snippet
 */
$grid = array();
$grid_table_join = array();

\Core\Core::setLenguage("tableIndex"); //cargamos idioma

/**
 * Configuración de los campos que mostraremos en la grilla
 */

$grid_table[] = array(
    "table" => $appVars["table"]["distribuidor"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "d" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"distribuidor_id" //Campo de relación en la tabla principal
);

$grid_table[] = array(
    "table" => $appVars["table"]["distribuidor_reporte_estado"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "t" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"estado_id" //Campo de relación en la tabla principal
);

$grid_item[]=array("field" => "anio","label"=> $smarty->config_vars["table_anio"]);
$grid_item[]=array("field" => "mes","label"=> $smarty->config_vars["table_mes"]);

$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_distribuidor"]
, "table_as"=> "d", "as" => "distribuidor");
//$grid_item[]=array("field" => "observaciones","label"=> $smarty->config_vars["table_obs"]);
$grid_item[]=array("field" => "gd01","label"=> $smarty->config_vars["table_gd01"]);
$grid_item[]=array("field" => "gd02","label"=> $smarty->config_vars["table_gd02"]);
$grid_item[]=array("field" => "fecha_envio","label"=> $smarty->config_vars["table_fecha_envio"]);
$grid_item[]=array("field" => "fecha_aprobacion","label"=> $smarty->config_vars["table_fecha_apro"]);

$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_estado"]
, "table_as"=> "t", "as" => "distribuidor_reporte_estado");

$grid_item[]=array("field" => "fecha_observacion","label"=> $smarty->config_vars["table_fecha_obs"]);


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