<?PHP
/**
 * Configuración del módulo especifico
 */
/*
// Ejemplo
$variable_ejemplo = $path_sbm."snippet/".$subcontrol."/inc/archivo_ejemplo.php";
if(is_file($variable_ejemplo)) include_once($variable_ejemplo);
*/

/**
 * Configuración de Campos del excel
 */
$campos = array(
    "A" => "cliente", //CLIENTE
    "B" => "direccion", //DIRECCION
    "C" => "telefono", //TELEFONO
    "D" => "cod_localidad", //COD_LOCALIDAD
    "E" => "cod_zona", //COD_ZONA
    "F" => "tipo_medicion", //TIPO_MEDICION
    "G" => "medidor_1", //MEDIDOR_1
    "H" => "medidor_2", //MEDIDOR_2
    "I" => "nombre", //NOMBRE
    "J" => "nro_documento", //NRO_DOCUMENTO
    "K" => "categoria", //CATEGORIA
    "L" => "clasificacion_gd", //CLASIFICACION_GD
    "M" => "nivel_calidad", //NIVEL_CALIDAD
    "N" => "tipo_sum", //TIPO_SUM
    "O" => "punto_medicion", //PUNTO_MEDICION
    "P" => "tipo_suministro", //TIPO_SUMINISTRO
    "Q" => "tipo_generacion", //TIPO_GENERACION
    "R" => "coordenadas", //COORDENADAS
    "S" => "pot_gen_dis", //POT_GEN_DIS
    "T" => "pot_max_gen", //POT_MAX_GEN
    "U" => "fun_prim", //FUN_PRIM
    "V" => "num_agen", //NUM_AGEN
    "W" => "num_mod", //NUM_MOD
    "X" => "num_inv", //NUM_INV
    "Y" => "pot_inv", //POT_INV
    "Z" => "mar_inv", //MAR_INV
    "AA" => "sup_ocu", //SUP_OCU
    "AB" => "fecha_psr", //FECHA_PSR
    "AC" => "fac_planta", //FAC_PLANTA
);
