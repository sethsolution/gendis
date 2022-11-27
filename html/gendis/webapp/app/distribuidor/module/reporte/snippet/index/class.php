<?PHP
// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {
    //Page header
    public function Header() {
        // get the current page break margin
        $bMargin = $this->getBreakMargin();
        // get current auto-page-break mode
        $auto_page_break = $this->AutoPageBreak;
        // disable auto-page-break
        $this->SetAutoPageBreak(false, 0);
        // set bacground image
        //echo K_PATH_IMAGES;exit;
        //$img_file = K_PATH_IMAGES.'image_demo.jpg';
        $img_file = '';
        $this->Image($img_file, 0, 0, 210, 297, '', '', '', false, 300, '', false, false, 0);
        // restore auto-page-break status
        $this->SetAutoPageBreak($auto_page_break, $bMargin);
        // set the starting point for the page content
        $this->setPageMark();
    }
}

class Index extends Table {
    var $objTable = "distribuidor_reporte";
    var $objTable2 = "distribuidor_totalmes";
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
            $sqlWhere = ' i.id='.$idItem." and i.distribuidor_id=".$_SESSION["userv"]["distribuidor_id"];
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

    function getItemMes($idItem, $mes,$anio){
        

        $info = '';
        
        if($idItem!=''){
            $sqlSelect = ' k.*';
            $sqlFrom = ' public.distribuidor_totalmes k ';
            $sqlWhere = " k.distribuidor_id=".$_SESSION["userv"]["distribuidor_id"].' and anio='.$anio.' and mes='.$mes;
            $sqlGroup = ' ';

            $sql = 'SELECT '.$sqlSelect.'
                  FROM '.$sqlFrom.'
                  WHERE '.$sqlWhere.'
                  '.$sqlGroup;

            $info = $this->dbm->Execute($sql);
            // $info = $info->fields;


        }
        $resultset = array();
        $i=0;
        foreach($info as $row) {
            $resultset[$i] = $row;
            $i++;
        }
        return $resultset;
    }


    public function getItemDatatableRows($filter){
        global $dbSetting;
        $table = $this->table[$this->objTable];
        $primaryKey = 'id';
        $grid = "item";
        $db=$dbSetting[0];
        /**
         * Additional configuration
         */
        /**
         * Additional configuration - filtro de mes
         */
        $where = "";
        if( isset($filter["month"])){
            $where = "i.mes = ".$filter["month"];
        }
        if($where !=""){
            $where .= " and ";
        }
        /**
         * fin filtro
         */

        //print_struc($_SESSION["userv"]);
        $extraWhere = $where." i.distribuidor_id=".$_SESSION["userv"]["distribuidor_id"];
        $groupBy = "";
        $having = "";
        /**
         * Result of the query sent
         */
        $result = $this->getGridDatatableSimple($db,$grid,$table, $primaryKey, $extraWhere);
        foreach ($result['data'] as $itemId => $valor) {
            $result['data'][$itemId]['created_at'] = $this->changeDataFormat($result['data'][$itemId]['created_at'],"d/m/Y H:i:s");
            $result['data'][$itemId]['updated_at'] = $this->changeDataFormat($result['data'][$itemId]['updated_at'],"d/m/Y H:i:s");
            $result['data'][$itemId]['fecha_envio'] = $this->changeDataFormat($result['data'][$itemId]['fecha_envio'],"d/m/Y H:i:s");
            $result['data'][$itemId]['fecha_observacion'] = $this->changeDataFormat($result['data'][$itemId]['fecha_observacion'],"d/m/Y H:i:s");
            $result['data'][$itemId]['fecha_aprobacion'] = $this->changeDataFormat($result['data'][$itemId]['fecha_aprobacion'],"d/m/Y H:i:s");

        }

        $result["recordsTotal"]=$result["recordsFiltered"];

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
        $where = " distribuidor_id=".$_SESSION["userv"]["distribuidor_id"];
        $res = $this->deleteItem($id,$field_id,$this->table[$this->objTable],$where);
        return $res;
    }
    function enviar_reporte($itemId, $action){
        $form="module";

        $rec=array();
        $rec["estado_id"] = 2;
        $rec["dateUpdate"] = date("Y-m-d H:i:s");
        $rec["fecha_envio"] = date("Y-m-d H:i:s");
        /**
         * Save processed data
         */
        $field_id="id";

        $where = " distribuidor_id=".$_SESSION["userv"]["distribuidor_id"];
        $res = $this->updateItem($itemId,$rec ,$this->table[$this->objTable],$action,$field_id,$where);

        $res["accion"] = $action;
        return $res;
    }

    function imprimir_reporte($id){

        $item = $this->getItem($id);
        $item_pot = $this->getItemMes($id,$item['mes'],$item['anio']);
        // print_r($item_pot[0]['mes']);die;
        // create new PDF document
        $pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
        // set document information
        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetAuthor('Cites Bolivia - NO OFICIAL');
        $pdf->SetTitle('Permiso / Certificado CITE');
        $pdf->SetSubject('TCPDF Tutorial');
        $pdf->SetKeywords('CITES,Bolivia');

        // set header and footer fonts
        $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));

        // set default monospaced font
        $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

        // set margins
        $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
        $pdf->SetHeaderMargin(0);
        $pdf->SetFooterMargin(0);
        // remove default footer
        $pdf->setPrintFooter(false);

        // set auto page breaks
        $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

        // set image scale factor
        $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

        // set some language-dependent strings (optional)
        if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
            require_once(dirname(__FILE__).'/lang/eng.php');
            $pdf->setLanguageArray($l);
        }

        // ---------------------------------------------------------
        // set font
        //$pdf->SetFont('times', '', 48);
        $pdf->SetFont('helvetica', 'B', 12);
        // add a page
        $pdf->AddPage();

        /**
         * TITULO
         */
        $border = 0;

        $txt = "Anexo Nº 1";
        $pdf->MultiCell(150, 0, $txt, $border, 'C', 0, 1, '19', 20, true, 0, false, true, 0);

        $pdf->SetFont('helvetica', 'B', 11);
        $txt = "Contenido minimo del informe a ser remitido al Ente Regulador";
        $pdf->MultiCell(160, 0, $txt, $border, 'C', 0, 1, '19', 30, true, 0, false, true, 0);

        /**
         * 1. antecendetes
         */
        $pdf->SetFont('helvetica', 'B', 10);
        $txt = "a) ANTECEDENTES";
        $pdf->MultiCell(40, 0, $txt, $border, 'C', 0, 1, '15', 50, true, 0, false, true, 0);
        $pdf->SetFont('helvetica', '', 9);
        $txt =  $item["antecedentes"]."\n";
        $pdf->MultiCell(160, 21, $txt, 0, 'L', 0, 1, '12', '57', true, 1, true, true, 21);

        /**
         * 2. descripcion
         */
        $pdf->SetFont('helvetica', 'B', 10);
        $txt = "b) DESCRIPCIÓN";
        $pdf->MultiCell(40, 0, $txt, $border, 'C', 0, 1, '15', 85, true, 0, false, true, 0);
        $pdf->SetFont('helvetica', '', 9);
        $txt =  $item["descripcion"]."\n";
        $pdf->MultiCell(160, 21, $txt, 0, 'L', 0, 1, '12', '92', true, 1, true, true, 21);

        /**
         * tabla resumen
         */
        $pdf->SetFont('helvetica', 'B', 10);
        $txt = "TABLA RESUMEN";
        $pdf->MultiCell(160, 0, $txt, $border, 'C', 0, 1, '19', 115, true, 0, false, true, 0);


        $pdf->SetFont('helvetica', '', 9);
        $txt =  "Mes";
        $pdf->MultiCell(10, 12, $txt, 1, 'C', 0, 1, '15', '123', true, 1, false, true, 21);
        $txt =  "Año";
        $pdf->MultiCell(10, 12, $txt, 1, 'C', 0, 1, '25', '123', true, 1, false, true, 21);
        $txt =  "Categoria";
        $pdf->MultiCell(20, 12, $txt, 1, 'C', 0, 1, '35', '123', true, 1, false, true, 21);
        $txt =  "Nro de generadores distribuidos";
        $pdf->MultiCell(20, 12, $txt, 1, 'C', 0, 1, '55', '123', true, 1, false, true, 21);
        $txt =  "Energia Generada";
        $pdf->MultiCell(17, 12, $txt, 1, 'C', 0, 1, '75', '123', true, 1, false, true, 21);
        $txt =  "Energia Autoconsumida";
        $pdf->MultiCell(20, 12, $txt, 1, 'C', 0, 1, '92', '123', true, 1, false, true, 21);
        $txt =  "Energia Inyectada";
        $pdf->MultiCell(16, 12, $txt, 1, 'C', 0, 1, '112', '123', true, 1, false, true, 21);
        $txt =  "Energia No Compensada Mensual";
        $pdf->MultiCell(20, 12, $txt, 1, 'C', 0, 1, '128', '123', true, 1, false, true, 21);
        $txt =  "Energia No Compensada Total";
        $pdf->MultiCell(20, 12, $txt, 1, 'C', 0, 1, '148', '123', true, 1, false, true, 21);
        $txt =  "Importe por Energia Inyectada";
        $pdf->MultiCell(20, 12, $txt, 1, 'C', 0, 1, '168', '123', true, 1, false, true, 21);
        # Mes
        $txt =  "\n".$item_pot[0]["mes"]."\n";
        $pdf->MultiCell(10, 10, $txt, 1, 'C', 0, 1, '15', '135', true, 1, false, true, 22);
        # Anio
        $txt =  "\n".$item_pot[0]["anio"]."\n";
        $pdf->MultiCell(10, 10, $txt, 1, 'C', 0, 1, '25', '135', true, 1, false, true, 22);
        # Categoria
        $txt =  "\n".$item_pot[0]["gd_categoria_id"]."\n";
        $pdf->MultiCell(20, 10, $txt, 1, 'C', 0, 1, '35', '135', true, 1, false, true, 22);
        # No de GD
        $txt =  "\n".$item_pot[0]["numero_gd"]."\n";
        $pdf->MultiCell(20, 10, $txt, 1, 'C', 0, 1, '55', '135', true, 1, false, true, 22);
        # Energia generada
        $txt =  "\n".$item_pot[0]["energia_generada"]."\n";
        $pdf->MultiCell(17, 10, $txt, 1, 'C', 0, 1, '75', '135', true, 1, false, true, 22);
        # Energia Autoconsumida
        $txt =  "\n".$item_pot[0]["energia_autoconsumida"]."\n";
        $pdf->MultiCell(20, 10, $txt, 1, 'C', 0, 1, '92', '135', true, 1, false, true, 22);
        # Energia Inyectada
        $txt =  "\n".$item_pot[0]["energia_inyectada"]."\n";
        $pdf->MultiCell(16, 10, $txt, 1, 'C', 0, 1, '112', '135', true, 1, false, true, 22);
        # Energia no compensada mensual
        $txt =  "\n".$item_pot[0]["energia_nocompensada_mensual"]."\n";
        $pdf->MultiCell(20, 10, $txt, 1, 'C', 0, 1, '128', '135', true, 1, false, true, 22);
        # Energia no compensada total
        $txt =  "\n".$item_pot[0]["energia_nocompensada_total"]."\n";
        $pdf->MultiCell(20, 10, $txt, 1, 'C', 0, 1, '148', '135', true, 1, false, true, 22);
        # Importe energia inyectada
        $txt =  "\n".$item_pot[0]["importe_inyectada"]."\n";
        $pdf->MultiCell(20, 10, $txt, 1, 'C', 0, 1, '168', '135', true, 1, false, true, 22);
        ### fila 2
        # Mes
        $txt =  "\n".$item_pot[1]["mes"]."\n";
        $pdf->MultiCell(10, 10, $txt, 1, 'C', 0, 1, '15', '145', true, 1, false, true, 22);
        # Anio
        $txt =  "\n".$item_pot[1]["anio"]."\n";
        $pdf->MultiCell(10, 10, $txt, 1, 'C', 0, 1, '25', '145', true, 1, false, true, 22);
        # Categoria
        $txt =  "\n".$item_pot[1]["gd_categoria_id"]."\n";
        $pdf->MultiCell(20, 10, $txt, 1, 'C', 0, 1, '35', '145', true, 1, false, true, 22);
        # No de GD
        $txt =  "\n".$item_pot[1]["numero_gd"]."\n";
        $pdf->MultiCell(20, 10, $txt, 1, 'C', 0, 1, '55', '145', true, 1, false, true, 22);
        # Energia generada
        $txt =  "\n".$item_pot[1]["energia_generada"]."\n";
        $pdf->MultiCell(17, 10, $txt, 1, 'C', 0, 1, '75', '145', true, 1, false, true, 22);
        # Energia Autoconsumida
        $txt =  "\n".$item_pot[1]["energia_autoconsumida"]."\n";
        $pdf->MultiCell(20, 10, $txt, 1, 'C', 0, 1, '92', '145', true, 1, false, true, 22);
        # Energia Inyectada
        $txt =  "\n".$item_pot[1]["energia_inyectada"]."\n";
        $pdf->MultiCell(16, 10, $txt, 1, 'C', 0, 1, '112', '145', true, 1, false, true, 22);
        # Energia no compensada mensual
        $txt =  "\n".$item_pot[1]["energia_nocompensada_mensual"]."\n";
        $pdf->MultiCell(20, 10, $txt, 1, 'C', 0, 1, '128', '145', true, 1, false, true, 22);
        # Energia no compensada total
        $txt =  "\n".$item_pot[1]["energia_nocompensada_total"]."\n";
        $pdf->MultiCell(20, 10, $txt, 1, 'C', 0, 1, '148', '145', true, 1, false, true, 22);
        # Importe energia inyectada
        $txt =  "\n".$item_pot[1]["importe_inyectada"]."\n";
        $pdf->MultiCell(20, 10, $txt, 1, 'C', 0, 1, '168', '145', true, 1, false, true, 22);
        ### Fila 3
        # Mes
        $txt =  "\n".$item_pot[2]["mes"]."\n";
        $pdf->MultiCell(10, 10, $txt, 1, 'C', 0, 1, '15', '155', true, 1, false, true, 22);
        # Anio
        $txt =  "\n".$item_pot[2]["anio"]."\n";
        $pdf->MultiCell(10, 10, $txt, 1, 'C', 0, 1, '25', '155', true, 1, false, true, 22);
        # Categoria
        $txt =  "\n".$item_pot[2]["gd_categoria_id"]."\n";
        $pdf->MultiCell(20, 10, $txt, 1, 'C', 0, 1, '35', '155', true, 1, false, true, 22);
        # No de GD
        $txt =  "\n".$item_pot[2]["numero_gd"]."\n";
        $pdf->MultiCell(20, 10, $txt, 1, 'C', 0, 1, '55', '155', true, 1, false, true, 22);
        # Energia generada
        $txt =  "\n".$item_pot[2]["energia_generada"]."\n";
        $pdf->MultiCell(17, 10, $txt, 1, 'C', 0, 1, '75', '155', true, 1, false, true, 22);
        # Energia Autoconsumida
        $txt =  "\n".$item_pot[2]["energia_autoconsumida"]."\n";
        $pdf->MultiCell(20, 10, $txt, 1, 'C', 0, 1, '92', '155', true, 1, false, true, 22);
        # Energia Inyectada
        $txt =  "\n".$item_pot[2]["energia_inyectada"]."\n";
        $pdf->MultiCell(16, 10, $txt, 1, 'C', 0, 1, '112', '155', true, 1, false, true, 22);
        # Energia no compensada mensual
        $txt =  "\n".$item_pot[2]["energia_nocompensada_mensual"]."\n";
        $pdf->MultiCell(20, 10, $txt, 1, 'C', 0, 1, '128', '155', true, 1, false, true, 22);
        # Energia no compensada total
        $txt =  "\n".$item_pot[2]["energia_nocompensada_total"]."\n";
        $pdf->MultiCell(20, 10, $txt, 1, 'C', 0, 1, '148', '155', true, 1, false, true, 22);
        # Importe energia inyectada
        $txt =  "\n".$item_pot[2]["importe_inyectada"]."\n";
        $pdf->MultiCell(20, 10, $txt, 1, 'C', 0, 1, '168', '155', true, 1, false, true, 22);
        /**
         * 3. observaciones
         */
        $pdf->SetFont('helvetica', 'B', 10);
        $txt = "c) OBSERVACIONES";
        $pdf->MultiCell(40, 0, $txt, $border, 'C', 0, 1, '15', 170, true, 0, false, true, 0);
        $pdf->SetFont('helvetica', '', 9);
        $txt =  $item["observaciones"]."\n";
        $pdf->MultiCell(160, 21, $txt, 0, 'L', 0, 1, '12', '177', true, 1, true, true, 21);

        /**
         * 4. COnclusiones
         */
        $pdf->SetFont('helvetica', 'B', 10);
        $txt = "d) CONCLUSIONES";
        $pdf->MultiCell(40, 0, $txt, $border, 'C', 0, 1, '15', 205, true, 0, false, true, 0);
        $pdf->SetFont('helvetica', '', 9);
        $txt =  $item["conclusiones"]."\n";
        $pdf->MultiCell(160, 21, $txt, 0, 'L', 0, 1, '12', '212', true, 1, true, true, 21);




// ---------------------------------------------------------

//Close and output PDF document
        $pdf->Output('example_051.pdf', 'I');
        exit;
    }
}
