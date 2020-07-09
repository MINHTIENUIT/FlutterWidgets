import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfilePage extends StatefulWidget {
  static final String route = '/ProfilePage';
  final String avatarImageSrc = 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSGCQBY8CKewcbtUAnvzqmqXhnb8jXkkdhHyA&usqp=CAU';
  final String backgroundImageSrc = 'https://image.freepik.com/free-vector/global-technology_46706-709.jpg';
  final String title = "Van Minh Tien";
  final String subTitle = "Engineering";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ProfileHeader(
              avatarImage: Image.network(widget.avatarImageSrc).image,
              coverImage: Image.network(widget.backgroundImageSrc).image,
              title: widget.title,
              subtilte: widget.subTitle,
              actions: <Widget>[
                MaterialButton(
                  shape: CircleBorder(),
                  color: Colors.white,
                  child: Icon(Icons.edit, color: Colors.deepPurpleAccent,),
                  onPressed: (){},
                ),
              ],
            ),
            SizedBox(height: 10,),
            UserInfo(),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final ImageProvider<dynamic> coverImage;
  final ImageProvider<dynamic> avatarImage;
  final String title;
  final String subtilte;
  final List<Widget> actions;

  ProfileHeader({
    @required this.coverImage,
    @required this.avatarImage,
    @required this.title,
    this.subtilte,
    this.actions
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Ink(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(image: coverImage, fit: BoxFit.cover)
          ),
        ),
//        Ink(
//          height: 200,
//          decoration: BoxDecoration(
//            color: Colors.black38
//          ),
//        ),
        if (actions != null)
          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.only(bottom: 0.0, right: 0.0),
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions,
            ),
          ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 160),
          child: Column(
            children: <Widget>[
              Avatar(
                image: avatarImage,
                radius: 40,
                backgroundColor: Colors.white,
                borderColor: Colors.grey.shade300,
                borderWidth: 4.0,
              ),
              Center(
                child: ListTile(
                  title: Text(title, textAlign: TextAlign.center,),
                  subtitle: Text(subtilte ?? "", textAlign: TextAlign.center),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            alignment: Alignment.topLeft,
            child: Text(
              "User Information",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ...ListTile.divideTiles(
                        color: Colors.grey,
                        tiles: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            leading: Icon(Icons.my_location),
                            title: Text("Location"),
                            subtitle: Text("Ho Chi Minh City"),
                          ),
                          ListTile(
                            leading: Icon(Icons.email),
                            title: Text("Email"),
                            subtitle: Text("vanminhtien96@gmail.com"),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text("Phone"),
                            subtitle: Text("012345678"),
                          ),
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text("About Me"),
                            subtitle: Text(
                                "This is a about me link and you can khow about me in this section."),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}



class Avatar extends StatelessWidget {
  final ImageProvider<dynamic> image;
  final Color borderColor;
  final Color backgroundColor;
  final double radius;
  final double borderWidth;

  const Avatar({
    this.image,
    this.borderColor = Colors.grey,
    this.backgroundColor,
    this.radius = 30,
    this.borderWidth = 5
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Stack(
        children: <Widget>[
          Center(
            child: CircleAvatar(
              radius: radius + borderWidth,
              backgroundColor: borderColor,
              child: CircleAvatar(
                radius: radius,
                backgroundColor: backgroundColor != null ? backgroundColor: Theme.of(context).primaryColor,
                child: CircleAvatar(
                  radius: radius - borderWidth,
                  backgroundImage: image,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: Container(
              height: 30,
              child: MaterialButton(
                shape: CircleBorder(),
                color: Colors.white,
                child: Icon(Icons.camera_alt, color: Colors.deepPurpleAccent, size: 20,),
                onPressed: (){},
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: Container(
              height: 30,
              child: MaterialButton(
                shape: CircleBorder(),
                color: Colors.white,
                child: Icon(Icons.stars, color: Colors.orange,),
                onPressed: (){},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

