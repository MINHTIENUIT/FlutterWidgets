import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  static final String route = '/EditProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: form(context)
      ),
    );
  }

  Widget form(BuildContext context){
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Your Name'),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Type your name',
                    prefixIcon: Icon(Icons.account_circle),
                    border: UnderlineInputBorder()
                ),
              ),
            ),
            Text('Your Job'),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Type Your Job',
                    prefixIcon: Icon(Icons.bubble_chart),
                    border: UnderlineInputBorder()
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text('Your Phone'),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: 'Type your phone',
                    prefixIcon: Icon(Icons.phone_android),
                    border: UnderlineInputBorder()
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text('About You'),
            Container(
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Type yourself',
                    prefixIcon: Icon(Icons.person),
                    border: UnderlineInputBorder()
                ),
              ),
            ),
            SizedBox(height: 40,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width/4,
                    child: RaisedButton(
                      onPressed: (){},
                      color: Colors.blue,
                      child: Text('SAVE', style: TextStyle(color: Colors.white),),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width/4,
                    child: RaisedButton(
                      onPressed: (){},
                      color: Colors.blue,
                      child: Text('CANCEL', style: TextStyle(color: Colors.white),),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
