<?php

class PubsController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Публикации');
        parent::initialize();
    }

    public function indexAction()
    {
     $this->view->setTemplateAfter('def');
    }
     public function add_articleAction()
    {
     $this->view->setTemplateAfter('def');
    }
} 
