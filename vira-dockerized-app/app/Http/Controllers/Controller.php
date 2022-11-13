<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Symfony\Component\Console\Output\ConsoleOutput as OutputConsoleOutput;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function index(){
        $user_mdl = new User();
        $console = new OutputConsoleOutput();
        $console->writeln('<info>hello</info>');
        return 'vira_api';
    }
}
