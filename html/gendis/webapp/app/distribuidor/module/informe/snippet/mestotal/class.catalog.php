<?PHP
namespace App\Gd\Module\Geovisor\Snippet\Reporte;
use Core\CoreResources;

class Catalog extends CoreResources{

    function __construct(){
        /**
         * Inicializamos todas las librerias y variables para el submodulo
         */
        $this->appInit();
    }
    /**
     * Implementación desde aca
     */
    public function conf_catalog_form(){
        $this->addCatalogList($this->table["gd_categoria"],"categoria","","nombre","","","","");
    }
    public function get_activo_option(){
        global $smarty;
        $dato = array();
        $dato["1"] = $smarty->config_vars["glOptActive"];
        $dato["0"] = $smarty->config_vars["glOptInactive"];
        return $dato;
    }

    public function getMonthList(){
        global $smarty;
        $dato = array();
        $dato["1"] = "Enero";
        $dato["2"] = "Febrero";
        $dato["3"] = "Marzo";
        $dato["4"] = "Abril";
        $dato["5"] = "Mayo";
        $dato["6"] = "Junio";
        $dato["7"] = "Julio";
        $dato["8"] = "Agosto";
        $dato["9"] = "Septiembre";
        $dato["10"] = "Octubre";
        $dato["11"] = "Noviembre";
        $dato["12"] = "Diciembre";
        return $dato;
    }


}