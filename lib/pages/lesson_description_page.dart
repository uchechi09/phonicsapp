import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:phonicsapp/models/phonics_character.dart';
import 'package:phonicsapp/pages/flash_card_page.dart';
import 'package:phonicsapp/pages/formation_page.dart';
import 'package:phonicsapp/widgets/phonics_card_view.dart';
import 'package:phonicsapp/widgets/sounding_section_card.dart';

// LessonDescriptionPage
// Shows details for a single phonics character: story, actions,
// flash card, formation (finger tracing), sounding examples and song.
// The page composes smaller widgets (`PhonicsCardViewPage`,
// `SoundingSectionCard`) to keep layout consistent.

class LessonDescriptionPage extends StatefulWidget {
  const LessonDescriptionPage({
    super.key,
    required this.phonicsCharacter,
    required this.color,
  });
  final PhonicsCharacter phonicsCharacter;
  final Color color;

  @override
  State<LessonDescriptionPage> createState() => _LessonDescriptionPageState();
}

class _LessonDescriptionPageState extends State<LessonDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    var phonicsCharacter = widget.phonicsCharacter;
    var phonicChar = phonicsCharacter.character;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: widget.color,
        foregroundColor: Colors.white,
        title: Text("Lesson /$phonicChar/"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Story section: brief story that reinforces the sound.
          PhonicsCardViewPage(
            title: "Story",
            child: Text(phonicsCharacter.story),
          ),
          //
          // Action section: shows an image and a short instruction
          // children can perform to link movement to the sound.
          PhonicsCardViewPage(
            title: "Actions",
            child: Column(
              children: [
                Image.asset(phonicsCharacter.actionImage),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(phonicsCharacter.actionText),
                ),
              ],
            ),
          ),
          //
          // Flash card: tappable card that expands to a full-screen
          // `FlashCardPage` for focus practice.
          PhonicsCardViewPage(
            title: "Flash Card",
            actions: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlashCardPage(phonicChar: phonicChar),
                  ),
                );
              },
              icon: Icon(Icons.expand, color: Colors.grey.shade400),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  width: 150,
                  height: 150,
                  child: Center(
                    child: Text(
                      phonicChar,
                      style: TextStyle(
                        fontSize: 105,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //
          // Formation / Finger tracing: navigates to `FormationPage`
          // where the learner can trace the character on screen.
          PhonicsCardViewPage(
            title: "Formation",
            bottomItem: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormationPage(color: widget.color),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                fixedSize: Size.fromWidth(MediaQuery.sizeOf(context).width),
              ),
              child: Text("Finger Tracing"),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  width: 150,
                  height: 150,
                  child: Center(
                    child: Text(
                      phonicChar,
                      style: TextStyle(
                        fontSize: 105,
                        fontWeight: FontWeight.w900,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //
          // Sounding section: shows listening examples and playable
          // audio for the character (handled by `SoundingSectionCard`).
          SoundingSectionCard(
            phonicChar: phonicChar,
            phonicsCharacter: phonicsCharacter,
          ),
          //
          // Writing card: shows writing practice examples (words or
          // characters) that children can copy.
          PhonicsCardViewPage(
            title: "Writing",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Call the sound below and ask the children to write them down",
                ),
                Wrap(
                  // alignment: WrapAlignment.start,
                  children: List.generate(
                    phonicsCharacter.listOfWriting.length,
                    (index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 30,
                          child: Text(
                            phonicsCharacter.listOfWriting[index].character,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          //
          // Song section: displays song text and a small audio player
          // implemented below as `SongWidget`.
          PhonicsCardViewPage(
            title: "Song",
            child: Column(
              children: [
                Text(phonicsCharacter.songText),
                SongWidget(songAssest: widget.phonicsCharacter.songAudio),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
