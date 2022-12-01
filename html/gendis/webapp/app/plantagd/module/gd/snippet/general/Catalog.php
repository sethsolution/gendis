<?PHP
namespace App\Plantagd\Gd\General;
use Core\CoreResources;

class Catalog extends CoreResources{

    function __construct(){
        /**
         * Inicializamos todas las librerias y variables para el submodulo
         */
        $this->appInit();
    }

    public function confCatalog(){
        $this->addCatalogList($this->table["gd_tipo_conexion"]
            ,"gd_tipo_conexion","","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["gd_tipo_fuente_generacion"]
            ,"gd_tipo_fuente_generacion","","nombre",""
            ,"nombre","","","");


        $this->addCatalogList($this->table["gd_categoria"]
            ,"gd_categoria","","nombre",""
            ,"nombre","","","");


        $this->addCatalogList($this->table["gd_tipo_transformacion"]
            ,"gd_tipo_transformacion","","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["distribuidor"]
            ,"distribuidor","","CONCAT(ciae,' | ', nombre) as name",""
            ,"nombre","","", true);
    }

    /*
    public function getGroupOptions(){
        $sql = "select 
                g2.name as padre_name ,g.id, g.name
                
                from ".$this->table["group"]." as g
                left join ".$this->table["group"]." as g2 on g2.id = g.parent
                where g.parent is not null
                order by g.parent, g.name
                ";

        $item = $this->dbm->Execute($sql)->GetRows();
        $res = array();
        foreach ($item as $row){
            $res[$row["padre_name"]] [$row["id"]] = $row["name"];
        }

        return $res;
    }
    public function getTypeOption(){
        global $smarty;
        $dato = array();
        $dato["app"] = $smarty->config_vars["OptApp"];
        $dato["url"] = $smarty->config_vars["OptUrl"];
        return $dato;
    }
    */
}