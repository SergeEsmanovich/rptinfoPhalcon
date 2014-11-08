<?php
class Controllers extends Phalcon\Mvc\Model
{
   public $id;
   public $name;
   public function initialize()
    {
        $this->hasMany("id", "Menu", "controller_id");
    }
}
