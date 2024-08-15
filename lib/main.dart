import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:assignment/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:assignment/features/auth/data/auth_repository.dart';
import 'package:assignment/core/network/api_service.dart';
import 'package:assignment/features/auth/presentation/screens/login_page.dart';
import 'package:assignment/features/auth/presentation/screens/signup_page.dart';
import 'package:assignment/student_home_page.dart';

void main() {
  final apiService =
      ApiService(baseUrl: 'https://gradebook-backend-1d92.onrender.com');
  final authRepository = AuthRepository(apiService: apiService);

  runApp(MyApp(authRepository: authRepository));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;

  MyApp({Key? key, required this.authRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authRepository: authRepository),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          cardColor: Colors.blue[50],
          colorScheme: const ColorScheme.light(
            secondary: Colors.blue,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.black),
            titleLarge: TextStyle(color: Colors.black),
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.grey[900],
          cardColor: Colors.grey[800],
          colorScheme: const ColorScheme.dark(
            secondary: Colors.blue,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            titleLarge: TextStyle(color: Colors.white),
          ),
        ),
        themeMode: ThemeMode.system,
        routerConfig: _router,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => StudentHomePage(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child:
          Text('Error: ${state.error}'), // Use state.error instead of errorCode
    ),
  ),
);
