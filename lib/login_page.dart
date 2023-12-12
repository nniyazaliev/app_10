import 'dart:developer';

import 'package:app_10/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final auth = FirebaseAuth.instance;

  Future signInWithEmail() async {
    final result = await auth.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    log('result = $result');
    print('result = $result');

    if (!mounted) return;
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ChatPage(
        email: result.user!.email!,
        userId: result.user!.uid,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'flash',
              child: Image.asset(
                'assets/flash.png',
                height: 160,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'email',
                hintText: 'hint text',
                helperText: 'supporting text',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'password',
                hintText: 'hint text',
                helperText: 'supporting text',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await signInWithEmail();
                },
                child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
