<?PHP
/**
 * Configuramos todas los grupos de campos, para creación y verificación de formulaios
 */

/**
 * Arreglos que se utilizaran en esta configuración para guardar los grupos de campos
 */
$fields = array();

/***
 * Configuraciòn de los grupos de campos a utilizar
 */
$field_item = array();
//*******Identificacion del consumidor rgula solicitante
$field_item["username"]=array("type"=>"text");
$field_item["password"]=array("type"=>"text");
$field_item["name"]=array("type"=>"text");
$field_item["last_name"]=array("type"=>"text");
$field_item["mobile"]=array("type"=>"text");
$field_item["address"]=array("type"=>"text");


$fields["user"]= $field_item;
unset($field_item);
/**
 * Apartir de aca, puedes configurar otros campos
 */
