<?PHP
use App\Distribuidor\Module\Reporte\Snippet\Gd01\Index;
use App\Distribuidor\Module\Reporte\Snippet\Gd01\Catalog;
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
                $privFace["input"] = " disabled='true' ";
            }
            $smarty->assign("privFace",$privFace);

            if($item["gd01_archivo_id"]!=""){
                $item_file = $objItem->getItem($item["gd01_archivo_id"],$id);
                $smarty->assign("item_file",$item_file);
                //$fileData = $objItem->getFileData($item_file,$item_id);
            }
        }
        $smarty->assign("item",$item);
        /**
         * Catalog
         */
        $objCatalog->getMonthList();
        $cataobj["mes"] = $catalogo=$objCatalog->getMonthList();
        //print_struc($cataobj);exit;
        $smarty->assign("cataobj", $cataobj);

        $smarty->assign("subpage",$webm["sc_index"]);
        break;

    case 'save':
        $respuesta = $objItem->updateData($_REQUEST["item"],$id,$type,$_FILES["input_file"]);
        Core::printJson($respuesta);
        break;
    case 'download':
        $objItem->getFile($id2,$item_id);
        break;

}