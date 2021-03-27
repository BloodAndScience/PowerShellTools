#Current tasks
#Check folder creation 
#Check video & audio downlaoding process
# Test it.

function DownloadTracks ($link) {

    echo $link
    youtube-dl --download-archive archive.txt
    youtube-dl -o '%(playlist_index)s - %(title)s.webm' -f 'webm' $link
    youtube-dl -o '%(playlist_index)s - %(title)s.m4a'-f 'bestaudio' $link 
}

function MergeAudioVideo($files){
    foreach($file in $files){ 
        ffmpeg -i $file'.webm' -i $file'.m4a' -c copy $file'.mkv' 
    }
    rm *.m4a
}

#Getting List of Folders
$playL = Get-Content 'B:\Temp\ListOfUnityPlayLists.list' | Select-Object 


foreach($p in $playL) {
    $folderName=""
    $folderName = youtube-dl --get-filename  --playlist-item 1 -o '%(playlist)s' $p
    if($folderName)
    { 
        echo "Not null"
    mkdir $folderName
    cd $folderName
    youtube-dl --yes-playlist -f webm -w -o '%(playlist_index)s - %(title)s.%(ext)s' $p 
    cd ..
    }
}

#Checking if folder exists
$playL = Get-Content 'B:\Lib\Proj\PS\YT-Loader\Resources\UnityAllPlaylist.list' | Select-Object 
cd D:\BTemp\Unity


foreach($p in $playL) {
    $folderName=""
    $folderName = youtube-dl --get-filename  --playlist-item 1 -o '%(playlist)s' $p
    $i =0

    if(Test-Path $folderName)
    { 
        $i=$i+1
        echo Exist $p folder name is $folderName
    }
    else{
        echo Not exist $p folder name is $folderName
    }
    echo exist $i expected $playL.count

}


#Getting PlayList Name
$folderName = youtube-dl -f 136 --get-filename  --playlist-item 1 -o '%(playlist)s' 'https://www.youtube.com/watch?v=EsUGX0FZi5k&list=PLX2vGYjWbI0Qr4X9gfnJiMDKeqfqaNd6h'
#Download Playlist
youtube-dl --yes-playlist -f 136 https://www.youtube.com/playlist?list=PLX2vGYjWbI0QvLHla7C_Z_s3q1Oi461o4
#Correct formula for naming
 youtube-dl -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' https://www.youtube.com/playlist?list=PLwiyx1dc3P2JR9N8gQaQN_BCvlSlap7re
