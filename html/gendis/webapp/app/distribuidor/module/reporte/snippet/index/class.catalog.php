<?PHP
namespace App\Gd\Module\Instaladora\Snippet\Index;
use Core\CoreResources;

class Catalog extends CoreResources{
    function __construct(){
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
    }

    public function getActiveOption(){
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