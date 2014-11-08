<?php

class NewsController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Лента новостей');
        parent::initialize();
    }

    public function indexAction()
    {
    $this->view->setTemplateAfter('def');
    }
} 
