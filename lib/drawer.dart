import 'dart:convert';

import 'package:cheki_keja/createApartment.dart';
import 'package:cheki_keja/favorites.dart';
import 'package:cheki_keja/map.dart';
import 'package:cheki_keja/myhouse.dart';
import 'package:cheki_keja/networkApi.dart';
import 'package:cheki_keja/userClass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Draw extends StatefulWidget {
  const Draw({Key key}) : super(key: key);

  @override
  _DrawState createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseUser fireuser;
  User user;
  bool signed_in = false;
  SharedPreferences prefs;
  

  @override
  void initState() {
    initPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          signed_in
              ? Center(
                  child: UserAccountsDrawerHeader(
                    currentAccountPicture: prefs.getString('photo') != null
                        ? Image.network(prefs.getString('photo'))
                        : Icon(Icons.account_circle),
                    accountEmail: Text(prefs.getString('email')),
                    accountName: Text(prefs.getString('name')),
                  ),
                )
              : DrawerHeader(
                  child: OutlineButton(
                    splashColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    highlightElevation: 0,
                    borderSide: BorderSide(color: Colors.grey),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                              image: AssetImage('assets/images/google_logo'),
                              height: 35.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    onPressed: () {
                      signInWithGoogle();
                    },
                  ),
                ),
          ListTile(
              title: Text('Favorites'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => favorites()),
                );
              }),
          ListTile(
            title: Text('My apartment'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => myhouse())),
          ),
          Divider(),
          ListTile(
            title: Text('Complains'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => myhouse())),
          ),
          Divider(),
          ListTile(
            title: Text('Close'),
            trailing: Icon(Icons.close),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    
    );
  }

  void signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    fireuser = authResult.user;

    assert(!fireuser.isAnonymous);
    assert(await fireuser.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(fireuser.uid == currentUser.uid);
    setState(() {
      fireuser = authResult.user;
      registerUser(fireuser);
    });
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Sign Out");
  }

  Future<void> registerUser(FirebaseUser fireuser) async {
    var result = await NetworkApi().registerUser(fireuser);
    var Map = json.decode(result);

    setState(() {
      user = User.fromJson(Map);
    });
    await prefs.setString('userId', user.id);
    await prefs.setString('name', user.name);
    await prefs.setString('email', user.email);
    await prefs.setString('photo', user.photo);
    await prefs.setBool('issignedin', true);
    setState(() {
      signed_in = prefs.getBool('issignedin');
    });
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      if (!prefs.containsKey('issignedin')) {
        prefs.setBool('issignedin', false);
        signed_in = false;
      } else {
        signed_in = prefs.getBool('issignedin');
      }
    });
  }
}
