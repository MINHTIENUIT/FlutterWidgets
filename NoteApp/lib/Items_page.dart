import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Items extends StatelessWidget {
  static final String route = '/Items';

  static final List<Device> items = [
    Device(name: "Device 1", ipAddress: InternetAddress("192.168.1.1"), sensors: sensors),
    Device(name: "Device 2", ipAddress: InternetAddress("192.168.1.2"), sensors: sensors),
    Device(name: "Device 3", ipAddress: InternetAddress("192.168.1.3")),
  ];

  static final List<Sensor> sensors = [
    Sensor(name: "Temperature", valueLifeTime: 10),
    Sensor(name: "Humidity", valueLifeTime: 10),
    Sensor(name: "Light", valueLifeTime: 10),
    Sensor(name: "Rain", valueLifeTime: 10),
    Sensor(name: "UV", valueLifeTime: 10),
    Sensor(name: "Air", valueLifeTime: 10),
    Sensor(name: "Atmosphere", valueLifeTime: 10),
    Sensor(name: "PH", valueLifeTime: 10)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Devices'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.white,),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                    return CardItem(item: items[index],);
                },
                childCount: items.length
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final Device item;
  CardItem({this.item});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Card(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 50,
                    padding: EdgeInsets.all(3),
                    child: Image.network(item.imageUrl, fit: BoxFit.cover,),
                  )
                ],
              ),
              Container(height: 1, color: Colors.grey[200],),
              Container(
                height: 100,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index){
                            return Center(
                              child: Container(

                              )
                            );
                          },
                        childCount: item.sensors.length
                      ),
                    )
                  ]
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}

class Sensor {
  final String name;
  final double valueLifeTime;
  List<double> arrayValue;

  Sensor({@required this.name, this.valueLifeTime = 0.0, this.arrayValue = const <double>[]});
}

class Command {
  String name;
  String command;
  String description;

  Command({@required this.name, this.command = "", this.description = ""});
}

class Device {
  String name;
  InternetAddress ipAddress;
  String imageUrl;
  bool status;

  final List<Sensor> sensors;
  final List<Command> commands;
  
  Device({@required this.name, @required this.ipAddress, this.imageUrl = "https://www.ajactraining.org/wp-content/uploads/2019/09/image-placeholder.jpg", this.sensors = const <Sensor>[], this.commands = const <Command>[]});
  
  void addSensor(Sensor sensor){
    sensors.add(sensor);
  }
  
  void addCommand(Command command){
    this.commands.add(command);
  }
  
}