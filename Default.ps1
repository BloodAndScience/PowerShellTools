function codeD {

    Start-Job { code $args[0] } -ArgumentList (gl) 

}

clear