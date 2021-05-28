function codeD {

    Start-Job { code $args[0] } -ArgumentList (gl) 

}


$path = "B:\Lib\Proj\PS\"
.$path"YT-Loader\YTTools.ps1"

$todo = "B:\Res\Data\todo"
$pls =  "B:\Res\AppData\Roaming\AIMP\PLS"

Set-Variable -name DONE_FILE -value $todo'done.txt'
Set-Variable -name TODO_FILE -value $todo'\todo.txt'
Set-Variable -name pTodo -value $todo'\personal.txt'

Set-Variable -name DirVideos -value '\\home-server\Lib\Videos'
Set-Alias -name t -value todo
cls
