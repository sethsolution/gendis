<?PHP
namespace App\Plantagd\Module\Distribuidorreporte\Snippet\Gd01;
use Core\CoreResources;

class Index extends CoreResources {
    var $objTable = "distribuidor_reporte_archivo";
    var $folder = "reporte";
    var $fkey_field = "distribuidor_reporte_id";


    function __construct()
    {
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();

    }

    function updateData($rec,$itemId,$action,$input_file){
        global $objItem;
        //print_struc($rec);exit;
        $form="index";

        /**
         * Implementación de guardado de archivos
         */

        if($input_file["tmp_name"]!=""){
            $extension = pathinfo($input_file["name"], PATHINFO_EXTENSION);
            if($extension=="xlsx" || $extension=="mdb"){
                $res["res"] = 1;
                $res["msg"] = "Se guardo con exito";
                $item = $objItem->getItem($itemId);
                /**
                 * Verificamos si tiene datos almacenados para GD01
                 */
                if($item["id"]!=""){
                    if($item["gd01_archivo_id"]!=""){
                        $action = "update";
                        $itemId = $item["gd01_archivo_id"];
                    }else{
                        $action = "new";
                        $itemId = "";
                    }
                    $item_id = $item["id"];
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
                        $itemFile = $this->getItem($res["id"],$item_id);
                        $item_id_name = $this->fkey_field;
                        $id_name = "id";
                        $adjunto = $this->saveAttachment($itemFile,$tabla,$input_file,$item_id,$res["id"],$action,$this->folder,$item_id_name,$id_name);
                    }

                    if($adjunto["res"]==1){
                        /**
                         * Actualizamos la tabla principal
                         */
                        $itemData2["gd01_archivo_id"]= $adjunto["id"];
                        $itemData2["gd01"]= "TRUE";

                        $field_id="id";
                        $where = " distribuidor_id=".$_SESSION["userv"]["distribuidor_id"];
                        $action = "update";

                        $res = $this->updateItem($item_id,$itemData2 ,$this->table["distribuidor_reporte"],$action,$field_id,$where);
                        $res["accion"] = $action;
                    }else{
                        $res["res"] = 2;
                        $res["type"] = 1; //mensaje de archivo no permitido
                        $res["msgdb"] = "No se pudo guardar el archivo enviado";
                    }
                }else{
                    $res["res"] = 2;
                    $res["type"] = 1; //mensaje de archivo no permitido
                    $res["msgdb"] = "No se encontro el dato del padre";
                }
            }else{
                $res["res"] = 2;
                $res["type"] = 8; //mensaje de archivo no permitido
                $res["msgdb"] = "Solo se aceptan archivo con extensión .xlsx o .mdb";
            }
            //print_struc($extension);
        }
        return $res;
    }

    function getItem($id,$item_id){
        //$where = " and d.distribuidor_id=".$_SESSION["userv"]["distribuidor_id"];

        $sql = "select p.* from ".$this->table[$this->objTable]." as p 
        left join ".$this->table["distribuidor_reporte"]." as d on d.id = p.distribuidor_reporte_id
        where p.id = '".$id."' and p.".$this->fkey_field." = '".$item_id."' 
        ";
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;
        $item["attached_size"] =round(($item["attached_size"] /1024/1024), 2);
        $item['updated_at'] = $this->changeDataFormat($item['updated_at'],"d/m/Y H:i:s");
        return $item;
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
                    //$dataResult["activo"] = "true";
                    $dataResult[$this->fkey_field]= $item_id;
                }
                break;
        }
        return $dataResult;
    }

    function getFile($id,$item_id){
        $msg_erro = "<div style='text-align: center; background-color: #fee7dc;vertical-align: center; padding-top: 50px;padding-bottom: 50px;'><span style='color:red; font-family: Arial;font-size:26px;'>The file does not exists</span></div>";
        $item = $this->getItem($id,$item_id);

        if($item["id"]!=""){
            $dir  = $this->getAttachmentDir($item_id,0,$this->folder);
            $file = $dir.$id.".".$item["attached_extension"];
            if(file_exists($file)){
                header ("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
                header ("Last-Modified: " . gmdate("D,d M YH:i:s") . " GMT");
                header ("Cache-Control: no-cache, must-revalidate");
                header ("Pragma: no-cache");
                header ("Content-Type:".$item["attached_type"]);
                header ('Content-Disposition: attachment; filename="'.$item["attached_name"].'"');
                header ("Content-Length: " . $item["attached_size"]);
                readfile($file);
                exit;
            }else{
                echo $msg_erro;
            }
        }else{
            echo $msg_erro;
        }
        exit;
    }
}