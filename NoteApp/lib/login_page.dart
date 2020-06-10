import 'package:NoteApp/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  static final String route = '/LoginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(),
                form(),
                signUP(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginLogo() {
    var height = MediaQuery.of(context).size.height;
    return Container(
      child: Text(
        'Login',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget form() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: loginLogo()),
              SizedBox(
                height: 40,
              ),
              Text('Email'),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Type your email',
                      prefixIcon: Icon(Icons.email),
                      border: UnderlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Password'),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Type your password',
                    prefixIcon: Icon(Icons.vpn_key),
                    border: UnderlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {},
                  child: Container(
                      width: double.infinity,
                      child: Text(
                        'Forgot password?',
                        textAlign: TextAlign.right,
                      ))),
              SizedBox(
                height: 30,
              ),
              Center(
                child: RaisedButton(
                  color: Colors.blue,
                  child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.white),
                      )),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)),
                  onPressed: () => {},
                ),
              ),
              otherLoginPlatform(),
            ],
          ),
        ),
      ),
    );
  }

  Widget otherLoginPlatform() {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Text('Or Sign Up Using'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.indigo,
                ),
                onPressed: () => {},
              ),
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.twitter,
                  color: Colors.blue,
                ),
                onPressed: () => {},
              ),
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.google,
                  color: Colors.redAccent,
                ),
                onPressed: () => {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget signUP() {
    return Container(
        child: Column(
      children: <Widget>[
        Text('Have not account yet?'),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(SignUpPage.route);
          },
          child: Text(
            'SIGN UP',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    ));
  }
}
