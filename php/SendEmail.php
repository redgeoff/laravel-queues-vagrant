<?php

namespace App\Jobs;

use App\Jobs\Job;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Person;

class SendEmail extends Job implements ShouldQueue
{
  use InteractsWithQueue;

  /**
   * Create a new job instance.
   *
   * @return void
   */
  public function __construct(Person $person)
  {
    $this->person = $person;
  }

  protected function appendToFile($str) {
    echo "$str\n\n"; // just for debug
    file_put_contents('/vagrant/app/mylog.txt', date('c') . ": $str\n", FILE_APPEND);
  }

  /**
   * Execute the job.
   *
   * @return void
   */
  public function handle()
  {
    // Replace this line with the actual call to send the email or do whatever else you want. We
    // are only writing to a log file here as it provides an easy example.
    $this->appendToFile("Sending an email to {$this->person->name}");
  }
}
