<?PHP
namespace App\Plantagd\Module\Distribuidorreporte\Snippet\Index;
use Core\CoreResources;

class Index extends CoreResources {
    var $objTable = "distribuidor_reporte";
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
            //$sqlWhere = ' i.id='.$idItem." and i.distribuidor_id=".$_SESSION["userv"]["distribuidor_id"];
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


    public function getItemDatatableRows($filter){
        global $dbSetting;
        $table = $this->table[$this->objTable];
        $primaryKey = 'id';
        $grid = "item";
        $db=$dbSetting[0];
        /**
         * Additional configuration
         */
        /**
         * Additional configuration - filtro de mes
         */
        $where = "";
        if( isset($filter["month"])){
            $where = "i.mes = ".$filter["month"];
        }
        if($where !=""){
            $where .= " and ";
        }
        /**
         * fin filtro
         */

        //print_struc($_SESSION["userv"]);
        $extraWhere = "";
        $groupBy = "";
        $having = "";
        /**
         * Result of the query sent
         */
        $result = $this->getGridDatatableSimple($db,$grid,$table, $primaryKey, $extraWhere);
        foreach ($result['data'] as $itemId => $valor) {
            $result['data'][$itemId]['created_at'] = $this->changeDataFormat($result['data'][$itemId]['created_at'],"d/m/Y H:i:s");
            $result['data'][$itemId]['updated_at'] = $this->changeDataFormat($result['data'][$itemId]['updated_at'],"d/m/Y H:i:s");
            $result['data'][$itemId]['fecha_envio'] = $this->changeDataFormat($result['data'][$itemId]['fecha_envio'],"d/m/Y H:i:s");
            $result['data'][$itemId]['fecha_observacion'] = $this->changeDataFormat($result['data'][$itemId]['fecha_observacion'],"d/m/Y H:i:s");
            $result['data'][$itemId]['fecha_aprobacion'] = $this->changeDataFormat($result['data'][$itemId]['fecha_aprobacion'],"d/m/Y H:i:s");
        }

        $result["recordsTotal"]=$result["recordsFiltered"];
        return $result;
    }

    /**
     * Index::deleteData($id)
     *
     * Delete a record from the database
     *
     * @param $id
     * @return mixed
     */
    function deleteData($id){
        $field_id="id";
        $where = " distribuidor_id=".$_SESSION["userv"]["distribuidor_id"];
        $res = $this->deleteItem($id,$field_id,$this->table[$this->objTable],$where);
        return $res;
    }

    function updateObservation($itemId, $pregunta, $mensaje, $action){
        $action = "update";
        $rec=array();
        if ($pregunta){
            $rec["observado_mensaje"] = $mensaje;
            $rec["dateUpdate"] = date("Y-m-d H:i:s");
        }
        /**
         * Save processed data
         */
        $field_id="id";
        $where = "";
        $res = $this->updateItem($itemId,$rec,$this->table[$this->objTable],$action,$field_id,$where);
        $res["accion"] = $action;
        return $res;
    }

    function aprobar_reporte($itemId, $action){
        $form="module";
        $rec=array();
        $rec["estado_id"] = 4;
        $rec["observado"] = "FALSE";
        $rec["dateUpdate"] = date("Y-m-d H:i:s");
        $rec["fecha_aprobacion"] = date("Y-m-d H:i:s");
        /**
         * Save processed data
         */
        $field_id="id";
        $where = "";
        $res = $this->updateItem($itemId,$rec ,$this->table[$this->objTable],$action,$field_id,$where);
        $res["accion"] = $action;
        return $res;
    }

    function observar_reporte($itemId, $action){

        $form="module";

        $rec=array();
        $rec["estado_id"] = 3;
        $rec["dateUpdate"] = date("Y-m-d H:i:s");
        $rec["fecha_observacion"] = date("Y-m-d H:i:s");
        /**
         * Save processed data
         */
        $field_id="id";

        $where = "";
        $res = $this->updateItem($itemId,$rec ,$this->table[$this->objTable],$action,$field_id,$where);

        $res["accion"] = $action;
        return $res;
    }

}
