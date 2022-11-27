<?PHP
namespace App\Distribuidor\Module\Geovisor\Snippet\Gd;
use Core\CoreResources;

class Index extends CoreResources {
    var $objTable = "gd";
    var $folder = "pagos";
    var $fkey_field = "instalador_id";

    function __construct(){
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
    }
    /**
     * Implementación desde aca
     */

    public function getItemDatatableRows($item_id,$filter){
        global $dbSetting;
        $table = $this->table[$this->objTable];
        $primaryKey = 'id';
        $grid = "index";
        $db=$dbSetting[0];
        /**
         * Additional configuration
         */
        $where = $this->get_filtro_where($filter);
        $where = str_replace("g.","i.",$where);


        $extraWhere = $where ;
        $groupBy = "";
        $having = "";
        /**
         * Result of the query sent
         */
        $result = $this->getGridDatatableSimple($db,$grid,$table, $primaryKey, $extraWhere);

        return $result;
    }

    function get_filtro_where($item){
        $where = "  g.distribuidor_id=".$_SESSION["userv"]["distribuidor_id"];
        if( isset($item["departamento"]) and trim($item["departamento"])!="" ){
            $where = "and g.departamento_id in (".$item["departamento"].")  ";
        }



        if( isset($item["filtro_gd_categoria"]) and trim($item["filtro_gd_categoria"])!="" ){
            if($where == ""){
                $where .= "  ";
            }else{
                $where .= " and ";
            }
            $where .= " g.gd_categoria_id in (".$item["filtro_gd_categoria"].")  ";
        }

        if( isset($item["filtro_gd_tipo_fuente_generacion"]) and trim($item["filtro_gd_tipo_fuente_generacion"])!="" ){
            if($where == ""){
                $where .= "  ";
            }else{
                $where .= " and ";
            }
            $where .= " g.gd_tipo_fuente_generacion_id in (".$item["filtro_gd_tipo_fuente_generacion"].")  ";
        }

        return $where;
    }


    function getItem($id,$item_id){
        $sql = "select * from ".$this->table[$this->objTable]." as p where p.id = '".$id."' and p.".$this->fkey_field." = '".$item_id."'";
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;
        return $item;
    }

}
