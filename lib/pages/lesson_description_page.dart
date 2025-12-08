import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:phonicsapp/models/phonics_character.dart';
import 'package:phonicsapp/pages/flash_card_page.dart';
import 'package:phonicsapp/pages/formation_page.dart';
import 'package:phonicsapp/widgets/phonics_card_view.dart';
import 'package:phonicsapp/widgets/sounding_section_card.dart';

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
          //
          // story section
          PhonicsCardViewPage(
            title: "Story",
            child: Text(phonicsCharacter.story),
          ),
          //
          // action section
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
          // flash card
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
          // finger tracing
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
          // sounding section
          SoundingSectionCard(
            phonicChar: phonicChar,
            phonicsCharacter: phonicsCharacter,
          ),
          //
          // writing card
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
          // song section
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
  var justAudio = AudioPlayer();
  bool playing = false;
  double currentSeconds = 0;
  double maxSeconds = 0;

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
              justAudio.setAsset(widget.songAssest);
              justAudio.play();
              if (playing) {
                playing = false;
                justAudio.pause();
              } else {
                playing = true;
              }
              setState(() {});
            },
            icon: Icon(
              playing ? Icons.play_circle_outline : Icons.pause_circle,
              size: 60,
            ),
          ),
        ],
      ),
    );
  }
}
