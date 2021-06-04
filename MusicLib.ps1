function AddMusicToLib {

    cd B:\Res\Music\
    $flacD = GetDirWithFile "flac"
    Write-Host "Start with Flac"
    foreach ($d in $flacD) {
        Set-Location $d
        ConvertMusic
        CommitMusic
    } 
    Write-Host "Done with flac"
    Write-Host "Start with mp3"

    $mp3 = GetDirWithFile "mp3"
    foreach ($d in $mp3) {

        Write-Host "MP3 at folder:"
        Set-Location $d
        echo $(gl)
        CommitMusic
    } 
    Write-Host "Done with mp3"

    cd B:\Res\Music\
    CommitMusic
}


function CommitMusic () {

	$p = $(Get-Location).Path
	$fn = $p -replace 'B:\\Res\\Music\\'
    git add *
    $b= [System.Int32] $( git rev-list --count main)

    git commit -m $($fn)

    $a = [System.Int32] $( git rev-list --count main)
    if($a -gt $b){
        git push
    }
 }

 function ConvertMusic()  {
	foreach($f in $(Get-ChildItem)){
		if($f.Name -match ".flac$"){
		$name = $($f.Name -replace ".flac")
		$name =  $($name + ".mp3")
		ffmpeg -i $f.Name $name
		Write-Host $name
		}
	}
	Remove-Item "*.flac"
 }
 function SubDir(){
	$l = New-Object 'System.Collections.Generic.List[string]'
	$all = Get-ChildItem -Recurse
	foreach ($d in $all){
		$dir= $d.DirectoryName
		$log = $(-not $l.Contains($dir))

		if($log){
			$l.Add($dir)
		}
		}
	 
	$l
}
function GetDirWithFile($type="flac"){


	$l = SubDir
    $flacD = New-Object 'System.Collections.Generic.List[string]'
	foreach($d in $l){
		$flac = $(Get-ChildItem -Path $d -Filter $("*."+$type) )
		if($flac.Length -gt 0){
			$flacD.Add($d)
		}
	}
	$flacD

}

