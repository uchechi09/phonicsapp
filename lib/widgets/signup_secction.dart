import 'package:flutter/material.dart';
import 'package:phonicsapp/widgets/custom_textfield.dart';
import 'package:phonicsapp/widgets/password_textfield.dart';

class SignUpSection extends StatelessWidget {
  const SignUpSection({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Welcome to PhonicMix!",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            spacing: 16,
            children: [
              CustomTextField(label: "Email",controller: emailController,),
              PasswordTextField(controller: passwordController,),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: AgreementWidget(),
        ),
      ],
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
              side: BorderSide(color: Colors.white),
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
                    side: BorderSide(color: Colors.white),
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
                    side: BorderSide(color: Colors.white),
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
