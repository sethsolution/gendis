<?PHP
namespace App\Plantagd\Electrolinera\Cargador;
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
        $this->addCatalogList($this->table["gd_tipo_cargador"]
            ,"tipo_cargador","","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["gd_estado_conector"]
            ,"estado_conector","","nombre",""
            ,"nombre","","","");
    }
    public function get_activo_option(){
        global $smarty;
        $dato = array();
        $dato["1"] = $smarty->config_vars["glOptActive"];
        $dato["0"] = $smarty->config_vars["glOptInactive"];
        return $dato;
    }
}