<?php

use Phalcon\Mvc\Model;

class Modules extends Model {
public $type;
public $name;
public $secyrity;
public $params;
public $alias;
   
public function initialize()
    {
        $this->hasMany("id", "Menu", "modul_id");
    }
}
