cls

function codeD {
Start-Job { code $args[0] } -ArgumentList (gl) 

}

function unityD {
	Unity -projectPath $(gl)
}

function unityC {

	Unity -createProject $(gl)
}

Function hp {
   Param($ma) 
   if($ma.Length -eq 0) {
      wsl habitipy status
      }
   else{
     wsl habitipy $ma
   }
}
function discord {
	Start-Job { Invoke-Item "D:\Users\admin\AppData\Local\Discord\app-1.0.9002\Discord.exe"}
	}


$path = "B:\Lib\Proj\PS\"

$dns = "C:\Windows\System32\drivers\etc\hosts"
$todo = "B:\Lib\Data\todo"
$pls =  "B:\Res\AppData\Roaming\AIMP\PLS"

Set-Variable -name DONE_FILE -value $todo'done.txt'
Set-Variable -name TODO_FILE -value $todo'\todo.txt'
Set-Variable -name pTodo -value $todo'\personal.txt'

Set-Variable -name DirVideos -value '\\home-server\Lib\Videos'
Set-Alias -name t -value todo

#Methods Invoke 

Start-Job { NetDisabler /D /T 2}>>""
.$path"YT-Loader\YTTools.ps1"

cls
