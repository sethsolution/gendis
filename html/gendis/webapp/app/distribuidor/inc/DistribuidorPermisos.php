<?php
use Core\CoreResources;
class DistribuidorPermisos extends CoreResources {
    var $objTable = "instalador";
    function __construct()
    {
        global $db;
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
        $this->dbm = $db;
    }

    public function setPermisos(){
        $sql = "select * from  ".$this->table_core["app_module"]." as am where am.app_id=1 ";
        $item = $this->dbm->Execute($sql);
        $item = $item->getRows();
        foreach ($item as $row){
            $this->save($row["id"]);
        }
    }
    public function save($id){
        $sql = "select * from ".$this->table_core["user_module"]." as um where um.user_id= ".$this->userId." and um.app_module_id=".$id;
        $m = $this->dbm->Execute($sql);
        $m = $m->fields;
        if($m["id"]==""){
            $rec = array();
            $rec["created_at"] = $rec["updated_at"] =  date("Y-m-d H:i:s");
            $rec["user_create"] = $rec["user_update"] = $this->userId;
            $rec["add"] =$rec["edit"]=$rec["delete"]="TRUE";
            $rec["user_id"] = $this->userId;
            $rec["app_module_id"] = $id;
            $this->dbm->AutoExecute($this->table_core["user_module"],$rec);
        }
    }
}