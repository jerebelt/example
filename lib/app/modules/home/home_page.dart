import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbe_example/app/modules/home/home_controller.dart';
import 'package:urbe_example/app/routes/app_pages.dart';
import 'package:urbe_example/app/routes/app_routes.dart';
import 'package:urbe_example/app/widgets/state_widget_builder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        persistentFooterButtons: [
          IconButton(icon: Icon(Icons.refresh), onPressed: _.loading ? null : _.reload),
          ElevatedButton.icon(
              onPressed: _.lastPage ? _.lastImgs : null,
              icon: Icon(Icons.arrow_back),
              label: Text(
                'Last Page',
                style: TextStyle(fontSize: 16),
              )),
          ElevatedButton.icon(
              onPressed: _.nextPage ? _.nextImgs : null,
              icon: Icon(Icons.arrow_forward),
              label: Text(
                'Next Page',
                style: TextStyle(fontSize: 16),
              )),
        ],
        drawer: StateWidgetBuilder.drawerLogged(_.logOut, _.username),
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: _.imgs.length,
              itemBuilder: (context, int index) => ListTile(
                onTap: () => Get.toNamed(AppRoutes.DETAILS, arguments: _.imgs.elementAt(index)),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(_.imgs.elementAt(index).downloadUrl),
                ),
                title: Text('${_.imgs.elementAt(index).author}'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            StateWidgetBuilder.loadingView(_.loading),
          ],
        ),
      ),
    );
  }
}
