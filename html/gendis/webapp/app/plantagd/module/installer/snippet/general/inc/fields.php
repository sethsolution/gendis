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

$field_item["nombre"]=array("type"=>"text");
$field_item["direccion"]=array("type"=>"text");

//field_item["telefono"]=array("type"=>"checkbox_02");

$field_item["instalador_tipo_id"]=array("type"=>"text");
$field_item["instalador_tipoempresa_id"]=array("type"=>"text");
$field_item["telefono"]=array("type"=>"text");
$field_item["fax"]=array("type"=>"text");
$field_item["email"]=array("type"=>"text");
$field_item["nit"]=array("type"=>"text");
$field_item["fundempresa"]=array("type"=>"text");
$field_item["fecha_expedicion"]=array("type"=>"date_01");
$field_item["testimonio_numero"]=array("type"=>"text");
$field_item["testimonio_fecha"]=array("type"=>"date_01");
$field_item["representante_legal"]=array("type"=>"text");
$field_item["representante_legal_ci"]=array("type"=>"text");
$field_item["testimonio_poder_numero"]=array("type"=>"text");
$field_item["testimonio_poder_fecha"]=array("type"=>"date_01");
$field_item["fecha_presentacion"]=array("type"=>"date_01");
$field_item["active"]=array("type"=>"checkbox_02");

$fields["module"]= $field_item;
unset($field_item);
/**
 * Apartir de aca, puedes configurar otros campos
 */
