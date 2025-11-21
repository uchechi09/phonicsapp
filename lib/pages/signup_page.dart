import 'package:flutter/material.dart';
import 'package:phonicsapp/widgets/custom_textfield.dart';
import 'package:phonicsapp/widgets/password_textfield.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
              Text(
                "Welcome to PhonicMix!",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  spacing: 16,
                  children: [
                    CustomTextField(label: "Email"),
                    PasswordTextField(),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AgreementWidget(),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: ElevatedButton(onPressed: () {}, child: Text("Next")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AgreementWidget extends StatelessWidget {
  const AgreementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
              checkColor: Colors.white,
              activeColor: Colors.white,
              focusColor: Colors.white,
            ),
            Text("SELECT ALL ", style: TextStyle(color: Colors.white)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                    checkColor: Colors.white,
                    activeColor: Colors.white,
                    focusColor: Colors.white,
                  ),
                  Expanded(
                    child: Text(
                      "I agree to the privacy policy and terms",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                    checkColor: Colors.white,
                    activeColor: Colors.white,
                    focusColor: Colors.white,
                  ),
                  Expanded(
                    child: Text(
                      "I want to receive email update from Jolly Learning",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
