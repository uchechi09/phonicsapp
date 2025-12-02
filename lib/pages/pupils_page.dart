import 'package:flutter/material.dart';

class PupilsPage extends StatelessWidget {
  const PupilsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 8,
                    left: 0,
                    child: Text(
                      "Pupils",
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Row(
                       mainAxisSize: MainAxisSize.min,
                        children: [
                          Card(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.help, color: Colors.pink),
                            ),
                          ),
                          SizedBox(width: 6),
                          Card(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add, color: Colors.pink),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 320,),
            Text("There are no pupils yet."),
          ],
          
        ),
      ),
    );
  }
}
