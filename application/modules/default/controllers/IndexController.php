<?php

class IndexController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $this->view->headTitle()->append('Bem vindo!');
        $this->_redirect('sistema/tarefa');
    }

}