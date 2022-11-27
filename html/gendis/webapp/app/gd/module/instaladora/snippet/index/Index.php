<?PHP
namespace App\Gd\Module\Instaladora\Snippet\Index;
use Core\CoreResources;

class Index extends CoreResources {
    var $objTable = "instalador";
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


    public function getItemDatatableRows(){
        global $dbSetting;
        $table = $this->table[$this->objTable];
        $primaryKey = 'id';
        $grid = "item";
        $db=$dbSetting[0];
        /**
         * Additional configuration
         */
        $extraWhere = " i.active =TRUE ";
        $groupBy = "";
        $having = "";
        /**
         * Result of the query sent
         */
        $result = $this->getGridDatatableSimple($db,$grid,$table, $primaryKey, $extraWhere);
        foreach ($result['data'] as $itemId => $valor) {
            if(isset($result['data'][$itemId]['created_at']))  $result['data'][$itemId]['created_at'] = $this->changeDataFormat($result['data'][$itemId]['created_at'],"d/m/Y H:i:s");
            if(isset($result['data'][$itemId]['updated_at']))  $result['data'][$itemId]['updated_at'] = $this->changeDataFormat($result['data'][$itemId]['updated_at'],"d/m/Y H:i:s");
        }
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
        $res = $this->deleteItem($id,$field_id,$this->table[$this->objTable]);
        return $res;
    }

    /**
     * Generar archivos de requisitos
     */
    function setRequirement($id){
        $item = $this->getItem($id);
        $res = array();

        $res["legal"] = $this->getRequirement(1,$id);
        $res["tecnico"] = $this->getRequirement(2,$id);
        if($item["instalador_tipo_id"]==2){
            $res["extranjera"] = $this->getRequirement(3,$id);
        }

        return $res;
    }
    function getRequirementList($category_id,$id){
        $sql = "select 
                r.id as req_id
                , r.nombre as req_nombre
                , r.activo as req_activo
                , r.categoria_id as req_categoria_id
                , a.*
                from ".$this->table["requisito"]." as r
                left join public.instalador_archivo as a on a.requisito_id=r.id and a.instalador_id='".$id."'
                where 
                r.activo = true
                and r.categoria_id='".$category_id."'";
        $item = $this->dbm->Execute($sql);
        $item = $item->getRows();
        return $item;
    }
    function getRequirement($category_id,$id){
        $item = $this->getRequirementList($category_id,$id);
        $creo = 0;
        foreach ($item as $row){
            if($row["id"]==""){
                $rec = array();
                $rec["created_at"] = $rec["updated_at"] =  date("Y-m-d H:i:s");
                $rec["user_create"] = $rec["user_update"] = $this->userId;
                $rec["requisito_id"] = $row["req_id"];
                $rec["categoria_id"] = $category_id;
                $rec["nombre"] = $row["req_nombre"];
                $rec["instalador_id"] = $id;
                $this->dbm->autoExecute($this->table["instalador_archivo"],$rec);
                $creo = 1;
            }
        }

        if($creo){
            $item = $this->getRequirementList($category_id,$id);
        }
        return $item;
    }


}