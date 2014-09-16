<?php

class Application_View_Helper_FlashMessages extends Zend_View_Helper_Abstract
{
	public function flashMessages()
	{
		$messages = array_merge(
			Zend_Controller_Action_HelperBroker::getStaticHelper('FlashMessenger')->getMessages(),
			Zend_Controller_Action_HelperBroker::getStaticHelper('FlashMessenger')->getCurrentMessages()
		);
		$messages = array_unique($messages);
		
		$output = '';
		
		if (!empty($messages)) {
			foreach ($messages as $key => $message) {
				$output .= '<div class="alert">' 
                         . '<button type="button" class="close" ' 
                         . 'data-dismiss="alert">&times;</button>'
                         . $message . '</div>';
			}
		}

		Zend_Controller_Action_HelperBroker::getStaticHelper('FlashMessenger')->clearCurrentMessages();
		Zend_Controller_Action_HelperBroker::getStaticHelper('FlashMessenger')->clearMessages();
		
		return $output;
	}
}