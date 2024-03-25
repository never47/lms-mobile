import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:lms_mobile/constants/api.dart';
import 'package:lms_mobile/screens/homepage.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  String? _username;
  String? _password;

  void onLogin(context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Map<String, Object> data = {
        "Username": _username!,
        "Password": _password!,
        "LanguageId": 1
      };

      try {
        Response response = await Dio().post(Api.session, data: data);

        if (response.statusCode != 200) {
          throw Exception('Something went wrong...');
        }

        var cookies = response.headers.map['set-cookie'];

        if (cookies != null) {
          print('Received Cookies: $cookies');
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => HomePage(
              name: response.data['username'],
            ),
          ),
        );
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.all(70),
        child: Column(
          children: [
            TextFormField(
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              decoration: const InputDecoration(
                labelText: 'Username:',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Can\'t be empty';
                }
                if (value.length != 11) {
                  return 'Length must be equal to 11.';
                }
                return null;
              },
              onSaved: (value) => _username = value!,
            ),
            TextFormField(
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              decoration: const InputDecoration(
                labelText: 'Password:',
              ),
              obscureText: true,
              onSaved: (value) => _password = value!,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(
              onPressed: () {
                onLogin(context);
              },
              icon: const Icon(Icons.login),
              label: const Text('LOGIN'),
            )
          ],
        ),
      ),
    );
  }
}
