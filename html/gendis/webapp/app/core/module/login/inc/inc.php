<?PHP
/**
 * User: henrytaby
 * Date: 3/5/2018
 * Time: 10:47
 */
//$modulo_core->privface_extender();
/**
 * Incluimos otros archivos adicionales si fuera necesario
 */
/*
$inc_otro_archivo = $path_sbm_inc."otro_archivo.php";
include_once($inc_otro_archivo);
*/


/**
 * Configuramos el directorio para este modulo
 */
/**
 * En caso de colocar todo en una sola carpeta del modulo
 */
//$appVars["directory"] = $CFG->data.$module."/";
/**
 * Verificamos y/o Creamos la carpeta padre
 */
/*
$appVars["folderParent"] = "rrhh";
$appVars["directory"] = $_ENV['DATA_FILE'].$appVars["folderParent"]."/";
Core::createDirectory($appVars["directory"]);
*/
/**
 *  Verificamos y/o Creamos la carpeta del módulo
 */
/*
$appVars["folderModule"] = "items";
$appVars["directory"] = $appVars["directory"].$appVars["folderModule"]."/";
Core::createDirectory($appVars["directory"]);
*/
//$dbm->debug = true;
