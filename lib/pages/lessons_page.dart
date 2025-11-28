import 'package:flutter/material.dart';
import 'package:phonicsapp/data/dummy.dart';
import 'package:phonicsapp/widgets/group_item.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({super.key});
  

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: _buildLessonAppBar(),
            ),
           Expanded(
             child: ListView.builder(
               itemCount: PHONICS_GROUP.length,
               itemBuilder: (BuildContext context, int index) {
                 var group = PHONICS_GROUP[index];
                 return GroupItem(phonicsGroup: group);
               },
             ),
           )
          ],
        ),
      ),
    );
  }

  SizedBox _buildLessonAppBar() {
    return SizedBox(
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 8,
            left: 0,
            child: Text(
              "Lessons",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Card(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings, color: Colors.pink),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
