<?PHP
namespace App\Distribuidor\Module\Reporte\Snippet\Gd01;
use Core\CoreResources;
use PhpOffice\PhpSpreadsheet\Spreadsheet;

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
            $extension = strtolower($extension);

            if($extension=="xlsx" || $extension=="mdb"){
                /**
                 * Verificamos el archivo
                 * ---------------------------------------------------------
                 */
                $dataFile = $this->getDataFromFile($input_file["tmp_name"],$itemId,$extension);

                if($dataFile["res"]==1){

                    if( strtoupper($dataFile["data"]["titulos"]["AC"])!="FAC_PLANTA" &&  strtoupper($dataFile["data"]["titulos"]["AB"])!="FECHA_PSR" && $extension == "xlsx" ){
                        $res["res"] = 2;
                        $res["type"] = 9; //Contenido de archivo NO válido
                        $res["msgdb"] = "La estructura del excel subido NO es válido";
                    }else{
                        if( count($dataFile["data"]["data"])== 0 ){
                            $res["res"] = 2;
                            $res["type"] = 9; //Contenido de archivo NO válido
                            $res["msgdb"] = "El archivo no tiene datos";
                        }
                    }
                }else{
                    $res = $dataFile;
                }
                if($res["res"]==2){
                    return $res;
                }
                /**
                 * ---------------------------------------------------------
                 */

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
                        /**
                         * Guardamos el contenido de los datos del archivo
                         */

                        $this->save($dataFile["data"]["data"],$item_id);
                        /**
                         * -----------------------------------------------------------------
                         */
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
        $where = " and d.distribuidor_id=".$_SESSION["userv"]["distribuidor_id"];

        $sql = "select p.* from ".$this->table[$this->objTable]." as p 
        left join ".$this->table["distribuidor_reporte"]." as d on d.id = p.distribuidor_reporte_id
        where p.id = '".$id."' and p.".$this->fkey_field." = '".$item_id."' 
        ".$where;
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
        $msg_erro = "<div style='text-align: center;  background-color: #fee7dc;vertical-align: center; padding-top: 50px;padding-bottom: 50px;'><span style='color:red; font-family: Arial;font-size:26px;'>The file does not exists</span></div>";
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

    function getDataFromFile($file,$item_id,$extension="xlsx"){
        if(file_exists($file)){
            if(strtolower($extension)=="mdb_222222222"){
                // Implementar Luego
            }else if(strtolower($extension)=="xlsx"){
                $data = $this->getExcelData($file,$item_id);
                $res["res"] = 1;
                $res["data"] = $data;
            }else{
                $res["res"] = 2;
                $res["type"] = 8; //mensaje de archivo no permitido
                $res["msgdb"] = "Solo se aceptan archivo con extensión .xlsx o .mdb";
            }
        }else{
            $res["res"] = 2;
            $res["type"] = 9; //Contenido de archivo NO válido
            $res["msgdb"] = "No se ha encontrado el archivo";
        }
        return $res;
    }

    function getFileData($item,$item_id){
        if($item["id"]!=""){
            $id = $item["id"];
            $item_id=$item["distribuidor_reporte_id"];
            $dir  = $this->getAttachmentDir($item_id,0,$this->folder);
            $file = $dir.$id.".".$item["attached_extension"];

            $res = $this->getDataFromFile($file,$item_id,$item["attached_extension"]);
        }else{
            $res["res"] = 2;
            $res["type"] = 9; //Contenido de archivo NO válido
            $res["msgdb"] = "No se tiene datos del archivo seleccionado";
        }
        return $res;
    }

    function getExcelData($file,$item_id){
        $reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader("Xlsx");
        $spreadsheet = $reader->load($file);
        $hojaActual = $spreadsheet->setActiveSheetIndex(0); //Primera hoja
        $totalregistro = $hojaActual->getHighestRow();

        $resultado = array();

        foreach ($hojaActual->getRowIterator() as $nfila => $fila) {
            if($nfila==3){
                $afila = array();
                foreach ($fila->getCellIterator() as $ncelda => $celda) {
                    $valorFormateado = $celda->getFormattedValue();
                    $fila = $celda->getRow();
                    $columna = $celda->getColumn();
                    $afila[$columna] = trim($valorFormateado);
                }
                $titulos = $afila;
            }

            if($nfila>3){
                $afila = array();
                foreach ($fila->getCellIterator() as $ncelda => $celda) {
                    /*
                    if($columna=="R"){
                        $valorRaw = $celda->getValue();
                    }else{

                    }
                    */
                    $valorFormateado = $celda->getFormattedValue();
                    $columna = $celda->getColumn();
                    //print_struc($columna);
                    //$afila[$columna] = trim($valorRaw);
                    $afila[$columna] = trim($valorFormateado);
                }
                $afila = $this->getField($afila);
                $afila["distribuidor_reporte_id"] = $item_id;
                $afila["distribuidor_id"] = $_SESSION["userv"]["distribuidor_id"];
                if($afila["cliente"]!=""){
                    $resultado[] = $afila;
                }
            }
        }

        $res = array();
        $res["titulos"] = $titulos;
        $res["data"] = $resultado;
        return $res;
    }

    function save($rec,$item_id){
        $table = $this->table["distribuidor_reporte_gd01"];
        /**
         * Borramos todos los datos existentes
         */
        //$this->dbm->debug = true;
        $sql = "delete from ".$table."  as d
                where d.distribuidor_reporte_id = $item_id and d.distribuidor_id = ".$_SESSION["userv"]["distribuidor_id"];
        $this->dbm->Execute($sql);
        /**
         * Guardamos los datos uno a uno
         */
        foreach ($rec as  $row){
            $resp = $this->dbm->AutoExecute($table,$row);
            //print_struc($row);
        }
        //exit;
    }

    function getField($afila){
        global $campos;
        $result = array();
        foreach ($afila as $indice => $row){
            if($campos[$indice]!=""){
                $result[$campos[$indice]]=$row;
            }
            //echo "Indice:". $indice." / Dato".$row." --\n";
        }
        $result["created_at"] = date("Y-m-d H:i:s");
        $result["updated_at"] = date("Y-m-d H:i:s");

        $result["user_create"] = 1;
        $result["user_update"] = 1;
        return $result;
    }

    function getAccessData($item){
        $id = $item["id"];
        $item_id=$item["distribuidor_reporte_id"];
        //$item = $this->getItem($id,$item_id);
        if($item["id"]!=""){
            $dir  = $this->getAttachmentDir($item_id,0,$this->folder);
            $file = $dir.$id.".".$item["attached_extension"];
            if(strtolower($item["attached_extension"])=="mdb"){

                //$file="d:\GD01102021.mdb";
                $file="/var/www/html/datafile/distribuidor/reporte/0/1/reporte/14.mdb";

                //phpinfo();
                /*
                $dba = ADONewConnection('access');
                $file="d:\GD01102021.mdb";
                //$dsn = "Driver={Microsoft Access Driver (*.mdb)};Dbq=".$file.";Uid=;Pwd=;";
                $dsn = "Driver={Microsoft Access Driver (*.mdb)};Dbq=".$file."";
                echo $dsn;
                $dba->debug = true;
                $dba->Connect($dsn);

                $rs = $dba->execute (' select * from GD0188 ');

                print "<pre>";
                print_struc($rs->getrows());
                print "</pre>";
                */
                // Connection to ms access

                $uname = explode(" ",php_uname());
                $os = $uname[0];

                //echo "------->".$os."<------------";
                switch ($os){
                    case 'Windows':
                        $driver = '{Microsoft Access Driver (*.mdb)}';
                        break;
                    case 'Linux':
                        $driver = 'MDBTools';
                        break;
                    default:
                        exit("Don't know about this OS");
                }

                $dbname = $file;





                /*
                if (!file_exists($dbname)) {
                    die("Could not find database file.");
                }else{
                    echo "-----> Si ha leido el archivo ";

                }
                */
                try {
                    print_struc($dbname);
                    $connection = new PDO("odbc:Driver={$driver};DBQ=$dbname;");

                    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                    $query = 'select * from GD01';
                    $result = $connection->query($query)->fetchAll(PDO::FETCH_ASSOC);
                    print_struc($result);

                    //$sql = "select * from GD01";
                    //$result = $dbh->query($sql);
                    //$row = $result->fetchAll(PDO::FETCH_ASSOC);

                    $query = 'select * from GD01';
                    $result = $connection->query($query);

                    if($result !== false) {
                        // Parse the result set
                        foreach($result as $row) {
                            //print_r ("<br>");
                            //print_r ($row);
                            //print_struc($row);
                        }
                    }
                    $connection = null;

                } catch (PDOException $e) {
                    echo 'Connection failed: ' . $e->getMessage();
                    //die();
                } catch (Exception $e) {
                    echo "Exception: <br>".$e->getMessage();
                    //die();
                }


                /*
                $db = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb)};Dbq=".$file.";Uid=; Pwd=;");
                $db->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
                if ($db)
                    echo "<br>PDO connection success\n";
                else
                    echo "<br>pdo connection failed\n";
                try{
                    $result = $db->query($sql);
                    $row = $result->fetchAll(PDO::FETCH_ASSOC);
                    print_r($row);
                }catch(PDOExepction $e){
                    echo $e->getMessage();
                }
                */

            }


            //echo $file;

        }else{
            echo "no existe el archivo";
        }
    }

}