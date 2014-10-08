<?php

class TestController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('tets');
        parent::initialize();
    }

    public function indexAction()
    {
       // $this->view->disable();
        $out['test']='korolariya';
      echo json_encode($out);
        
    }
      public function testAction()
    {
          
    }
       public function ajaxAction()
    {
           $this->view->disable();
      $out['test']='korolariya';
      echo json_encode($out);
    }
}
