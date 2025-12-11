import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:phonicsapp/models/phonics_character.dart';
import 'package:phonicsapp/models/sounding_item.dart';
import 'package:phonicsapp/widgets/phonics_card_view.dart';

class SoundingSectionCard extends StatefulWidget {
  const SoundingSectionCard({
    super.key,
    required this.phonicChar,
    required this.phonicsCharacter,
  });

  final String phonicChar;
  final PhonicsCharacter phonicsCharacter;

  @override
  State<SoundingSectionCard> createState() => _SoundingSectionCardState();
}

class _SoundingSectionCardState extends State<SoundingSectionCard> {
  @override
  Widget build(BuildContext context) {
    return PhonicsCardViewPage(
      title: "Sounding ",
      child: Column(
        children: [
          Text(
            "Which of these words does not start with /${widget.phonicChar}/ sound?",
          ),
          Column(
            children: [
              ...List.generate(widget.phonicsCharacter.soundingItems.length, (
                index,
              ) {
                var soundingItem = widget.phonicsCharacter.soundingItems[index];
                return SoundingItemWidget(soundingItem: soundingItem);
              }),
            ],
          ),
        ],
      ),
    );
  }
}

class SoundingItemWidget extends StatefulWidget {
  const SoundingItemWidget({super.key, required this.soundingItem});
  final SoundingItem soundingItem;

  @override
  State<SoundingItemWidget> createState() => _SoundingItemWidgetState();
}

class _SoundingItemWidgetState extends State<SoundingItemWidget> {
  var justAudio = AudioPlayer();
  bool showText = false;

  @override
  void dispose() {
    super.dispose();
    justAudio.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.soundingItem.audio);
    return InkWell(
      onTap: () {
        justAudio.setAsset(widget.soundingItem.audio);
        justAudio.play();

        setState(() {
          showText = true;
        });
      },
      child: Column(
        children: [
          Container(height: 200, child: Image.asset(widget.soundingItem.image)),
          if (showText) Text(widget.soundingItem.name),
        ],
      ),
    );
  }
}
