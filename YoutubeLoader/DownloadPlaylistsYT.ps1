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


#Getting PlayList Name
$folderName = youtube-dl -f 136 --get-filename  --playlist-item 1 -o '%(playlist)s' 'https://www.youtube.com/watch?v=EsUGX0FZi5k&list=PLX2vGYjWbI0Qr4X9gfnJiMDKeqfqaNd6h'
#Download Playlist
youtube-dl --yes-playlist -f 136 https://www.youtube.com/playlist?list=PLX2vGYjWbI0QvLHla7C_Z_s3q1Oi461o4
#Correct formula for naming
 youtube-dl -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' https://www.youtube.com/playlist?list=PLwiyx1dc3P2JR9N8gQaQN_BCvlSlap7re
