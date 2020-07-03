import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static final String route = '/ProfilePage';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Stack(
                children: <Widget>[

                ],
              ),
              background: Container(
                color: Colors.redAccent,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                  return Card(child: Container(
                    height: 50,
                      child: Text('This is a test $index')));
                },
              childCount: 20
            ),
          )
        ],
      ),
    );
  }
}
