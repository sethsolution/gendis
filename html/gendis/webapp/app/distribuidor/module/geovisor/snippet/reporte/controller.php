<?PHP
use App\Distribuidor\Module\Geovisor\Snippet\Reporte\Index;
use App\Distribuidor\Module\Geovisor\Snippet\Reporte\Catalog;
use Core\Core;

$objItem = new Index();
$objCatalog = new Catalog();

$templateModule = $frontend["baseAjax"];

switch($action) {
    /**
     * Página por defecto (index)
     */
    default:
        $data = $objItem->getData($filter);
        //print_struc($data);exit;
        $smarty->assign("data",$data);
        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("general");

        $smarty->assign("subpage",$webm["sc_index"]);
        break;
}