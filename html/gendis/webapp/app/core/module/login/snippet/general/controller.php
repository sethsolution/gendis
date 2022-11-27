<?PHP
use App\Gd\Module\Instaladora\Snippet\Index\Index;
use App\Gd\Module\Instaladora\Snippet\Index\Catalog;
use Core\Core;

$objItem = new Index();
$objCatalog = new Catalog();

$templateModule = $frontend["baseAjax"];

switch($action) {

    /**
     * Página por defecto (index)
     */
    default:

        $smarty->assign("type",$type);
        if($type=="update"){
            $item = $objItem->getItem($id,"c_ip_publica");
            $smarty->assign("item",$item);
        }


        //print_struc($appVars["table"] );
        $objCatalog->conf_catalog_datos_general();
        $cataobj = $objCatalog->getCatalogList();
        //print_struc($cataobj);exit;
        $smarty->assign("cataobj",$cataobj);
        //print_struc($cataobj);exit;
        $smarty->assign("subpage",$webm["sc_index"]);
        break;

    case 'itemupdatesql':
        //print_struc($item);exit;
        $respuesta = $objItem->updateData($_REQUEST["item"],$itemId,"c_ip_publica",$type);
        Core::printJson($respuesta);
        break;

}
