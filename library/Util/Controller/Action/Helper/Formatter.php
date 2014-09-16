<?php

class Util_Controller_Action_Helper_Formatter  extends 
    Zend_Controller_Action_Helper_Abstract
{
    public function formatarData($data, $format = 'yyyy-MM-dd') 
    {
        $date = new Zend_Date($data, null, 'pt_BR');
        return $date->toString($format);
    }
    
    public function dadosForSearch(array $dados)
    {
        foreach ($dados as $key => $value) {
            if (isset($value) && $value) {
                switch ($key) {        
                    case 'datanascimento':
                        $dados[$key] = $this->formatarData($value);
                    break;
                }
            } else {
                unset($dados[$key]);
            }
        }
        
        unset($dados['Pesquisar']);
        
        return $dados;
    }
    
    /* Formata as datas para serem colocadas na view */
    public function formatarDataView(array $dados, $key = 'datanascimento')
    {
        foreach ($dados as $i => $model){
                $dados[$i][$key] = $this
                        ->formatarData($model[$key],'dd/MM/yyyy');
        }
        
        return $dados;
    }
}
