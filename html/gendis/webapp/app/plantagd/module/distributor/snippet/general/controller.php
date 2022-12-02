<?PHP
use App\Plantagd\Distributor\General\Index;
use App\Plantagd\Distributor\General\Catalog;
use Core\Core;
use App\Plantagd\Distributor\Index\Index as indexPrincipal;
$objItemIndex = new indexPrincipal();

$objItem = new Index();
$objCatalog = new Catalog();

$templateModule = $frontend["baseAjax"];

switch($action) {
    /**
     * Página por defecto (index)
     */
    default:
        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("general");

        $smarty->assign("type",$type);
        if($type=="update"){
            $item = $objItemIndex->getItem($id,"app");
        }else{
            $item["class"] = "fa fa-cogs";
        }
        $smarty->assign("item",$item);
        /**
         * Catalog
         */
        //$cataobj["group"] = $objCatalog->getGroupOptions();
        //$cataobj["tipo"] = $objCatalog->getTypeOption();
        $smarty->assign("cataobj" , $cataobj);

        $smarty->assign("subpage",$webm["sc_index"]);
        break;

    case 'save':
        $respuesta = $objItem->updateData($_REQUEST["item"],$id,$type);
        Core::printJson($respuesta);
        break;

}