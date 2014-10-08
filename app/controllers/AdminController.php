<?php

class AdminController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Admin');
        parent::initialize();
    }

    public function indexAction()
    {
      //$this->view->setVar("menu", $menu); 
    }
}
