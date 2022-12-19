<?PHP
namespace App\Gd\Module\Dimensionamiento\Snippet\Dimensionamiento;
use Core\CoreResources;
class Index extends CoreResources
{
    var $objTable = "proyecto_ubicacion";
    var $fkey_field = "proyecto_id";

    function __construct(){
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
    }

    function Calculate($rec){
        /**
         * TAblas que usara
         */
//        switch($form){
//            case 'index': $tabla = $this->table[$this->objTable];
//                break;
//            case 'module': $tabla = $this->table["institucion"];
//                break;
//        }
//
//        $itemData  = $this->processData($form,$rec,$action,$item_id);
//        /**
//         * Save processed data
//         */
//        $field_id="id";
//        $res = $this->updateItem($itemId,$itemData ,$tabla,$action,$field_id);
//        $res["accion"] = $action;
//        /**
//         * Process attachment
//         */
//        if( $res["res"]==1){
//            /**
//             * Reconfiguraremos la relación del departamento y municipio principal
//             */
//            switch($form){
//                case 'index': $this->setUbicacion($item_id);
//                    break;
//                case 'module':
//                    $fieldGeom = "geom";
//                    $requestGeom = $this->setGeomPointPostgis(
//                        $itemData["location_longitude_decimal"]
//                        ,$itemData["location_latitude_decimal"]
//                        ,"institucion"
//                        ,$fieldGeom
//                        ,$field_id
//                        ,$res["id"]
//                    );
//                    if($requestGeom["res"]!=1){
//                        $res = $requestGeom;
//                    }
//
//                    break;
//            }
//        }
        $item["capacidad"] = $this->calculateCapacidad($rec);
        $item["potenciaACInversor"] = $this->calculatePotenciaACInversor($item["capacidad"]);
        $item["numeroModulos"] = $this->calculateNumeroModulos($item["capacidad"]);
        $item["numeroInversores"] = $this->calculateNumeroInversores($item["potenciaACInversor"]);
        $item["areaInstalacion"] = $this->calculateAreaInstalacion($item["numeroModulos"]);
        $item["inclinacionModuloOptimo"] = round(abs($rec["location_latitude_decimal"]),0);
        $item["orientacionOptima"] = $this->calculateOrientacionOptimo($rec["location_latitude_decimal"]);
//        $res = "Calcular";
//        print_struc($rec);
//        print_struc($item);exit;
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
