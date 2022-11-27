<?PHP
namespace App\Plantagd\Module\Geovisor\Snippet\Reporte;
use Core\CoreResources;

class Index extends CoreResources {
    var $objTable = "distribuidor";
    function __construct()
    {
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();

    }

    function get_filtro_where($item){
        $where = "";
        if( isset($item["departamento"]) and trim($item["departamento"])!="" ){
            $where = " where g.departamento_id in (".$item["departamento"].")  ";
        }

        if( isset($item["filtro_gd_categoria"]) and trim($item["filtro_gd_categoria"])!="" ){
            if($where == ""){
                $where .= " where ";
            }else{
                $where .= " and ";
            }
            $where .= " g.gd_categoria_id in (".$item["filtro_gd_categoria"].")  ";
        }

        if( isset($item["filtro_gd_tipo_fuente_generacion"]) and trim($item["filtro_gd_tipo_fuente_generacion"])!="" ){
            if($where == ""){
                $where .= " where ";
            }else{
                $where .= " and ";
            }
            $where .= " g.gd_tipo_fuente_generacion_id in (".$item["filtro_gd_tipo_fuente_generacion"].")  ";
        }

        return $where;
    }

    public function getData($item){
        $wheregd = $this->get_filtro_where($item);
        $wheregd = str_replace("g.","g2.",$wheregd);

        if($wheregd != ""){
            $wheregd .= " and ";
        }else{
            $wheregd = " where ";
        }

        //print_struc($wheregd);

        $sql = "select d.name as departamento,g.*
                from(
                select g.departamento_id, count(g.departamento_id) as total
                , (select count(*) from gd as g2 ".$wheregd." g2.departamento_id = g.departamento_id and g2.gd_categoria_id=1) as nanogeneracion
                , (select count(*) from gd as g2 ".$wheregd." g2.departamento_id = g.departamento_id and g2.gd_categoria_id=2) as microgeneracion
                , (select count(*) from gd as g2 ".$wheregd." g2.departamento_id = g.departamento_id and g2.gd_categoria_id=3) as minigeneracion
                from gd as g ";

        $where = $this->get_filtro_where($item);
        if($where != ""){
            $sql .= " ".$where;
        }

        $sql .=" group by g.departamento_id) as g
                left join geo.departamento as d on d.id=g.departamento_id ";

        //print_struc($sql);exit;
        $info = $this->dbm->Execute($sql);
        $info = $info->getRows();


        foreach ($info as $clave => $row){
            $info[$clave]["fuente"] = $this->getFuenteGeneracion($row["departamento_id"],$item);
        }
        //print_struc($info);exit;
        return $info;
    }

    public function getFuenteGeneracion($id,$item){
        $wheregd = $this->get_filtro_where($item);
        $sql = "select fg.id ,fg.nombre ,\n ( select count(*) from gd as g ";
        if($wheregd != ""){
            $sql .= " ".$wheregd;
            $sql .= " and ";
        }else{
            $sql .= " where ";
        }
        $sql .= "g.departamento_id=".$id." 
                and g.gd_tipo_fuente_generacion_id = fg.id ) as total
                from ".$this->table["gd_tipo_fuente_generacion"]." as fg ";

        $info = $this->dbm->Execute($sql);
        $info = $info->getRows();
        return $info;
    }

    public function getFilter($filter){

        if($filter["filtro_gd_categoria"]==""){
            $cate["nanogeneracion"] = 1;
            $cate["microgeneracion"] = 1;
            $cate["minigeneracion"] = 1;
        }else{
            $cate["nanogeneracion"] = 0;
            $cate["microgeneracion"] = 0;
            $cate["minigeneracion"] = 0;

            $category =  explode(",",$filter["filtro_gd_categoria"]);
            foreach ($category as $item) {
                switch ($item){
                    case 1:$cate["nanogeneracion"]=1;break;
                    case 2:$cate["microgeneracion"]=1;break;
                    case 3:$cate["minigeneracion"]=1;break;
                }
            }

        }
        $res["cate"] = $cate;
        return $res;
    }

}