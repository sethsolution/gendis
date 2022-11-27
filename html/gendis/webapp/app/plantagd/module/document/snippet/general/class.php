<?PHP
namespace App\Gd\Module\Geovisor\Snippet\Index;
use Core\CoreResources;

class Index extends CoreResources {
    var $objTable = "archivo";
    function __construct()
    {
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();

    }

    function updateData($rec,$itemId,$action){

        $form="module";
        $itemData  = $this->processData($form,$rec,$action);
        /**
         * Save processed data
         */
        $field_id="id";
        $res = $this->updateItem($itemId,$itemData ,$this->table[$this->objTable],$action,$field_id);
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
                    //$dataResult["active"] = 1;
                }
                break;
        }

        return $dataResult;
    }
}