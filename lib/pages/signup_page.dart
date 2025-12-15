import 'package:flutter/material.dart';
import 'package:phonicsapp/models/app_user.dart';
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
  AppUser? newUser;
  AuthRepository authRepository = AuthRepository();
  List<String> selectedUserTypes = [];
  List<String> selectedAge = [];

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
                    selectedUserTypes = selectedItems;
                  },
                ),

              // PAGE 2 — Select Age
              if (currentpageIndex == 2)
                TypeOfUserSelectionSection(
                  heading: "Select your age",
                  key: const Key("grid2"),
                  options: ["0-3", "4-6", "7-8", "8+"],
                  onSelect: (listOfSelection) {
                    selectedAge = listOfSelection;
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
                  onPressed: () {
                    if (currentpageIndex == 2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ),
                      );
                       authRepository.updateUserProfile(
                        user: newUser!.copyWith(ageOfLearners: selectedAge, userType: selectedUserTypes),
                      );
                    } else if (currentpageIndex == 0) {
                      _createUserAccount();
                    } else {
                      //increment current page index
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

  Future<void> _createUserAccount() async {
    try {
      newUser = await AuthRepository().signUp(
        email: emailController.text,
        password: passwordController.text,
      );

      // Move to next screen ONLY after successful signup
      setState(() {
        currentpageIndex++;
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
