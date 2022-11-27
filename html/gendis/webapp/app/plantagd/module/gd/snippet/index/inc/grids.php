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
    "table" => $appVars["table"]["gd_categoria"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "g" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"gd_categoria_id" //Campo de relación en la tabla principal
);
/**
 * Configuración de los campos que mostraremos en la grilla
 */

$grid_item[]=array("field"=> "numero_cuenta", "label"=> $smarty->config_vars["table_nro"]);
$grid_item[]=array("field" => "nombre_consumidor","label"=> $smarty->config_vars["table_name"]);
$grid_item[]=array("field" => "celular","label"=> $smarty->config_vars["table_phone"]);
//$grid_item[]=array("field"=> "gd_categoria_id","label"=> $smarty->config_vars["table_catagory"]);

$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_catagory"]
, "table_as"=> "g", "as" => "gd_categoria");

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