import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_10/login_page.dart';
import 'package:app_10/register_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'flash',
                  child: Image.asset(
                    'assets/flash.png',
                    height: 30,
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.indigo.shade600,
                      fontWeight: FontWeight.bold),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('Flash chat'.toUpperCase()),
                    ],
                    isRepeatingAnimation: true,
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }));
                },
                child: const Text('Login')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const RegisterPage();
                  }));
                },
                child: const Text('Register')),
          ],
        ),
      ),
    );
  }
}
