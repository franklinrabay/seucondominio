<?php

class Sistema_TarefaController extends Zend_Controller_Action
{
    public function init()
    {
        $this->_dbTable    = new Sistema_Model_DbTable_Tarefa();
        $this->_comentario = new Sistema_Model_DbTable_Comentario();
    }
        
    public function indexAction()
    {
        $data = $this->_dbTable->fetchAll()->toArray();
        foreach ($data as $key => $d) {
            $data[$key]['comentarios'] = $this->_comentario->getComments($data[$key]['id']);
            $data[$key]['inicio'] = Util_Controller_Action_Helper_Formatter::formatarData($data[$key]['inicio'], 'dd/MM/yyyy');
            $data[$key]['conclusao'] = Util_Controller_Action_Helper_Formatter::formatarData($data[$key]['conclusao'], 'dd/MM/yyyy');
        }
        $this->view->data = $data;
    }        

    public function comentarioAction() 
    {
        $this->_helper->layout()->setLayout('layout-sem-menu');
        $post = $this->_request->getPost();

        if($this->_request->isPost()) {
            $post['usuario_id'] = 1;
            $post['data'] = Zend_Date::now()->toString('yyyy-MM-dd');
            $id = $this->_comentario->insert($post);
            $this->view->texto = $post['texto'];
            $this->view->data = Zend_Date::now()->toString('dd/MM/yyyy');
            $this->view->id = $id;
        }
    }
    public function listarAction()
    {
    }        
    
    public function cadastrarAction()
    {
        $post = $this->_request->getPost();
        if($this->_request->isPost()) {
            $post['inicio'] = Util_Controller_Action_Helper_Formatter::formatarData($post['inicio']);
            $post['conclusao'] = Util_Controller_Action_Helper_Formatter::formatarData($post['conclusao']);
            $post['imovel_id'] = 1;
            
            $this->_dbTable->insert($post);
        }
        $this->_helper->redirector('index');
    }        
    
    public function editarAction()
    {
        $id = $this->_request->getParam('id');
        
        if(!$id) {
            $this->_helper->redirector('index');
        } 
        
        $tarefa = $this->_dbTable->find($id)->current();
        
        if(!$tarefa) {
            $this->_helper->redirector('index');
        }
        
        $this->view->data = $tarefa->toArray();
        $this->view->id   = $id;
        
        if($this->_request->isPost()) 
        {
            $post = $this->_request->getPost();
            $post['inicio'] = Util_Controller_Action_Helper_Formatter::formatarData($post['inicio']);
            $post['conclusao'] = Util_Controller_Action_Helper_Formatter::formatarData($post['conclusao']);
            $this->_dbTable->update($post, ['id = ?' => $id]);
            $this->_helper->redirector('index');
        }

    }
    
    public function excluirAction() 
    {
        $id = $this->_request->getParam('id');
        
        if(!$id) {
            $this->_helper->redirector('index');
        } 
        
        $this->_comentario->delete(['tarefa_id = ?' => $id]);
        $this->_dbTable->delete(['id = ?' => $id]);
        $this->_helper->redirector('index');
        
    }
    
}
