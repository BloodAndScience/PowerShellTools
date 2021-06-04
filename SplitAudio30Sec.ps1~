	function SplitAudio($ext=$('.m4a','.opus','.mp3')){
		foreach($f in $(ls)){
			foreach($e in $ext){
				if($f -match $($e+"$")){
					ToMP3($f.Name,$out)
				
			}
		
		}
		
	}
	}
	function ToMP3($in,$out){

		ffmpeg -i $in -id3v2_version 3
	}

	function SplitAudioFile($in,$out,$d=3000){

		ffmpeg -i $in -id3v2_version 3 -f segment -segment_time 3000 -c copy $out%03d.mp3
	}

