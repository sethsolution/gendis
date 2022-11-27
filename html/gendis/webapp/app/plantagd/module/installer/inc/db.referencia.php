<?PHP
use Core\Core;
/**
 * Configuración de referncias de las tablas de las base de datos que utilizaremos en este módulo
 *
 */
$appVars["table"] = array();
/**
 * Tablas de información principal, configuración de los objetos principales
 */

$db_prefix = ""; //prefijo de la base de datos
$db_table = array();
$dbSchemaName = "public";
$db_table[] = Core::getTableConfig("instalador");
$db_table[] = Core::getTableConfig("instalador_pago");
$db_table[] = Core::getTableConfig("instalador_archivo");
$appVars["table"]  = Core::getDbTablesFromArray($db_table,$dbSchemaName);
unset($db_table);
unset($db_prefix);


$db_table = array();
$dbSchemaName = "catalogo";
$db_table[] = Core::getTableConfig("instalador_tipo");
$db_table[] = Core::getTableConfig("instalador_tipoempresa");
$db_table[] = Core::getTableConfig("requisito");
$appVars["table"]  = Core::getDbTablesFromArray($db_table,$dbSchemaName,$appVars["table"]);
unset($db_table);

/**
 * Otras base de datos
 */

/* /
print_struc($appVars["table"]);
print_struc($CFG->table);
exit;
/**/
