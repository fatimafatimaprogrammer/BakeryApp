import 'package:flutter/material.dart';

import 'home.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login';

  const LoginScreen({super.key});
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHidden = true;
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  String? _validateEmail(value) {
    if (value!.isEmpty) return 'Enter email address';
    final regex = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(value) {
    if (value!.isEmpty) return 'Enter password';
    final regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (!regex.hasMatch(value)) {
      return 'Password must be at least 8 charactes long containing at least one uppercase letter, one number and one special character';
    }
    return null;
  }

  void _validate() {
    final form = _formKey.currentState;
    if (!form!.validate()) {
      return;
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),

        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(color: Colors.white),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                          height: 70
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: Image.asset('images/Logo.png')),
                      SizedBox(
                        height: 100
                      ),
                      TextFormField(

                        validator: _validateEmail,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          prefixIcon:
                              Icon(Icons.mail_outline, color: Colors.grey),
                          border: UnderlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                      TextFormField(
                        validator: _validatePassword,
                        obscureText: _isHidden,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.grey),
                          suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              _isHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          border: const UnderlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value!;
                                  });
                                },
                              ),
                              const Text('Remember me'),
                            ],
                          ),
                          Text('Forget Password',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor)),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          )),
                          onPressed: _validate,
                          child: const Text('Login'),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
