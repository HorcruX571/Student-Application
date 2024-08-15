import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:assignment/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:assignment/features/auth/presentation/bloc/auth_event.dart';
import 'package:assignment/features/auth/presentation/bloc/auth_state.dart';
import 'package:assignment/core/utils/utils.dart';
import 'package:assignment/features/auth/presentation/widgets/auth_field.dart';
import 'package:assignment/features/auth/presentation/widgets/auth_gradient_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          Utils.showProgressBar(context);
        } else if (state is AuthFailure) {
          Navigator.pop(context); // Pop the progress bar
          Utils.showSnakBar(context, state.errorMessage);
        } else if (state is AuthSuccess) {
          Navigator.pop(context); // Pop the progress bar
          Utils.showSnakBar(context, "User Logged in successfully");

          // Use context.go to navigate
          context.go('/home');
        }
      },
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                AuthField(
                  hintText: "Email",
                  controller: emailController,
                  isObsecureText: false,
                ),
                const SizedBox(height: 10),
                AuthField(
                  hintText: "Password",
                  controller: passwordController,
                  isObsecureText: true,
                ),
                const SizedBox(height: 25),
                AuthGradientButton(
                  buttonText: "Login",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                            AuthLoginEvent(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                    }
                  },
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    context.go('/register');
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
