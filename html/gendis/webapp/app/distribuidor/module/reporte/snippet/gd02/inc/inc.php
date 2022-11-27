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
    "B" => "nombre", //NOMBRE
    "C" => "direccion", //DIRECCION
    "D" => "municipio", //MUNICIPIO
    "E" => "mes", //MES
    "F" => "area", //AREA
    "G" => "cat_ant", //CAT_ANT
    "H" => "ener_gen", //ENER_GEN
    "I" => "ener_cons", //ENER_AUTOCONS
    "J" => "ener_autocons", //ENER_AUTOCNS
    "K" => "cost_por_disp_red", //COST_POR_DISP_RED
    "L" => "ener_iny", //ENER_INY
    "M" => "ener_nc_men", //ENER_NC_MEN
    "N" => "ener_nc_tot", //ENER_NC_TOT
    "O" => "ener_nc_exclu_men", //ENER_NC_EXCU_MEN
    "P" => "ener_nc_exclu_tot", //ENER_NC_EXCLU_TOT
    "Q" => "imp_ener_iny", //IMP_ENER_NY
    "R" => "imp_total", //IMPTOTAL
);