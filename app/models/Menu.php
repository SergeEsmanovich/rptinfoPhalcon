<?php
class Menu extends Phalcon\Mvc\Model
{
   public $id;
   public $caption;
   public $action;
   public $controller;
   public $name;
    public function initialize()
    {
        $this->belongsTo("controller", "Controllers", "id");
    }
}
