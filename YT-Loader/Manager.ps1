
#cd 'B:\Lib\Proj\PS\YT-Loader\'
#. .\Manager.ps1
function IsMkv($path){

    $files  = Get-ChildItem $path;
    foreach($p in $files)
    {
        $return = "True"
        if("$p".Contains(".webm")){
           $return=$null
        }
    }
    return $return

}
function MoveComplite ($path){
    cd $path
    mkdir "Done"
    $folders =  Get-ChildItem -Path $path -Directory
    foreach($d in $folders)
    {
        if(IsMkv $d){
         echo("Completed $d ")
         mv $d "./Done" 
        }
    }

}

function ProcessExisting ($folderName, $playlist)      {
    echo "Begin download of $playlist " 

    Start-Job{
    cd $args[0]
    $link = $args[1]
    . "B:\Lib\Proj\PS\YT-Loader\YTTools.ps1"
    DownloadPlaylist $link

    } -ArgumentList ($folderName,$playlist)
    echo "Started job"
}
function CheckIfFolderExist($fullPath,$p)
{
    if(Test-Path $fullPath)
    { 
        echo "exist      $fullPath"
        ProcessExisting $fullPath $p
    }
    else{
        echo "not exit     $fullPath"
    }

}

function DownloadListParalel($p) {
    echo $p
    $folderName = youtube-dl --get-filename  --playlist-item 1 -o '%(playlist)s' $p
    $basefolder = $(Get-Location);
    $fullPath = "$basefolder\$folderName"
if(Test-Path $fullPath)
    {}
    else
    { mkdir $folderName}
    echo "Made $fullPath"
    CheckIfFolderExist $fullPath $p  
}

function YT-Init ($listF) {
#$listF = 'B:\Lib\Proj\PS\YT-Loader\Resources\UnityShort.list' 
$playL = Get-Content $listF | Select-Object 
echo "Loaded  $($playl.count)  Playslist $listF"
$i =0
foreach($p in $playL) {
    if($p.Contains("youtube.com"))
    {
    DownloadListParalel $p
    }
}
}
