import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbe_example/app/widgets/state_widget_builder.dart';

import 'splash_controller.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('Splash Page'),
                centerTitle: true,
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}
