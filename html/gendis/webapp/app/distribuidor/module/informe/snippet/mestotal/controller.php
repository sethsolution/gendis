<?PHP
use App\Distribuidor\Module\Informe\Snippet\Mestotal\Index;
use App\Distribuidor\Module\Informe\Snippet\Mestotal\Catalog;
use Core\Core;

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
        \Core\Core::setLenguage("index");

        /*
        $cataobj["activo"] = $objCatalog->get_activo_option();
        $smarty->assign("cataobj", $cataobj);
        */
        /**
         * Grid configuration
         */
        $gridItem = $objItem->getGridItem("index");
        $smarty->assign("gridItem", $gridItem);
        $smarty->assign("subpage",$webm["sc_index"]);
        break;
    /**
     * Creación de JSON
     */
    case 'list':
        //$datatable_debug= true;
        $res = $objItem->getItemDatatableRows();
        Core::printJson($res);
        break;
    case 'get.form':
        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("formItem");

        $smarty->assign("item_id",$item_id);



        if($type=="update"){
            $item = $objItem->getItem($id2);
        }else{
            //$item = "";
            $item["class"] = "fab fa-buffer";
            $item["order"] = "1";
            $item["active"] = "1";
        }
        $smarty->assign("item",$item);

        $objCatalog->conf_catalog_form($item,$item_id);
        $cataobj = $objCatalog->getCatalogList();
        $cataobj["mes"] = $objCatalog->getMonthList();
        $smarty->assign("cataobj" , $cataobj);
        //print_struc($cataobj);
        //print_struc($cataobj);

        $smarty->assign("type",$type);
        $smarty->assign("id",$id2);
        $smarty->assign("subpage",$webm["sc_form"]);
        break;

    case 'save':

        $respuesta = $objItem->updateData($_REQUEST["item"],$id2,"index",$type);
        Core::printJson($respuesta);
        break;

    case 'delete':
        $res = $objItem->deleteData($id2);
        Core::printJson($res);
        break;

}
