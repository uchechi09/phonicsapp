import 'package:flutter/material.dart';
import 'package:phonicsapp/pages/home_page.dart';
import 'package:phonicsapp/repository/auth_repository.dart';
import 'package:phonicsapp/widgets/signup_secction.dart';
import 'package:phonicsapp/widgets/type_of_user_selection_section.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  int currentpageIndex = 0;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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

              // PAGE 0 — Email & Password
              if (currentpageIndex == 0)
                SignUpSection(
                  emailController: emailController,
                  passwordController: passwordController,
                ),

              // PAGE 1 — Select User Type
              if (currentpageIndex == 1)
                TypeOfUserSelectionSection(
                  heading: "Are you a guardian or a teacher?",
                  key: const Key("grid1"),
                  options: ["Teacher", "Guardian", "Tutor", "Others"],
                  onSelect: (selectedItems) {
                    print(selectedItems);
                  },
                ),

              // PAGE 2 — Select Age
              if (currentpageIndex == 2)
                TypeOfUserSelectionSection(
                  heading: "Select your age",
                  key: const Key("grid2"),
                  options: ["0-3", "4-6", "7-8", "8+"],
                  onSelect: (selectedItems) {
                    print(selectedItems);
                  },
                ),

              // NEXT BUTTON
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromWidth(
                      MediaQuery.sizeOf(context).width * 0.12,
                    ),
                  ),
                  child: const Text("Next"),
                  onPressed: () async {
                    // FINAL PAGE → GO TO HOME
                    if (currentpageIndex == 2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                      return;
                    }

                    // PAGE 0 → SIGN UP FIRST
                    if (currentpageIndex == 0) {
                      await _createUserAccount();
                      return;
                    }

                    // PAGE 1 → just move to page 2
                    setState(() {
                      currentpageIndex++;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createUserAccount() async {
    try {
      await AuthRepository().signUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Move to next screen ONLY after successful signup
      setState(() {
        currentpageIndex++;
      });

    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
