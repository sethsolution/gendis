<?PHP
namespace App\Plantagd\Module\Distribuidorreporte\Snippet\General;
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
                break;
        }
        return $dataResult;
    }
}