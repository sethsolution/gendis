<?PHP
/**
 * Configuramos todas los grupos de campos, para creación y verificación de formulaios
 */
$fields = array();
/***
 * Configuraciòn de los grupos de campos a utilizar
 */
$field_item = array();
$field_item["mes"]=array("type"=>"text");
$field_item["anio"]=array("type"=>"text");
$field_item["gd_categoria_id"]=array("type"=>"text");
$field_item["numero_gd"]=array("type"=>"text");

$field_item["energia_generada"]=array("type"=>"text");
$field_item["energia_autoconsumida"]=array("type"=>"text");
$field_item["energia_inyectada"]=array("type"=>"text");

$field_item["energia_neta"]=array("type"=>"text");
$field_item["energia_nocompensada_mensual"]=array("type"=>"text");
$field_item["energia_nocompensada_total"]=array("type"=>"text");

$field_item["importe_inyectada"]=array("type"=>"text");
$field_item["importe_neta"]=array("type"=>"text");
$field_item["importe_total"]=array("type"=>"text");

$group = "index";
$fields[$group]= $field_item;
unset($field_item);

/**
 * Apartir de aca, puedes configurar otros campos
 */
