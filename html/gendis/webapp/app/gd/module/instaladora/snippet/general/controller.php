<?PHP
use App\Gd\Module\Instaladora\Snippet\General\Index;
use App\Gd\Module\Instaladora\Snippet\General\Catalog;
use Core\Core;

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
        //print_struc($privFace);
        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("general");

        $smarty->assign("type",$type);
        if($type=="update"){
            $item = $objItem->getItem($id);
            $smarty->assign("item",$item);
        }

        /**
         * Catalog
         */
        $objCatalog->confCatalog();
        $cataobj= $objCatalog->getCatalogList();
       // print_struc($cataobj);exit;
        $smarty->assign("cataobj", $cataobj);

        $smarty->assign("subpage",$webm["sc_index"]);
        break;
}