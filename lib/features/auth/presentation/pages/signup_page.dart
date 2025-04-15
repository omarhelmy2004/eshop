import 'package:eshop/core/presentation/widgets/logo.dart';
import 'package:eshop/core/presentation/widgets/main_view.dart';
import 'package:eshop/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/sign_button.dart';
import '../widgets/email_input_field.dart';
import '../widgets/password_input_field.dart';
import '../widgets/confirm_password_input_field.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static String id = 'SignupPage';

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
          // Show a loading indicator
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is RegisterSuccess) {
          // Navigate to the main view or show success message
          Navigator.pop(context); // Close the loading dialog
          Navigator.pushReplacementNamed(context, MainView.id, arguments: state.user);
        } else if (state is RegisterFailure) {
          // Show an error message
          Navigator.pop(context); // Close the loading dialog
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  const Logo(),
                  const SizedBox(height: 30),
                  const Text("Signup",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text("Already have an account? ",
                          style: TextStyle(fontSize: 18)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  const LoginPage(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  EmailInputField(
                    controller: _emailController, // Use TextEditingController
                    enColor: Colors.green,
                    foColor: Colors.black,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  PasswordInputField(
                    controller:
                        _passwordController, // Add TextEditingController
                    enColor: Colors.green,
                    foColor: Colors.black,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  ConfirmPasswordInputField(
                    controller:
                        _passwordController, // Add TextEditingController
                    enColor: Colors.green,
                    foColor: Colors.black,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  SignupButton(
                    text: 'Create Account',
                    formKey: _formKey,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final String email = _emailController.text;
                        final String password = _passwordController.text;
                        BlocProvider.of<RegisterCubit>(context)
                            .registerUser(email: email, password: password);
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
