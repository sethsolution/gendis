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
$field_item["numero_cuenta"]=array("type"=>"text");
$field_item["gd_categoria_id"]=array("type"=>"text");
//field_item["telefono"]=array("type"=>"checkbox_02");
$field_item["nombre_consumidor"]=array("type"=>"text");
$field_item["ci"]=array("type"=>"text");
$field_item["direccion"]=array("type"=>"text");
$field_item["barrio_zona"]=array("type"=>"text");
$field_item["ciudad"]=array("type"=>"text");
$field_item["email"]=array("type"=>"text");
$field_item["telefono"]=array("type"=>"text");
$field_item["celular"]=array("type"=>"text");
$field_item["persona_juridica"]=array("type"=>"text");
$field_item["nit"]=array("type"=>"text");
$field_item["distribuidor_id"]=array("type"=>"text");

//****************datos tecnicos de la instalacion
$field_item["potencia_instalada"]=array("type"=>"text");
$field_item["tension"]=array("type"=>"text");
$field_item["gd_tipo_conexion_id"]=array("type"=>"text");
$field_item["potencia_centro_transformacion"]=array("type"=>"text");
$field_item["gd_tipo_transformacion_id"]=array("type"=>"text");
$field_item["transformador_tipo_conexion"]=array("type"=>"text");
$field_item["transformador_impedancia"]=array("type"=>"text");

//************datos tecnicos de generacion
$field_item["potencia"]=array("type"=>"text");
$field_item["gd_tipo_fuente_generacion_id"]=array("type"=>"text");
$field_item["fuente_generacion_otro"]=array("type"=>"text");

//**********referencia de contacto
$field_item["responsable_nombre"]=array("type"=>"text");
$field_item["responsable_telefono"]=array("type"=>"text");
$field_item["responsable_email"]=array("type"=>"text");
$field_item["lugar"]=array("type"=>"text");
$field_item["fecha"]=array("type"=>"date_01");

//**********Location
$field_item["location_latitude_decimal"]=array("type"=>"text");
$field_item["location_longitude_decimal"]=array("type"=>"text");
$field_item["location_altitude"]=array("type"=>"text");


$fields["module"]= $field_item;
unset($field_item);
/**
 * Apartir de aca, puedes configurar otros campos
 */
