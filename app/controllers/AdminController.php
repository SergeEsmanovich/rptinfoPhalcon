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
        $menu = Menu::findFirst(1);
        echo '</br></br></br></br></br></br><pre>';
        print_r($menu);
        echo '</pre>';
         $this->view->setVar("menu", $menu); 
    }
}
