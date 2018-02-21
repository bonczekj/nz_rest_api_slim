<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 21.02.2018
 * Time: 21:40
 */

class Ares
{
    /** @var string */
    private $ares_url = 'http://wwwinfo.mfcr.cz/cgi-bin/ares/ares_es.cgi?jazyk=cz&maxpoc=1&ico=';

    /** @var int */
    private $ic;

    /**
     *  @param int $ic IČ of subject
     */
    public function __construct ($ic)
    {
        $this->ic = (int) $ic;
    }

    /**
     *  @return array Data
     */
    public function getData () {
        $url = $this->ares_url . $this->ic;
        $xml = $this->getXML($url);
        if ($this->ic == $this->getIcFromXML($xml)) {
            return array (
                'name' => $this->getNameFromXML($xml),
                'address' => $this->getAddressFromXML($xml),
                //'ic' => $this->ic,
                'dic' => $this->getDicFromXML($xml),
                'type' => $this->getTypeFromXML($xml)
            );
        }
        return false;
    }

    /**
     * @param string $xml
     * @return string
     */
    private function getDicFromXML ($xml)
    {
        $pattern = '/dic=([0-9]*)<\/dtt:p_dph>/';
        preg_match($pattern, $xml, $matches);
        return isset($matches[1])?'CZ'.$matches[1]:false;
    }

    /**
     * @param string $xml
     * @return string
     */
    private function getTypeFromXML ($xml)
    {
        $pattern = '/([0-9]{3})<\/dtt:pf>/';
        preg_match($pattern, $xml, $matches);
        if (isset($matches[1])) {
            return ($matches[1]>=111)?'PO':'FO';
        }
        return false;
    }

    /**
     * @param string $xml
     * @return string
     */
    private function getIcFromXML ($xml)
    {
        $pattern = '/([0-9]*)<\/dtt:ico>/';
        preg_match($pattern, $xml, $matches);
        return isset($matches[1])?$matches[1]:false;
    }


    /**
     * @param string $xml
     * @return string
     */
    private function getAddressFromXML ($xml)
    {
        //$pattern = '/(.*)<\/dtt:ojm>/';
        $pattern = '/(.*)<\/dtt:jmn>/';
        preg_match($pattern, $xml, $matches);
        $result = isset($matches[1])?$matches[1]:false;
        preg_match("/>(.*)/", $result, $matches2);
        return isset($matches2[1])?$this->createNormalAddress($matches2[1]):false;
        //return isset($matches2[1])?$matches2[1]:false;
    }

    /**
     * @param string $xml
     * @return string
     */
    private function getNameFromXML ($xml)
    {
        //$pattern = '/(.*)<\/dtt:jmn>/';
        $pattern = '/(.*)<\/dtt:ojm>/';
        preg_match($pattern, $xml, $matches);
        //return isset($matches[1])?$matches[1]:false;
        $result = isset($matches[1])?$matches[1]:false;
        preg_match("/>(.*)/", $result, $matches2);
        return isset($matches2[1])?$matches2[1]:false;
    }

    /**
     * @param string $address
     * @return string
     */
    private function createNormalAddress ($address)
    {
        $address = explode(',', $address);
        krsort($address);
        return implode("\n", $address);
    }

    /**
     * @param string $url
     * @return string
     */
    private function getXML ($url) {
        return file_get_contents($url);
    }
}