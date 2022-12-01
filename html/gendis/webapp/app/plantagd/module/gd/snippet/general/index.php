<?PHP
namespace App\Plantagd\Gd\General;
use Core\CoreResources;

class Index extends CoreResources {
    var $objTable = "gd";
    var $folder = "gd";
    //var $fkey_field = "coleccion_id";
    //var $fkey_id = 6;
    var $extraWhere = "";
    function __construct()
    {
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();

    }
    function getItem($idItem){

        $info = '';

        if($idItem!=''){
            $sqlSelect = ' i.*
                           , concat(u1.name,\' \',u1.last_name) AS user_creater
                            , CONCAT(u2.name,\' \',u2.last_name) as user_updater';
            $sqlFrom = ' '.$this->table[$this->objTable].' i
                         LEFT JOIN '.$this->table_core["user"].' u1 on u1.id=i.user_create
                         LEFT JOIN '.$this->table_core["user"].' u2 on u2.id=i.user_update';
            $sqlWhere = ' i.id='.$idItem;
            $sqlGroup = ' ';

            $sql = 'SELECT '.$sqlSelect.'
                  FROM '.$sqlFrom.'
                  WHERE '.$sqlWhere.'
                  '.$sqlGroup;
            $info = $this->dbm->Execute($sql);
            $info = $info->fields;


        }
        return $info;
    }
    function updateData($rec,$itemId,$action){
        //print_struc($rec);exit;
        $form="module";
        $itemData  = $this->processData($form,$rec,$action);

        /**
         * Save processed data
         */
        $field_id="id";

        $res = $this->updateItem($itemId,$itemData ,$this->table[$this->objTable],$action,$field_id);
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
                    //$dataResult["active"] = 1;
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