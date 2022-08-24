import 'package:chat_app_in_dark_and_light_mode/components/primary_button.dart';
import 'package:chat_app_in_dark_and_light_mode/constants.dart';
import 'package:chat_app_in_dark_and_light_mode/screen/chat/chat_screen.dart';
import 'package:flutter/material.dart';

class SignInOrSignUpScreen extends StatelessWidget {
  const SignInOrSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Image.asset(
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? 'assets/images/Logo_light.png'
                    : 'assets/images/Logo_dark.png',
                height: 146,
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Sign In',
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const ChatScreen();
                  }));
                },
              ),
              const SizedBox(
                height: kDefaultPadding * 1.5,
              ),
              PrimaryButton(
                text: 'Sign Up',
                press: () {},
                color: Theme.of(context).colorScheme.secondary,
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
