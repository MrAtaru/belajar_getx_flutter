import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Register',
                style: TextStyle(fontSize: 20),
              ),
              Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 16),
                      TextFormField(
                        onChanged: controller.onNameChanged,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Input Name';
                          }
                        },
                      ),
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
                            return 'Enter the password';
                          }
                        },
                      ),
                      // SizedBox(height: 16),
                      // TextFormField(
                      //   onChanged: controller.onPasswordConfirmationChanged,
                      //   decoration: InputDecoration(
                      //     hintText: 'Password Confirmation',
                      //     border: OutlineInputBorder(),
                      //   ),
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Enter the password again';
                      //     }
                      //   },
                      // ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            // Form is valid, proceed with registration
                            controller.register();
                          }
                        },
                        child: Text('Register'),
                      ),
                    ],
                  )),
              SizedBox(height: 16.0),
              ElevatedButton(
                  onPressed: () => controller.goToLogin(),
                  child: Text('Sudah Punya Akun?'))
            ],
          ),
        ),
      ),
    );
  }
}
