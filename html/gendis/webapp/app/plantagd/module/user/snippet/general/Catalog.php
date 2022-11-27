<?PHP
namespace App\Sib\Module\User\Snippet\General;
use Core\CoreResources;
class Catalog extends CoreResources{

    function __construct(){
        /**
         * Inicializamos todas las librerias y variables para el submodulo
         */
        $this->appInit();

    }
    public function confCatalog(){
        $this->addCatalogList($this->table["distribuidor"]
            ,"distribuidor","","CONCAT(ciae,' | ', nombre) as name",""
            ,"nombre","","", true);
    }

    public function getUserType(){
        global $smarty;
        $dato = array();
        $dato[1] = $smarty->config_vars["opt_typeuser_1"];
        $dato[2] = $smarty->config_vars["opt_typeuser_2"];
        $dato[3] = $smarty->config_vars["opt_typeuser_3"];
        //$dato[3] = $smarty->config_vars["opt_typeuser_3"];
        return $dato;
    }
}