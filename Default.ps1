cls

function codeD {
	Start-Job { code $args[0] } -ArgumentList (gl) 

}

function unityC($name="NewUnity") {

        cd 'B:\Git\'
	echo "Moved to B:\Git"
	cp 'B:\Lib\Proj\MyIDE\Templates\NewUnity.7z'
	echo "Copied NewUnity.7z"
	7z x 'B:\Lib\Proj\MyIDE\Templates\NewUnity.7z'
	echo "Extracted NewUnity.7z"
	mv NewUnity $name
	echo "Moved to "+$name
	cd $name
	Unity -projectPath $(gl)
}

#function plantuml {
#   Param($ma) 
#   plantuml.jar $ma }

function hp {
   Param($ma) 
   if($ma.Length -eq 0) {
      wsl habitipy status
      }
   else{
     wsl habitipy $ma
   }
}

function yd {
   Param($ma) 
	youtube-dl $ma
}
function ydm {
   Param($ma) 
	youtube-dl -x -f "bestaudio" --audio-format "mp3" $ma
}

function aimpN ($count=10){
	foreach ($i in (1..$count)) {
	aimp /next
	sleep 0.025
	}
	aimp
}


function discord {
	Start-Job { Invoke-Item "D:\Users\admin\AppData\Local\Discord\app-1.0.9002\Discord.exe"}
	}


#Variables

$path = "B:\Lib\Proj\PS"
$dns = "C:\Windows\System32\drivers\etc\hosts"

$todo = "B:\Lib\Data\todo"
$todoP = $todo +"\personal.txt"

$servLib= '\\home-server\Lib'
$hrData = "B:\Res\AppData\Roaming\HeartRate"



#For todotxt cli

Set-Variable -name DONE_FILE -value $todo'done.txt'
Set-Variable -name TODO_FILE -value $todo'\todo.txt'


#Alias

Set-Alias -name t -value todo
Set-Alias -Name edge -Value 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe'
Set-Alias -Name hr -Value 'B:\MyPrograms\CLI\HeartRate\HeartRate.exe'


#Methods Invoke 

#Start-Job { NetDisabler /D /T 2}>>""
.$path"YT-Loader\YTTools.ps1"


cls
