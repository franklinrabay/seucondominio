<?php

class Sistema_Model_VendaProduto extends Zend_Db_Table_Row_Abstract
{
    public function __get($var)
    {
        if($var == 'id') {
            return $this->getId();
        }
        
        return parent::__get($var);
    }    
    public function getProdutosVenda($id_venda)
    {
        $dbTable = new Sistema_Model_DbTable_VendaProduto();
        
        $select = $dbTable->selectProdutoVenda();
        $select->where('venda.id_venda = ?',$id_venda);
        
        $produtos = $dbTable->fetchAll($select)->toArray();
        
        return $produtos;
    }
}
