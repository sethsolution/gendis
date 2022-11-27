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
$field_item["mes"]=array("type"=>"text");
$field_item["anio"]=array("type"=>"text");
//field_item["telefono"]=array("type"=>"checkbox_02");
$field_item["antecedentes"]=array("type"=>"text");
$field_item["descripcion"]=array("type"=>"text");
$field_item["observaciones"]=array("type"=>"text");
$field_item["conclusiones"]=array("type"=>"text");

$fields["module"]= $field_item;
unset($field_item);
/**
 * Apartir de aca, puedes configurar otros campos
 */
