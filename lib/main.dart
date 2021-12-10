import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication/formsubmissionStatus.dart';

import 'authentication/loginbloc/loginBloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => LoginBloc(),
        child: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return SafeArea(
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.formstatus is SubmissionSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(username: state.username!)));
          } else if (state is SubmissionFailed) {}
        },
        child: Scaffold(
          appBar: AppBar(),
          body: Container(
            child: Center(
              child: Card(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'enter email',
                            ),
                            validator: (value) => state.isValidusername
                                ? null
                                : "Username is too short",
                            onChanged: (value) => context
                                .read<LoginBloc>()
                                .add(LoginUsernameChanged(username: value)),
                          );
                        },
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: 'enter password',
                            ),
                            validator: (value) => state.isValidPassword
                                ? null
                                : "password is too short",
                            onChanged: (value) => context
                                .read<LoginBloc>()
                                .add(LoginPasswordChanged(password: value)),
                            obscureText: true,
                          );
                        },
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state.formstatus is FormSubmitting) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context
                                        .read<LoginBloc>()
                                        .add(LoginButtonSubmitted());
                                  }
                                },
                                child: Text(
                                  'Login',
                                  textScaleFactor: 3,
                                ));
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({required this.username, Key? key}) : super(key: key);
  final String username;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [Text('Welcome Back $username')],
      ),
    );
  }
}
