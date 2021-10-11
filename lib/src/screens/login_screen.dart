import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Widget build(context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              emailField(),
              Container(margin: EdgeInsets.only(bottom: 25.0)),
              passwordField(),
              Container(margin: EdgeInsets.only(bottom: 25.0)),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (String? value) {
        email = value ?? '';
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
        hintText: 'Password',
      ),
      obscureText: true,
      validator: validatePassword,
      onSaved: (String? value) {
        password = value ?? '';
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        print('Submit pressed');
        if (formKey.currentState?.validate() == true) {
          formKey.currentState?.save();
          print('Time to pass $email and $password to my API!');
        }
      },
      child: Text('Submit'),
    );
  }
}
