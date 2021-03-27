function MergeAudioVideo($files){
    foreach($file in $files){ 
        $file 
        ffmpeg -i $file'.webm' -i $file'.m4a' -c copy $file'.mkv' 
    }
    rm *.m4a
    rm *.webm
}

function DownloadPlaylist($link){

        youtube-dl -i -o '%(playlist_index)s - %(title)s.webm' -f 'webm' $link
        youtube-dl -i -o '%(playlist_index)s - %(title)s.m4a' -f 'bestaudio' $link
        $list = youtube-dl -i -o '%(playlist_index)s - %(title)s' --get-filename $link
        MergeAudioVideo($list);
}