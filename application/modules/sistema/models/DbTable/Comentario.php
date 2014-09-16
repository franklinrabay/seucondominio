<?php
class Sistema_Model_DbTable_Comentario extends Zend_Db_Table
{
    protected $_name = 'tb_tarefa_mensagem';
    protected $_primary = 'id';    
    
    public function getComments($tarefa_id) 
    {
        $sql = $this->select()->from('tb_tarefa_mensagem')
                ->where('tarefa_id = ?', $tarefa_id);
        
        return $this->getDefaultAdapter()->fetchAll($sql);
    }
}
