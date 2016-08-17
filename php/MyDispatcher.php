<?php

namespace App;

use Illuminate\Foundation\Bus\DispatchesJobs;
use App\Jobs\SendEmail;
use App\Person;


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

  // Can't name "dispatch" as this will cause problems
  public function schedule() {
    $this->dispatch(new SendEmail(new Person('Superman')));
  }
}

$dispatcher = new MyDispatcher();
$dispatcher->schedule();
