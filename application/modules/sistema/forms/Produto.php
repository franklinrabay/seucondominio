<?php 

class Sistema_Form_Produto extends Zend_Form
{
    public function init() 
    {
        $this->setAttrib('id', __CLASS__);
        
        $this->addElement('hidden', 'id_produto',array(
            'decorators' => array('viewHelper')
        ));
        
        $this->addElement('text', 'nome', array(
            'label'      => 'Nome',
            'filters'    => array('StringTrim','StripTags'),
            'class'      => 'input-xxlarge',
            'validators' => array(
                array('Alnum', true, 
                  array('allowWhiteSpace' => true)
                ),
                array('StringLength', true, 
                    array(
                        'min' => 2,
                        'max' => 100
                    )
                )
            ),
            'maxlength' => 100,    
            'required' => true,    
        ));
        
        
        $this->addElement('text', 'descricao', array(
                'label'       => 'Descricao',
                'class'       => 'input-xxlarge',
                'required'    => false
            )
        );
        
        $this->addElement('text', 'preco', array(
                'label'       => 'Preço(R$)',
                'class'       => 'input-xxsmall valor',
                'required' => true
            )
        );

        $this->addElement('submit', 'Cadastrar', array(
                'class' => 'btn btn-info'
            )
        );        
    }
 
    public function populate(array $dados)
    {
        $this->getElement('Cadastrar')->setName('Editar');
        
        if (isset($dados['preco']) && $dados['preco']) {
            $dados['preco'] = number_format($dados['preco'],2,',','.');
            $dados['preco'] = str_replace('.','',$dados['preco']);
        }
        return parent::populate($dados);
    }
    
    public function persistData()
    {
        $dados = $this->formatarDados($this->getValues());        
    
        $dbProduto = new Sistema_Model_DbTable_Produto();

        if($dados) {
            $produto = isset($dados['id_produto']) && $dados['id_produto'] 
                    ? $dbProduto->find($dados['id_produto'])->current()
                    : $dbProduto->createRow();
            
            $produto->setFromArray($dados);

            return $produto->save();
        }        
    }
    
    private function formatarDados(array $dados)
    {
        if ($dados['preco']) {
            $dados['preco'] = str_replace(['.',','],['','.'],$dados['preco']);
        }
        
        return $dados;
    }
}


