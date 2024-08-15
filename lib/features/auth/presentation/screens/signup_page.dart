import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:assignment/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:assignment/features/auth/presentation/bloc/auth_event.dart';
import 'package:assignment/features/auth/presentation/bloc/auth_state.dart';
import 'package:assignment/core/utils/utils.dart';
import 'package:assignment/features/auth/presentation/widgets/auth_field.dart';
import 'package:assignment/features/auth/presentation/widgets/auth_gradient_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          Utils.showProgressBar(context);
        } else if (state is AuthFailure) {
          Navigator.pop(context);
          Utils.showSnakBar(context, state.errorMessage);
        } else if (state is AuthSuccess) {
          Navigator.pop(context);
          Utils.showSnakBar(context, "User created successfully");

          Future.microtask(() {
            context.go('/');
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Sign Up",
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
                  const SizedBox(height: 10),
                  AuthField(
                    hintText: "Confirm Password",
                    controller: confirmPasswordController,
                    isObsecureText: true,
                  ),
                  const SizedBox(height: 25),
                  AuthGradientButton(
                    buttonText: "Sign Up",
                    onPressed: () {
                      if (formKey.currentState!.validate() &&
                          passwordController.text ==
                              confirmPasswordController.text) {
                        context.read<AuthBloc>().add(
                              AuthSignupEvent(
                                email: emailController.text,
                                password: passwordController.text,
                                role: "student",
                              ),
                            );
                      } else if (passwordController.text !=
                          confirmPasswordController.text) {
                        Utils.showSnakBar(context, "Passwords do not match");
                      }
                    },
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      context.go('/');
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
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
        );
      },
    );
  }
}
