import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_test/features/atuhentication/data/auth_repository/auth_repository.dart';
import 'package:supabase_test/features/atuhentication/data/data_source.dart';
import 'package:supabase_test/features/atuhentication/data/remote/supabase_services.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // this is Dependency injection
  AuthRepository aR = AuthRepository(dataSource: SupaBaseServices());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(helperText: 'email'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(helperText: 'password'),
              ),
              MaterialButton(
                onPressed: () async {
                  await aR.signUp(
                    emailController.text,
                    passwordController.text,
                  ).then((val){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Sign Up Success'))
                    );

                  });

                },
                child: Text('Sign up'),
              ),
              MaterialButton(
                onPressed: () async {
                  await aR.signIn(
                    emailController.text,
                    passwordController.text,
                  ).then((val){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Sign In Success'))
                    );

                  });
                },
                child: Text('Sign in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
