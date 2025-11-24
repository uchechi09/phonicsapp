import 'package:flutter/material.dart';
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
                  options: ["Teacher", "Guardian", " Tutor", "Others"],
                  onSelect: (selectedItems) => print(selectedItems),
                ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromWidth(
                      MediaQuery.sizeOf(context).width * 0.7,
                    ),
                  ),
                  onPressed: () {
                    // increment current page index#
                    setState(() {
                      currentpageIndex++;
                    });
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
