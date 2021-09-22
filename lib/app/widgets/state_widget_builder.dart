import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:urbe_example/app/modules/global_controller.dart';

class StateWidgetBuilder {
  static Widget loadingView(bool shown) {
    return Positioned(
      child: shown
          ? Container(
              child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blue))),
              color: Colors.white.withOpacity(0.8),
            )
          : Container(),
    );
  }

  static Widget drawerLogged(Function onLogOut, String username) {
    return GetBuilder<GlobalController>(
        builder: (_) => Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    child: FlutterLogo(),
                  ),
                  ListTile(
                    title: Text(
                      "Mode: ",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: Text(
                      _.darkMode.value ? "Dark" : "Light",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Theme Mode",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: Switch(
                      value: _.darkMode.value,
                      onChanged: (bool) {
                        _.changeThemeMode();
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      '$username',
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.exit_to_app),
                      onPressed: onLogOut,
                    ),
                  )
                ],
              ),
            ));
  }

  static Widget drawer() {
    return GetBuilder<GlobalController>(
        builder: (_) => Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    child: FlutterLogo(),
                  ),
                  ListTile(
                    title: Text(
                      "Mode: ",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: Text(
                      _.darkMode.value ? "Dark" : "Light",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Theme Mode",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: Switch(
                      value: _.darkMode.value,
                      onChanged: (bool) {
                        _.changeThemeMode();
                      },
                    ),
                  )
                ],
              ),
            ));
  }
}
