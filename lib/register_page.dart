import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final auth = FirebaseAuth.instance;

  Future registerUser() async {
    final result = await auth.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    log('result = $result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        title: const Text('Register'),
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
                  await registerUser();
                },
                child: const Text('Register')),
          ],
        ),
      ),
    );
  }
}
