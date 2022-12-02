<?PHP
use App\Plantagd\Password\Index\Index;
use App\Plantagd\Password\Index\Catalog;
use Core\Core;

$objItem = new Index();
$objCatalog = new Catalog();
/**
 * Todo el sub Control se recuperará mediante llamadas por ajax
 */
//$templateModule = $frontend["baseAjax"];

switch($action){
    default:
        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("index");
        /**
         * Get user login info
         */
//        $smarty->assign("userInfo", $_SESSION["userv"]);
//        print_r($_SESSION["userv"]);

        /**
         * Template for index and js
         */
        $smarty->assign("subpage", $webm["index"]);
        $smarty->assign("subpage_js", $webm["index_js"]);
        break;
    /**
     * Creación de JSON
     */
    case 'save':
        $respuesta = $objItem->updateData($_REQUEST["item"],"module");
        //print_r($respuesta);
        Core::printJson($respuesta);
        break;
}