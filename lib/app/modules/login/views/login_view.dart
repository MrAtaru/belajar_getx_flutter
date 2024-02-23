import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Login',
                style: TextStyle(fontSize: 20),
              ),
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16),
                  TextFormField(
                    onChanged: controller.onEmailChanged,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Input Email';
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    onChanged: controller.onPasswordChanged,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Input Password';
                      }
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () => controller.login(),
                    child: Text('Login'),
                  ),
                ],
              )),
              SizedBox(height: 16.0),
              ElevatedButton(
                  onPressed: () => controller.goToRegister(),
                  child: Text('Belum Punya Akun?'))
            ],
          ),
        ),
      ),
    );
  }
}
