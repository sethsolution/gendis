<?PHP
namespace App\Gd\Module\Dimensionamiento\Snippet\Dimensionamiento;
use Core\CoreResources;
class Index extends CoreResources
{
    function __construct(){
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
    }

    function Calculate($rec){

        $item["capacidad"] = $this->calculateCapacidad($rec);
        $item["potenciaACInversor"] = $this->calculatePotenciaACInversor($item["capacidad"]);
        $item["numeroModulos"] = $this->calculateNumeroModulos($item["capacidad"]);
        $item["numeroInversores"] = $this->calculateNumeroInversores($item["potenciaACInversor"]);
        $item["areaInstalacion"] = $this->calculateAreaInstalacion($item["numeroModulos"]);
        $item["inclinacionModuloOptimo"] = round(abs($rec["location_latitude_decimal"]),0);
        $item["orientacionOptima"] = $this->calculateOrientacionOptimo($rec["location_latitude_decimal"]);
        return $item;
    }

    function calculateCapacidad($rec){
        $factorAETN = 0.8;
        $GHIAnual = 4.783025325;
        $capacidad= $rec["consumo_mensual_promedio"] * (1/$GHIAnual) * (1/30) * $factorAETN * 1000;
        return ceil($capacidad);
    }

    function calculatePotenciaACInversor($capacidad){
        $factorConversion = 1.2;
        $potenciaACInversor = $capacidad/$factorConversion;
        return ceil($potenciaACInversor);
    }

    function calculateNumeroModulos($capacidad){
        $potenciaModulo= 330;
        $numeroModulos=$capacidad/$potenciaModulo;
        return ceil($numeroModulos);
    }

    function calculateNumeroInversores($potenciaACInversor){
        $potenciaACOutInversor = 1500;
        $numeroInversores = $potenciaACInversor/$potenciaACOutInversor;
        return ceil($numeroInversores);
    }

    function calculateAreaInstalacion($numeroModulos){
        $longitudModulo = 1.956; //Longitud del modulo [m]
        $anchoModulo = 0.992; //Ancho del modulo [m]
        $areaPorModulo = ceil($longitudModulo*$anchoModulo);
        $areaTotal = $numeroModulos*$areaPorModulo;
        return ceil($areaTotal);
    }

    function calculateOrientacionOptimo($latitud){
        if($latitud<0){
            $orientacionOptima="Norte";
        }else{
            $orientacionOptima="Sur";
        }
        return $orientacionOptima;
    }
}
