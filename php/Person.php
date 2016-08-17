<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Person extends Model
{
  public $name;

  public function __construct($name) {
    $this->name = $name;
  }
}
