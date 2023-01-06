<?PHP
/**
 * Configuramos todas los grupos de campos, para creación y verificación de formulaios
 */
$fields = array();
/***
 * Configuraciòn de los grupos de campos a utilizar
 */
$field_item = array();
$field_item["tipo_id"]=array("type"=>"text");
$field_item["potencia"]=array("type"=>"text");
$field_item["cantidad_conector"]=array("type"=>"text");
$field_item["estado_conector_id"]=array("type"=>"text");
$field_item["con_cable"]=array("type"=>"checkbox_02");

$group = "index";
$fields[$group]= $field_item;
unset($field_item);

/**
 * Apartir de aca, puedes configurar otros campos
 */
