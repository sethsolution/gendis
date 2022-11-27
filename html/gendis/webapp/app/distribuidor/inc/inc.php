<?PHP
/**
 * Include
 * special application programming
 * Example include: include_once($appPath . "classes/ModuloCore.php");
 * $modulo_core = new ModuloCore();
 */

$action_path = APP_PATH."inc/action.path.php";
include_once($action_path);

/**
 * Permisos
 */
//print_struc($_SESSION);
if($_SESSION["userv"]["type"]==3){
    /**
     * Si el usuario es de tipo distribuidor, le daremos los permisos a todos los módulos de la aplicación para distribuidores
     */
    $action_path = APP_PATH."inc/DistribuidorPermisos.php";
    include_once($action_path);
    $distribuidorPermisos = new DistribuidorPermisos;
    $distribuidorPermisos->setPermisos();
}