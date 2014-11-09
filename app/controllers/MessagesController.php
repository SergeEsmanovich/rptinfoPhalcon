<?php

class MessagesController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Сообщения');
        parent::initialize();
    }

    public function indexAction()
    {
     //Тут возможно другой шаблон   
      $this->view->setTemplateAfter('def');
    }
} 
