import 'package:cheki_keja/views/inputFieldArea.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> 
with TickerProviderStateMixin {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  late AnimationController _loginButtonController;
  late Animation buttonSqueezeAnimation;
  var animationStatus = 0;

Future<Null> _playAnimation() async {
  try {
    await _loginButtonController.forward();
    await _loginButtonController.reverse();
  }
  on TickerCanceled{}
}

@override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }

  @override
  void initState() {
  super.initState();
  _loginButtonController = AnimationController(
    duration: Duration(milliseconds: 3000),
    vsync: this
  );
  buttonSqueezeAnimation= Tween(
          begin: 320.0,
          end: 70.0,
        )
            .animate(
           CurvedAnimation(
            parent: _loginButtonController,
            curve:  Interval(
              0.0,
              0.150,
            ),
          ),
        );
}
DecorationImage backgroundImage = DecorationImage(
  image: ExactAssetImage('assets/images/red0.jpg'),
  fit: BoxFit.cover,
);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
          image: backgroundImage),
          child: Column(children: <Widget>[
            		
		Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InputFieldArea(
                hint: 'Username',
                obscure: false,
                icon: Icons.person_outline,
              ),
               InputFieldArea(
                hint: 'Password',
                obscure: true,
                icon: Icons.lock_outline,
              ),
            ],
          )
        ),
                      InkWell(
             child: Container(
  width: buttonSqueezeAnimation.value,
  height: 60.0,
  alignment: FractionalOffset.center,
  decoration:  BoxDecoration(
    color: const Color.fromRGBO(247, 64, 106, 1.0),
    borderRadius:  BorderRadius.all(const Radius.circular(30.0))
  ),
  child: buttonSqueezeAnimation.value > 75.0 ? Text(
    'Sign In',
    style:  TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w300,
        letterSpacing: 0.3,
    ),
  ) :  CircularProgressIndicator(
    valueColor:  AlwaysStoppedAnimation<Color>(
        Colors.white
    ),
  )
),
             onTap: () {
                  setState(() {
                  animationStatus = 1;
                  });
                  _playAnimation();
               },
             )
          ],
          ),
          )
    ); 
 }
}