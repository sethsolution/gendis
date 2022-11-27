<?PHP
use Core\Core;
/**
 * Configuración de referncias de las tablas de las base de datos que utilizaremos en este módulo
 *
 */
$appVars["table"]  = array();
/**
 * Tablas de información principal, configuración de los objetos principales
 */

$db_prefix = ""; //prefijo de la base de datos
$db_table = array();
$dbSchemaName = "public";
$db_table[] = Core::getTableConfig("gd");
$db_table[] = Core::getTableConfig("gd_reporte");
$db_table[] = Core::getTableConfig("instalador");
$db_table[] = Core::getTableConfig("distribuidor");
$db_table[] = Core::getTableConfig("distribuidor_reporte");
$db_table[] = Core::getTableConfig("distribuidor_reporte_archivo");
$db_table[] = Core::getTableConfig("distribuidor_reporte_gd01");
$db_table[] = Core::getTableConfig("distribuidor_reporte_gd02");
$appVars["table"]  = Core::getDbTablesFromArray($db_table,$dbSchemaName);
unset($db_table);
unset($db_prefix);


$db_table = array();
$dbSchemaName = "catalogo";
$db_table[] = Core::getTableConfig("distribuidor_reporte_estado");
$appVars["table"]  = Core::getDbTablesFromArray($db_table,$dbSchemaName,$appVars["table"]);
unset($db_table);

$db_table = array();
$dbSchemaName = "geo";
$db_table[] = Core::getTableConfig("departamento");
$db_table[] = Core::getTableConfig("municipio");
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
