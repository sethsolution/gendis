<?PHP
use App\Distribuidor\Module\Reporte\Snippet\General\Index;
use App\Distribuidor\Module\Reporte\Snippet\General\Catalog;
use Core\Core;
use App\Distribuidor\Module\Reporte\Snippet\Index\Index as indexPrincipal;
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
            $item = $objItemIndex->getItem($id);
            if ($item["estado_id"]!=1 and $item["estado_id"]!=3){
                $privFace["edit"] =$privFace["delete"]=$privFace["add"] =0;
                $privFace["checkbox"] = " disabled='true' ";
                $privFace["input"] = " disabled='true' ";

            }
            $smarty->assign("privFace",$privFace);
        }
        $smarty->assign("item",$item);
        /**
         * Catalog
         */
        $objCatalog->getMonthList();
        $cataobj["mes"] = $catalogo=$objCatalog->getMonthList();
        $smarty->assign("cataobj", $cataobj);
        $smarty->assign("subpage",$webm["sc_index"]);
        break;

    case 'save':
        $respuesta = $objItem->updateData($_REQUEST["item"],$id,$type);
        Core::printJson($respuesta);
        break;


}