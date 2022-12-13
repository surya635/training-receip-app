import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/model/post_model.dart';
import 'package:food_app/screen/card.dart';
import 'package:food_app/screen/login_page.dart';
import 'package:food_app/screen/settings_page.dart';
import 'package:food_app/screen/theme.dart';
import 'package:food_app/service/http_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HttpService httpService = HttpService();

  List<Posts> _list = [];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipe();
  }

  Future<void> getRecipe() async {
    _list = await HttpService.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
        ),
        drawer: Drawer(
            child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Center(
                child: Text(
                  'Food',
                  style: poppinsTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout_rounded),
              title: Text('Logout'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage()));
              },
            )
          ],
        )),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return Menucard(
                    title: _list[index].name,
                    cookTime: _list[index].totalTime,
                    rating: _list[index].rating.toString(),
                    thumbnailUrl: _list[index].images,
                  );
                },
              ));
  }

  //backgroundColor: Colors.grey,
  // bottomNavigationBar: BottomNavigationBar(
  //   items: [
  //     BottomNavigationBarItem(
  //       icon: Icon(Icons.home),
  //       backgroundColor: Colors.white,
  //     ),
  //     BottomNavigationBarItem(
  //       icon: Icon(Icons.favorite_rounded),
  //       backgroundColor: Colors.white,
  //     ),
  //     BottomNavigationBarItem(
  //       icon: Icon(Icons.settings),
  //       backgroundColor: Colors.white,
  //     )
  //   ],
  // ),
}
