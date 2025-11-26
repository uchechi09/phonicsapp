import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phonicsapp/pages/signin_page.dart';
import 'package:phonicsapp/pages/signup_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "KIDDIES PHONICSMIX",
            style: GoogleFonts.bubblegumSans(fontSize: 26, color: Colors.white),
            textAlign: TextAlign.right,
          ),
          Align(
            alignment: Alignment.topLeft,

            child: Image.asset("assets/images/bee.png", width: 250, height: 250)
                .animate()
                .slideY(begin: -0.4, duration: Duration(seconds: 3))
                .fade(duration: Duration(seconds: 2)),
          ),
          //flutter_animate functional usage
          Image.asset("assets/images/mouse.png", width: 300, height: 300)
              .animate()
              .slideX(begin: -0.4, duration: Duration(seconds: 3))
              .fadeIn(duration: Duration(seconds: 2)),
        ],
      ),
      bottomNavigationBar: _buildOnboardingBottom(context),
    );
  }

  Widget _buildOnboardingBottom(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Kiddies PhonicsMix",
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),

        Text(
          "The fun and interactive way to improve your kids reading and writing across languages",
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            spacing: 16,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));
                  },
                  child: Text("Sign up"),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(foregroundColor: Colors.blue),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SigninPage()));
                },
                child: Text("Sign in"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
