<?PHP
namespace App\Distribuidor\Module\Geovisor\Snippet\Index;
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
        $extraWhere = "";
        $groupBy = "";
        $having = "";
        /**
         * Result of the query sent
         */
        $result = $this->getGridDatatableSimple($db,$grid,$table, $primaryKey, $extraWhere);

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

    function get_filtro_where($item){
        $where = " where g.distribuidor_id=".$_SESSION["userv"]["distribuidor_id"];
        if( isset($item["departamento"]) and trim($item["departamento"])!="" ){
            $where = "and g.departamento_id in (".$item["departamento"].")  ";
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

    function getPoint($filter){

        //print_struc($this->table);
        $sql = "select 
                tc.nombre as tipo_conexion
                ,c.nombre as categoria_nombre
                ,fg.nombre  as tipo_fuente_generacion
                ,g.* from ".$this->table["gd"]." as g 
                left join ".$this->table["gd_tipo_conexion"]." as tc on tc.id=g.gd_tipo_conexion_id
                left join ".$this->table["gd_categoria"]." as c on c.id=g.gd_categoria_id
                left join ".$this->table["gd_tipo_fuente_generacion"]." as fg on fg.id=g.gd_tipo_fuente_generacion_id
        ";

        $where = $this->get_filtro_where($filter);

        if($where != ""){
            $sql .= " ".$where;
        }

        /*
        print_struc($filter);
        print_struc($where);
        print_struc($sql);
        exit;
        */
        $info = $this->dbm->Execute($sql);
        $dato = $info->getRows();

        $res = array();
        $res["type"] = "FeatureCollection";

        foreach ($dato as $row){

            unset($row["geom"]);
            unset($row["created_at"]);
            unset($row["updated_at"]);

            unset($row["user_create"]);
            unset($row["user_update"]);


            unset($row["medicion_tipo"]);
            unset($row["medidor_numero_consumo_regulado"]);
            unset($row["medidor_numero_gd"]);
            unset($row["nombre_generador_distribuido"]);
            unset($row["clasificacion_gd"]);
            unset($row["calidad_id"]);
            unset($row["suministro_consumo_nivel"]);
            unset($row["medicion_punto"]);

            unset($row["gd_tipo_conexion_id_gd"]);
            unset($row["potencia_maxima_generada"]);
            unset($row["aerogeneradores_cantidad"]);
            unset($row["fotovoltaicos_cantidad"]);
            unset($row["inversores_cantidad"]);
            unset($row["inversores_potencia_nominal"]);
            unset($row["inversores_marca"]);
            unset($row["superficie_instalacion"]);
            unset($row["fecha_puesta_gd"]);
            unset($row["factor_planta"]);

            unset($row["location_latitude"]);
            unset($row["location_longitude"]);
            unset($row["location_utm_north"]);
            unset($row["location_utm_east"]);
            unset($row["location_utm_zone"]);
            unset($row["location_utm_hemisphere"]);
            unset($row["location_altitude"]);


            $row["fecha"] = date_format(date_create($row["fecha"]),"d/m/Y");


            $item["geometry"]["type"] = "Point";
            $item["geometry"]["coordinates"] = array($row["location_longitude_decimal"],$row["location_latitude_decimal"]);
            $item["type"]="Feature";
            $item["id"]=$row["id"];
            $item["properties"]=$row;

            $res["features"][]=$item;

            //print_struc($res["features"]);
            //exit;
        }

        if(!isset($res["features"])){
            $res["features"][]="";
        }
        return $res;
    }

    function getSummary($item=""){

        $sql = "select 
                g.gd_categoria_id, count(*) as total
                from ".$this->table["gd"]." as g
                ";
        $where = $this->get_filtro_where($item);
        $sql .= $where;
        $sql .= " group by g.gd_categoria_id";


        $info = $this->dbm->Execute($sql);
        $info = $info->getRows();

        $res = array();
        $total = 0;
        foreach ($info as $row){
            $total = $total + $row["total"];
            switch ($row["gd_categoria_id"]){
                case 1:
                    $res["nanogeneracion"] = round($row["total"],0);
                    break;
                case 2:
                    $res["microgeneracion"] = round($row["total"],0);
                    break;
                case 3:
                    $res["minigeneracion"] = round($row["total"],0);
                    break;
            }
        }

        if(!isset($res["nanogeneracion"])) $res["nanogeneracion"]=0;
        if(!isset($res["microgeneracion"])) $res["microgeneracion"]=0;
        if(!isset($res["minigeneracion"])) $res["minigeneracion"]=0;

        $res["total"] = round($total,0);
        return $res;
    }
}