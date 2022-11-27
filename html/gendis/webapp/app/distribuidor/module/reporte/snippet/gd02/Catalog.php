<?PHP
namespace App\Distribuidor\Module\Reporte\Snippet\Gd02;
use Core\CoreResources;

class Catalog extends CoreResources{

    function __construct(){
        /**
         * Inicializamos todas las librerias y variables para el submodulo
         */
        $this->appInit();
    }

    public function confCatalog(){

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