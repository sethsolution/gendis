<?PHP
use App\Gd\Module\Dimensionamiento\Snippet\Index\Index;
use App\Gd\Module\Dimensionamiento\Snippet\Index\Catalog;
use Core\Core;


$objItem = new Index();
$objCatalog = new Catalog();

switch($action) {
    default:
        $smarty->assign("google_map_key", $_ENV["GOOLE_MAP_KEY"]);
        $smarty->assign("stadiamaps_key", $_ENV["STADIAMAPS_KEY"]);
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
         * Tabs
         */
        $menu_tab = $objItem->getTabItem($type,"index");
        //print_r($menu_tab);
        $smarty->assign("menu_tab", $menu_tab);
        $smarty->assign("menu_tab_active", "dimensionamiento");

        /**
         * Template for index and js
         */
        $smarty->assign("subpage", $webm["index"]);
        $smarty->assign("subpage_js", $webm["index_js"]);
        break;

}