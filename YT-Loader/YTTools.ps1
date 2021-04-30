function MergeAudioVideo($files){
    foreach($file in $files){ 
        $file 
        ffmpeg -i $file'.webm' -i $file'.m4a' -c copy $file'.mkv' 
    }
    rm *.m4a
    rm *.webm
}

function youtube-list($link){


        $folderName = youtube-dl --get-filename  --playlist-item 1 -o '%(playlist)s' $link
        $folderName = $gl+$folderName

        mkdir $folderName
        cd $folderName
        echoe made folder $folderName

        youtube-dl -i -o '%(playlist_index)s - %(title)s.webm' -f 'webm' $link
        youtube-dl -i -o '%(playlist_index)s - %(title)s.m4a' -f 'bestaudio' $link
        $list = youtube-dl -i -o '%(playlist_index)s - %(title)s' --get-filename $link
        MergeAudioVideo($list);
}
