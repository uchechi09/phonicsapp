import 'package:flutter/material.dart';
import 'package:phonicsapp/pages/home_page.dart';
import 'package:phonicsapp/widgets/signup_secction.dart';
import 'package:phonicsapp/widgets/type_of_user_selection_section.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var currentpageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/mouse.png", width: 250, height: 250),
              if (currentpageIndex == 0) SignUpSection(),
              if (currentpageIndex == 1)
                TypeOfUserSelectionSection(
                  heading: "Are you a guardian or a teacher?", 
                  key: Key ("grid1"),
                  options: ["Teacher", "Guardian", " Tutor", "Others"],
                  onSelect: (selectedItems) => print(selectedItems),
                ),
              if (currentpageIndex == 2)
                TypeOfUserSelectionSection(
                  heading: "Select your age",
                  key: Key("grid2"),
                  options: ["0-3", "4-6", "7-8", "8 +"],
                  onSelect: (selectedItems) => print(selectedItems),
                ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromWidth(
                      MediaQuery.sizeOf(context).width * 0.12,
                    ),
                  ),
                  onPressed: () {
                    if (currentpageIndex == 2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      // increment current page index#
                      setState(() {
                        currentpageIndex++;
                      });
                    }
                  },
                  child: Text("Next"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
