<?php

class ProfilController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Профиль');
        parent::initialize();
    }

    public function indexAction()
    {
     $this->view->setTemplateAfter('def');
    }
    
    public function educationAction()
    {
     $this->view->setTemplateAfter('def');
    }
    
    public function contactsAction()
    {
     $this->view->setTemplateAfter('def');
    }
    
    public function securityAction()
    {
     $this->view->setTemplateAfter('def');
    }
    
  
    
} 
