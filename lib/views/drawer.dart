import 'dart:convert';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/models/userClass.dart' as myuser;
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cheki_keja/ui/favorites.dart';
import 'package:cheki_keja/ui/myhouse.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cheki_keja/management/management.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Draw extends StatefulWidget {
  const Draw({Key key}) : super(key: key);

  @override
  _DrawState createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  auth.User fireuser;
  myuser.User user;
  bool signed_in = false;

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
                  currentAccountPicture: sharedPreferences.getPhoto() != null
                      ? Image.network(sharedPreferences.getPhoto())
                      : Icon(Icons.account_circle),
                  accountEmail: Text(sharedPreferences.getEmail()),
                  accountName: Text(
                    sharedPreferences.getFirstname(),
                  ),
                ))
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
    var googleSignInAccount = await googleSignIn.signIn();
    var googleSignInAuthentication = await googleSignInAccount.authentication;

    var credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    var authResult = await _auth.signInWithCredential(credential);
    fireuser = authResult.user;

    assert(!fireuser.isAnonymous);
    assert(await fireuser.getIdToken() != null);

    var currentUser = await _auth.currentUser;
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

  Future<void> registerUser(auth.User fireuser) async {
    var result = await NetworkApi().registerUser(fireuser);
    var Map = json.decode(result);

    setState(() {
      user = myuser.User.fromJson(Map);
    });
    sharedPreferences.setEmail(user.email);
    sharedPreferences.setUserId(user.id);
    sharedPreferences.setSignedIn(true);
    sharedPreferences.setFirstname(user.name);
    sharedPreferences.setPhoto(user.photo);
    setState(() {
      signed_in = sharedPreferences.getSignedIn();
    });
  }

  Future<void> initPrefs() async {
    setState(() {
      signed_in = sharedPreferences.checkSignedIn();
    });
  }
}
