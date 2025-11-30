import 'package:flutter/material.dart';
import 'package:lab_assignment/widgets/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lab Assignment',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 24),
            Header(),
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Form(
                    child: Column(
                      children: [
                        CustomTextField(
                          labelText: 'Name',
                          hintText: 'write your name...',
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          labelText: 'Email',
                          hintText: 'write your email...',
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          labelText: 'Phone',
                          hintText: 'write your phone...',
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          labelText: 'Password',
                          hintText: 'write your password...',
                          type: TextFieldType.password,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
