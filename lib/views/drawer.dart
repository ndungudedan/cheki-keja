import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/models/user.dart' as myuser;
import 'package:cheki_keja/ui/about.dart';
import 'package:cheki_keja/ui/category.dart';
import 'package:cheki_keja/ui/contactus.dart';
import 'package:cheki_keja/ui/map.dart';
import 'package:cheki_keja/ui/terms.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cheki_keja/ui/favorites.dart';
import 'package:cheki_keja/ui/myhouse.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cheki_keja/management/management.dart';
import 'package:moor_db_viewer/moor_db_viewer.dart';

class Draw extends StatefulWidget {
  const Draw(
      {Key key,})
      : super(key: key);

  @override
  _DrawState createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  auth.User fireuser;
  myuser.User user;
  bool iscollapsed;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          sharedPreferences.getSignedIn()
              ? Center(
                  child: UserAccountsDrawerHeader(
                    margin: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.transparent
                    ),
                    currentAccountPicture:
                        sharedPreferences.getPhoto() != null
                            ? CircleAvatar(
                                radius: 30,
                                backgroundImage: CachedNetworkImageProvider(sharedPreferences.getPhoto()),)
                            : Icon(Icons.account_circle),
                    accountEmail: Text(sharedPreferences.getEmail(),style: TextStyle(color: Colors.white),),
                    accountName: Text(sharedPreferences.getFirstname(),style: TextStyle(color: Colors.white),),
                  ),
                )
              : DrawerHeader(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      color: Colors.white,
                      autofocus: true,
                      splashColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                                image: AssetImage(
                                    'assets/images/google_logo.png'),
                                height: 35.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red[600],
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
                ),
          Divider(
            color: Colors.white,
            height: 5,
          ),
          ListTile(
              title: Text(
                'Favorites',
                style: TextStyle(color: Colors.white),
              ),
             leading: Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            ),
              onTap: () {
Navigator.of(context).push(MaterialPageRoute(builder: (context) => MoorDbViewer(databasehelper)));
               /*  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favorites()), */
               // );
              }),
              ListTile(
              title: Text(
                'Category',
                style: TextStyle(color: Colors.white),
              ),
             leading: Icon(
              Icons.category_outlined,
              color: Colors.white,
            ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Category()),
                );
              }),
          ListTile(
              title: Text(
                'Map View',
                style: TextStyle(color: Colors.white),
              ),
             leading: Icon(
              Icons.map_outlined,
              color: Colors.white,
            ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Gmap()),
                );
              }),
          ListTile(
            title: Text('My apartment',
                style: TextStyle(color: Colors.white)),
            leading: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            onTap: () =>sharedPreferences.getSignedIn() ? Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => myhouse()))
                : dialog(),
          ),
          ListTile(
              leading: Icon(Icons.contact_phone,color: Colors.white,),
              title: Text('Contact us',style:TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ContactUs()));
              },
            ),
            ListTile(
              leading: Icon(Icons.read_more,color: Colors.white,),
              title: Text('Terms & Conditions',style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Terms()));
              },
            ),
            ListTile(
              leading: Icon(Icons.chrome_reader_mode_rounded,color: Colors.white,),
              title: Text('About',style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => About()));
              },
            ),
          Divider(
            color: Colors.white,
            height: 5,
          ),
         sharedPreferences.getSignedIn() ? ListTile(
            title: Text('Log out', style: TextStyle(color: Colors.white)),
            leading: Icon(
              Icons.settings_power,
              color: Colors.white,
            ),
            onTap: () => signOutGoogle(),
          ): SizedBox(),
         
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
    await googleSignIn.signOut().then((value) => {
      sharedPreferences.setSignedIn(false)
    });
    
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
   
  }
  void dialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Please Login to access this page.'),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
