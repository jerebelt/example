import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbe_example/app/widgets/state_widget_builder.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (_) => Scaffold(
              drawer: StateWidgetBuilder.drawer(),
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                title: Text('Login Page'),
                centerTitle: true,
              ),
              body: Center(
                child: Stack(children: [
                  ListView(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 35),
                          child: FlutterLogo(
                            size: 250,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: TextFormField(
                            onChanged: _.onUsernameChanged,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              hintText: 'Username',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: TextFormField(
                            onChanged: _.onPasswordChanged,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: '**********',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35),
                          child: ElevatedButton(
                              onPressed: () async {
                                _.startLoading();
                                await _.submit();
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              )),
                        )
                      ],
                    ),
                  ]),
                  StateWidgetBuilder.loadingView(_.loading),
                ]),
              ),
            ));
  }
}
