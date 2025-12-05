import 'package:flutter/material.dart';
import 'package:phonicsapp/models/phonics_character.dart';
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
                return InkWell( onTap: () {},
                  child: Container(
                    height: 220,
                    width: 200,
                    child: Image.asset(soundingItem.image),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}

