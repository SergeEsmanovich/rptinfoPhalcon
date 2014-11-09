<?php

class EventsController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Сообщения');
        parent::initialize();
    }

    public function indexAction()
    {
     $this->view->setTemplateAfter('def');
    }
    
     public function stockAction()
    {
     $this->view->setTemplateAfter('def');
    }
    
      public function webinarsAction()
    {
     $this->view->setTemplateAfter('def');
    }
    
} 
