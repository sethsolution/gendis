<?PHP
use App\Web\Module\Singin\Snippet\Index\Index;
use App\Web\Module\Singin\Snippet\Index\Catalog;
use Core\Core;


$objItem = new Index();
$objCatalog = new Catalog();

switch($action) {
    default:
        /**
         * Smarty Options
         */
        //$smarty->caching = true;
        //$smarty->debugging = true;
        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("index");
        /**
         * catalog configuration
         */

        $objCatalog->confCatalog();
        $cataobj= $objCatalog->getCatalogList();
        $cataobj["activo"] = $catalogo=$objCatalog->getActiveOption();
        //print_struc($cataobj);exit;
        $smarty->assign("cataobj", $cataobj);
        /**
         * Grid configuration
         */
        $gridItem = $objItem->getGridItem("item");
        $smarty->assign("gridItem", $gridItem);


        /**
         * Template for index and js
         */
        $smarty->assign("subpage", $webm["index"]);
        $smarty->assign("subpage_js", $webm["index_js"]);
        break;
    /**
     * Registrar
     */
    case 'save':
        $smarty->assign("subpage", $webm["email"]);
        $respuesta = $objItem->updateData($_REQUEST["item"]);
        Core::printJson($respuesta);
        break;
    
    case 'verifica':
            
            $smarty->assign("subpage", $webm["email_valida"]);
            
            $res = $objItem->valida_email($_REQUEST["c"],$_REQUEST["e"]);
            $smarty->assign("verifica", $res["resp"]);
            $smarty->assign("subpage", $webm["verifica"]);
            $smarty->assign("subpage_js", $webm["verifica_js"]);
            
    break;
}