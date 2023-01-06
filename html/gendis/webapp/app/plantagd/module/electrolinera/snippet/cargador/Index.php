<?PHP
namespace App\Plantagd\Electrolinera\Cargador;
use Core\CoreResources;
class Index extends CoreResources
{
    var $objTable = "electrolinera_tipo_cargador";
    var $folder = "cargador";
    var $fkey_field = "electrolinera_id";

    function __construct(){
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
    }
    /**
     * Implementación desde aca
     */

    public function getItemDatatableRows($item_id){
        global $dbSetting;
        $table = $this->table[$this->objTable];
        $primaryKey = 'id';
        $grid = "index";
        $db=$dbSetting[0];
        /**
         * Additional configuration
         */
        $extraWhere = $this->fkey_field."='".$item_id."' " ;
        $groupBy = "";
        $having = "";
        /**
         * Result of the query sent
         */
        $result = $this->getGridDatatableSimple($db,$grid,$table, $primaryKey, $extraWhere);
        foreach ($result['data'] as $itemId => $valor) {
            $result['data'][$itemId]['created_at'] = $this->changeDataFormat($result['data'][$itemId]['created_at'],"d/m/Y H:i:s");
            $result['data'][$itemId]['updated_at'] = $this->changeDataFormat($result['data'][$itemId]['updated_at'],"d/m/Y H:i:s");
        }
        $result["recordsTotal"]=$result["recordsFiltered"];
        return $result;
    }


    function updateData($rec,$itemId,$form,$action,$item_id, $input_file){
        //print_struc($_FILES);
        $tabla = $this->table[$this->objTable];
        $itemData  = $this->processData($form,$rec,$action,$item_id);
        /**
         * Save processed data
         */
        $field_id="id";
        $res = $this->updateItem($itemId,$itemData ,$tabla,$action,$field_id);
        $res["accion"] = $action;
        /**
         * Process attachment
         */


        if( $res["res"]==1){
        }
        return $res;
    }

    function processData($form,$rec,$action="new",$item_id){
        $dataResult = array();
        switch($form){
            case 'index':
                $dataResult = $this->processFields($rec,$this->campos[$form],$action);
                /**
                 * Additional processes when saving the data
                 */
                if ($action=="new"){
                    $dataResult[$this->fkey_field]= $item_id;
                }
                break;

        }
        return $dataResult;
    }

    function getItem($id,$item_id){
        $sql = "select * from ".$this->table[$this->objTable]." as p where p.id = '".$id."' and p.".$this->fkey_field." = '".$item_id."'";
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;
        return $item;
    }

    function deleteData($id,$item_id){
        $item = $this->getItem($id,$item_id);
        /**
         * Delete the record from the database
         */
        $field_id="id";
        $where = $this->fkey_field."='".$item_id."'";
        $res = $this->deleteItem($id,$field_id,$this->table[$this->objTable],$where);
        return $res;
    }
}
