<?php

namespace App;

use Illuminate\Foundation\Bus\DispatchesJobs;
use App\Jobs\SendEmail;


////////// Boot Laravel //////////

require_once('/vagrant/app/blog/bootstrap/autoload.php');
$app = require_once('/vagrant/app/blog/bootstrap/app.php');

// Boot Laravel
$app->boot();
$kernel = $app->make('Illuminate\Contracts\Http\Kernel');
$response = $kernel->handle(
  $request = \Illuminate\Http\Request::capture()
);


////////// Dispatch //////////

class MyDispatcher
{
  use DispatchesJobs;

  public function dispatch() {
    $this->dispatch(new SendEmail());
  }
}

$dispatcher = new MyDispatcher();
$dispatcher->dispatch();
