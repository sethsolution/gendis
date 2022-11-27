<?PHP
namespace App\Web\Module\Singin\Snippet\Index;
use Core\CoreResources;
use Core\Core;
use App\Models\User;

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

class Index extends CoreResources {
    var $objTable = "hojaruta";
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

    function updateData($rec){
        global $smarty;
        $action="new";
        $rec["username"]=strtolower(trim($rec["usuario"]));
        $rec["password"]=trim($rec["password"]);
        /**
         * Sacamos los datos del usuario para verificar si no existe.
         */
        if($rec["password"]=="")$rec["username"]="";
        //$rec["username"] = "admin@seth.com.bo";
        
        if (filter_var($rec["username"], FILTER_VALIDATE_EMAIL)) {
            $where = [
                ['username', '=', $rec["username"]]
            ];
            $user = User::select('id','active')->where($where)->first();
            if($user->id=="" || $user->active == false ){
                
                $form="user";
                $itemData  = $this->processData($form,$rec,$action);                
                if($user->id>0){
                    $action="update";
                    $itemId =$user->id;
                }else{
                    $itemId ="";
                }
                $field_id="id";
                $res = $this->updateItem($itemId,$itemData ,$this->table_core["user"],$action,$field_id);
                $res["accion"] = $action;
                if($res["res"]==1){
                    unset($res["id"]);
                    unset($res["accion"]);
                    /**
                     * Enviamos a la vista las variables para crear el correo
                     */
                    $smarty->assign("check_code",$itemData["check_code"]);
                    $smarty->assign("email_user", base64_encode($itemData["username"]));
                    $to["email"] = $itemData["username"];
                    $to["name"] = $itemData["name"]." ".$itemData["last_name"];
                    $asunto = "[MNHN-SIB] - Verificación de correo electrónico";
                    $envio = $this->sendEmailSystem($to,$asunto);
                }

            }else{
                $res["res"] = 2;
                $res["msg"] = "El usuario ya se encuentra registrado y Activo";
            }
        }else{
            $res["res"] = 2;
            $res["msg"] = "El Usuario es invalido";
        }

        return $res;
    }

    private function processData($form,$rec,$action="new"){
        $dataResult = array();

        switch($form){
            case 'user':
                $dataResult = $this->processFields($rec,$this->campos[$form],$action);
                /**
                 * Additional processes when saving the data
                 */
                $codigo = $this->getRamdomString(40);
                $dataResult["check_code"]=$codigo;
                $dataResult["user_create"]=1;
                $dataResult["user_update"]=1;
                $dataResult["type"]=3;
                $dataResult["active"]='FALSE';
                $dataResult["username"]=trim($dataResult["username"]);
                $dataResult["password"]=md5(trim($dataResult["password"]));

                break;
        }
        return $dataResult;
    }

    public function verifica($c,$e){
        if(trim($c)!=""){
            $where = [
                ['username', '=', base64_decode($e)],
                ['check_code', '=', $c],
                ['active', '=', FALSE],
            ];
            $user = User::where($where)->first();
        }
        return $user;
    }
    public function valida_email($c,$e){
        global $db,$smarty;
        /**
         * Verificamos si existe el usuario
         */
        $user = $this->verifica($c,$e);
        if($user->id>1){
            $e = base64_decode($e);
            $rec = array();
            $rec["check_date"] = date("Y-m-d H:i:s");
            $rec["check_email"] = 'TRUE';
            $rec["check_code"] = NULL;
            $rec["active"] = 'TRUE';
            $db->AutoExecute($this->table_core["user"],$rec,"UPDATE","id='".$user->id."'");
            $smarty->assign("email_user", trim($e));

            $to["email"] = $user->username;
            $to["name"] = $user->name." ".$user->last_name;

            $asunto = "[MNHN-SIB] - Su cuenta fue activada";
            //$envio = $this->sendEmailSystem($to,$asunto);

            $resp["resp"] = 1;
            $resp["msg"] = "Se cambio con exito la contraseña";
        }else{
            $resp["resp"] = 2;
            $resp["msg"] = "Los datos de verificación de correo electrónico son incorrectos";
        }
        return $resp;
    }
}