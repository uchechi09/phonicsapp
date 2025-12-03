import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phonicsapp/models/phonics_character.dart';
import 'package:phonicsapp/models/phonics_group.dart';
import 'package:phonicsapp/pages/lesson_description_page.dart';

class GroupItem extends StatefulWidget {
  const GroupItem({super.key, required this.phonicsGroup, });
   final PhonicsGroup phonicsGroup;

  @override
  State<GroupItem> createState() => _GroupItemState();
}

class _GroupItemState extends State<GroupItem> {
  @override
  Widget build(BuildContext context) {
   
    return Container(
      height: 400,
      child: Stack(
        children: [
          Positioned(
            right: 8,
            left: 8,
            top: 0,
            child: _buildGroupItemHeading(),
          ),
          Positioned(
            bottom: 8,
            right: 32,
            left: 32,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.phonicsGroup.color,
                foregroundColor: Colors.white,
              ),
              child: Text("Practice Group ${widget.phonicsGroup.id} with Readers"),
            ),
          ),
          Positioned(
            top: 110,
            right: 32,
            left: 32,
            child: _buildGrid(context,widget.phonicsGroup.characters),
          ),
        ],
      ),
    );
  }

  SizedBox _buildGrid(
    BuildContext context,
    List<PhonicsCharacter> listOfCharacters,
  ) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.85,
      height: 350,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: listOfCharacters.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
        ),
        itemBuilder: (context, index) {
          var  phonicCharacter = listOfCharacters[index];
          return InkWell( 
            onTap: () {
             Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return LessonDescriptionPage(
                  color: widget.phonicsGroup.color,
                  phonicsCharacter: phonicCharacter,
                );
                },
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                 phonicCharacter.character,
                  style: GoogleFonts.fredoka(
                    color: widget.phonicsGroup.color,
                    fontWeight: FontWeight.bold,fontSize: 32
                  ),
                  
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container _buildGroupItemHeading() {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/group.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Center(
          child: Text(
            "Group ${widget.phonicsGroup.id}",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
