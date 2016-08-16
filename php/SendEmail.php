<?php

namespace App\Jobs;

use App\Jobs\Job;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendEmail extends Job implements ShouldQueue
{
    use InteractsWithQueue, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
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
      $this->appendToFile('simulating the sending of an email by writing to a log instead');
    }
}
