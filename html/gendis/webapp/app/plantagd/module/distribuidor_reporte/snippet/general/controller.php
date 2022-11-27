<?PHP
use App\Plantagd\Module\Distribuidorreporte\Snippet\General\Index;
use App\Plantagd\Module\Distribuidorreporte\Snippet\General\Catalog;
use Core\Core;
use App\Plantagd\Module\Distribuidorreporte\Snippet\Index\Index as indexPrincipal;
$objItemIndex = new indexPrincipal();

$objItem = new Index();
$objCatalog = new Catalog();

$templateModule = $frontend["baseAjax"];

switch($action) {
    /**
     * Página por defecto (index)
     */
    default:
        $privFace["edit"] =$privFace["delete"]=$privFace["add"] =0;
        $privFace["checkbox"] = " disabled='true' ";
        $privFace["input"] = " disabled='true' ";

        $smarty->assign("privFace",$privFace);
        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("general");
        $smarty->assign("type",$type);
        if($type=="update"){
            $item = $objItemIndex->getItem($id);
            $smarty->assign("item",$item);
        }

        /**
         * Catalog
         */
        $objCatalog->getMonthList();
        $cataobj["mes"] = $catalogo=$objCatalog->getMonthList();
        //print_struc($cataobj);exit;
        $smarty->assign("cataobj", $cataobj);

        $smarty->assign("subpage",$webm["sc_index"]);
        break;


}