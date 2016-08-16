# laravel-queues-vagrant

A quick way to get a test environment with Laravel Queues working. This environment uses MySQL as the underlying database, but you can easily change it to use another Laravel supported DB. The default MySQL user is `root` and the password is `secret`.

This project sets up a new Laravel project named blog.

This project uses an non-Laravel script, MyDispatcher to demonstrate how the dispatcher can be called from an external PHP script. You can however use the dispatcher from a Laravel controller, command or other standard Laravel construct.

See https://laravel.com/docs/5.2/queues for more info about Laravel Queues.


Install Vagrant, VirtualBox and git
---

    http://www.vagrantup.com
    https://www.virtualbox.org (don't worry about setting up any VMs as the steps below will cover this)
    http://git-scm.com


Set Up
---

    $ git clone https://github.com/redgeoff/laravel-queues-vagrant.git
    $ cd laravel-queues-vagrant
    $ vagrant up
    $ vagrant ssh


Dispatching Jobs
---

    $ php /vagrant/MyDispatcher.php # schedules a job

This Vagrant config sets up Supervisor which will run 8 processes to execute your jobs. Note: Supervisor automatically restarts are a system reboot.
