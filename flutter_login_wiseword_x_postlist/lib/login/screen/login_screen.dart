import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_wiseword_x_postlist/login/cubit/login_cubit.dart';
import 'package:flutter_login_wiseword_x_postlist/login/screen/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login.png'),  // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Welcome text
            Positioned(
              left: 35,
              top: 130,
              child: Text(
                'Welcome\nBack',
                style: TextStyle(color: const Color.fromARGB(255, 80, 79, 79), fontSize: 33),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5,
                  left: 35,
                  right: 35,
                ),
                child: BlocProvider<LoginCubit>(
                  create: (context) => LoginCubit(
                    authRepository: RepositoryProvider.of<AuthRepository>(context),
                  ),
                  child: const LoginForm(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
