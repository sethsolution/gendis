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
//$field_item["gd_categoria_id"]=array("type"=>"text");
//$field_item["numero_gd"]=array("type"=>"text");

$field_item["energia_generada"]=array("type"=>"text"); //08
$field_item["energia_consumida"]=array("type"=>"text"); //09
$field_item["energia_autoconsumida"]=array("type"=>"text"); //10
$field_item["importe_disponibilidad_red"]=array("type"=>"text"); //11
$field_item["energia_inyectada"]=array("type"=>"text"); //12
$field_item["energia_neta"]=array("type"=>"text"); //13
$field_item["energia_nocompensada_mes"]=array("type"=>"text"); //14
$field_item["energia_nocompensada_total"]=array("type"=>"text"); //15
$field_item["energia_nocompensada_excluida_mes"]=array("type"=>"text"); //16
$field_item["energia_nocompensada_excluida_total"]=array("type"=>"text"); //17
$field_item["importe_energia_inyectada"]=array("type"=>"text"); //18
$field_item["importe_total_facturado"]=array("type"=>"text"); //19
/*
$field_item["energia_excluida_mes"]=array("type"=>"text");
$field_item["energia_excluida_total"]=array("type"=>"text");
$field_item["importe_neta"]=array("type"=>"text");
$field_item["energia_excluida_mes"]=array("type"=>"text");
*/

$group = "index";
$fields[$group]= $field_item;
unset($field_item);

/**
 * Apartir de aca, puedes configurar otros campos
 */
