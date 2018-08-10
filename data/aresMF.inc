<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 13.04.2018
 * Time: 19:18
 */

class aresMF
{
    private $ico = "";
    private $ares_ico_fin = "";
    private $ares_dic_fin = "";
    private $ares_firma_fin = "";
    private $ares_ulice_fin = "";
    private $ares_cp1_fin   = "";
    private $ares_cp2_fin   = "";
    private $ares_mesto_fin = "";
    private $ares_psc_fin   = "";
    private $ares_stav_fin = "";
    private $ares_adresa = "";

    /**
     *  @param int $ic IČ of subject
     */
    public function __construct ($ic)
    {
        $this->ico = $ic;
    }

    /**
     *  @return array Data
     */
    public function getData () {

        $file = @file_get_contents("http://wwwinfo.mfcr.cz/cgi-bin/ares/darv_bas.cgi?ico=".$this->ico);
        if($file){
            $xml = @simplexml_load_string($file);
        }

        if($xml)
        {
            $ns = $xml->getDocNamespaces();
            $data = $xml->children($ns['are']);
            $el = $data->children($ns['D'])->VBAS;

            if (strval($el->ICO) == $this->ico)
            {
                $this->ares_firma_fin = strval($el->OF);
                $this->ares_adresa = strval($el->AD->UC).', '.strval($el->AD->PB);
                $this->ares_dic_fin = strval($el->DIC);
                $this->ares_stav_fin  = 'IČ firmy bylo nalezeno';

                /*$ares_ico_fin = strval($el->ICO);
                $ares_dic_fin = strval($el->DIC);
                $ares_firma_fin = strval($el->OF);
                $ares_ulice_fin = strval($el->AA->NU);
                $ares_cp1_fin   = strval($el->AA->CD);
                $ares_cp2_fin   = strval($el->AA->CO);
                if($ares_cp2_fin != ""){ $ares_cp_fin = $ares_cp1_fin."/".$ares_cp2_fin; }else{ $ares_cp_fin = $ares_cp1_fin; }
                $ares_mesto_fin = strval($el->AA->N);
                $ares_psc_fin   = strval($el->AA->PSC);
                $ares_stav_fin = 1;*/
            }
            else
            {
                $this->ares_stav_fin  = 'IČ firmy nebylo nalezeno';
            }
        }
        else
        {
            $this->ares_stav_fin  = 'Databáze ARES není dostupná';
        }
        $address =  array (
            'name' => $this->ares_firma_fin,
            'address' => $this->ares_adresa,
            'dic' => $this->ares_dic_fin,
            //'type' => $this->getTypeFromXML($xml),
            'status'  => $this->ares_stav_fin,
            'server_name'  => $_SERVER['SERVER_NAME'],
            'aresfile' => $file,
            'aresurl' => "http://wwwinfo.mfcr.cz/cgi-bin/ares/darv_bas.cgi?ico=".$this->ico,
        );
        return $address;
    }






}