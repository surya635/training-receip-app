import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/screen/login_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: Text('Log Out'),
                    content: Text('Apakah anda ingin Logout ?'),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () => Navigator.pop(context, 'Batal'),
                          child: Text('Batal')),
                      TextButton(
                        child: Text('Keluar'),
                        onPressed: () {
                          FirebaseAuth.instance.signOut().then((value) {
                            print("Sign Out");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPageWidget()));
                          });
                        },
                      )
                    ],
                  )),
          child: Text('Log Out')),
    );
    // return Scaffold(
    //   body: Center(
    //     child: ElevatedButton(
    //       child: Text("Logout"),
    //       onPressed: () {
    //         FirebaseAuth.instance.signOut().then((value) {
    //           print("Sign Out");
    //           Navigator.push(context,
    //               MaterialPageRoute(builder: (context) => LoginPageWidget()));
    //         });
    //       },
    //     ),
    //   ),
    // );
  }
}
