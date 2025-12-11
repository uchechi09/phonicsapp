import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SongWidget extends StatefulWidget {
  const SongWidget({super.key, required this.songAssest});
  final String songAssest;

  @override
  State<SongWidget> createState() => _SongWidgetState();
}

class _SongWidgetState extends State<SongWidget> {
  // Audio player used to play the song asset
  var justAudio = AudioPlayer();
  // Playback state
  bool playing = false; // whether audio is currently playing
  double currentSeconds = 0; // current playback position in seconds
  double maxSeconds = 0; // total duration in seconds

  @override
  void initState() {
    super.initState();
    initializeAudio();
  }

  Future<void> initializeAudio() async {
    justAudio = AudioPlayer();
    await justAudio.setAsset(widget.songAssest);
    maxSeconds = (justAudio.duration?.inSeconds ?? 0).toDouble();
    justAudio.positionStream.listen((duration) {
      currentSeconds = duration.inSeconds.toDouble();
      if (currentSeconds >= maxSeconds) {
        playing = false;
        justAudio.stop();
      }

      // update UI as the playback position changes
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    justAudio.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Slider(
                value: currentSeconds,
                max: maxSeconds,
                onChanged: (position) {
                  justAudio.seek(Duration(seconds: position.toInt()));
                },
              ),
              Text(currentSeconds.toString()),
            ],
          ),
          IconButton(
            onPressed: () {
              // Toggle playback. Note: `setAsset` is called here which
              // re-initializes the audio source; consider removing it
              // if the asset is already set to avoid reloading.
              justAudio.setAsset(widget.songAssest);
              justAudio.play();
              if (playing) {
                // pause if currently playing
                playing = false;
                justAudio.pause();
              } else {
                // start playing
                playing = true;
              }
              setState(() {});
            },
            icon: Icon(
              // switch icon based on `playing` state
              playing ? Icons.play_circle_outline : Icons.pause_circle,
              size: 60,
            ),
          ),
        ],
      ),
    );
  }
}
