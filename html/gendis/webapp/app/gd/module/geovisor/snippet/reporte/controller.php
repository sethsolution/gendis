<?PHP
use App\Gd\Module\Geovisor\Snippet\Reporte\Index;
use App\Gd\Module\Geovisor\Snippet\Reporte\Catalog;
use Core\Core;

$objItem = new Index();
$objCatalog = new Catalog();

$templateModule = $frontend["baseAjax"];

switch($action) {
    /**
     * Página por defecto (index)
     */
    default:
        $filtervar = $objItem->getFilter($filter);
        //print_struc($filtervar);exit;
        $smarty->assign("filter",$filtervar);

        $data = $objItem->getData($filter);
        $smarty->assign("data",$data);
        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("general");

        $smarty->assign("subpage",$webm["sc_index"]);
        break;
}