import 'package:flutter/material.dart';
import 'package:phonicsapp/models/phonics_character.dart';
import 'package:phonicsapp/pages/flash_card_page.dart';

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
          _buildCardView(title: "Story", child: Text(phonicsCharacter.story)),
          //
          // action section
          _buildCardView(
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
          _buildCardView(
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
              icon: Icon(Icons.expand, color: Colors.red.shade400),
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
        ],
      ),
    );
  }

  Container _buildCardView({
    required String title,
    required Widget child,
   Widget? actions,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                if (actions != null) actions,
              ],
            
            ),
          ),
          Container(child: child),
        ],
      ),
    );
  }
}
