<?PHP
namespace App\Distribuidor\Module\Gd\Snippet\General;
use Core\CoreResources;

class Index extends CoreResources {
    var $objTable = "gd";
    function __construct()
    {
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();

    }

    function updateData($rec,$itemId,$action){
        //print_struc($rec);exit;
        $form="module";
        $itemData  = $this->processData($form,$rec,$action);

        /**
         * Save processed data
         */
        $field_id="id";

        $where = " distribuidor_id=".$_SESSION["userv"]["distribuidor_id"];
        $res = $this->updateItem($itemId,$itemData ,$this->table[$this->objTable],$action,$field_id,$where);

        $res["accion"] = $action;

        /**
         * Guardamos datos geográficos para postgresql
         */
        if($res["res"]==1){
            $fieldGeom = "geom";
            $requestGeom = $this->setGeomPointPostgis(
                $itemData["location_longitude_decimal"]
                ,$itemData["location_latitude_decimal"]
                ,$this->objTable
                ,$fieldGeom
                ,$field_id
                ,$res["id"]
            );
            if($requestGeom["res"]!=1){
                $res = $requestGeom;
            }
        }
        return $res;
    }

    function processData($form,$rec,$action="new"){
        $dataResult = array();
        switch($form){
            case 'module':
                $dataResult = $this->processFields($rec,$this->campos[$form],$action);


                /**
                 * Additional processes when saving the data
                 */
                if ($action=="new"){
                    $dataResult["distribuidor_id"] = $_SESSION["userv"]["distribuidor_id"];
                }
                $location = $this->getDepartamentData($dataResult["location_longitude_decimal"],$dataResult["location_latitude_decimal"]);

                $dataResult["departamento_id"]=$location["departamento_id"];
                $dataResult["municipio_id"]=$location["id"];
                $dataResult["departamento"]=$location["departamento"];
                $dataResult["provincia"]=$location["provincia"];
                $dataResult["municipio"]=$location["name"];
                break;
        }
        return $dataResult;
    }
    function getDepartamentData($long,$lat){

        $sql = "select   
                m.id
                ,m.c_ut
                ,m.departamen as departamento
                ,m.provincia
                ,m.name
                ,m.capital
                ,m.departamento_id
                
                from ".$this->table["municipio"]." as m where st_intersects(m.geom, st_setsrid(st_makepoint(".$long.", ".$lat."), 4326))";
        $info = $this->dbm->Execute($sql);
        $data = $info->getRows();

        return $data[0];
    }
}