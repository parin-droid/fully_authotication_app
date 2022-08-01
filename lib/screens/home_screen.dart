import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Color> colorList = [
    Colors.deepPurpleAccent,
    Colors.redAccent,
    Colors.amber
  ];
  int index = 0;
  List<Alignment> alignmentList = [
    Alignment.topRight,
    Alignment.topLeft,
    Alignment.bottomLeft,
    Alignment.bottomRight,
  ];
  Color bottomColor = Colors.redAccent;
  Color topColor = Colors.deepPurpleAccent;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*BottomSheet(
          onClosing: () {},
          builder: (context) => Container(
            decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.vertical(top: )
                ),
                height: 350,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Morning",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            "6 AM - 12 PM",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),*/
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              iconSize: 30.0,
              selectedFontSize: 10.0,
              unselectedFontSize: 10.0,
              selectedItemColor: Colors.orange,
              items: const [
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Icon(Icons.circle_outlined),
                    ),
                    label: "DASHBOARD"),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Icon(Icons.bar_chart),
                    ),
                    label: "MY PROGRESS"),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Icon(Icons.favorite_border),
                    ),
                    label: "COMMUNITY"),
              ]),
        ),
        body: DraggableHome(
            curvedBodyRadius: 30,
            headerExpandedHeight: 0.5,
            backgroundColor: Colors.white,
            title: const Text(""),
            headerWidget: AnimatedContainer(
              duration: Duration(milliseconds: 2),
              onEnd: () {
                setState(() {
                  index = index + 1;
                  bottomColor = colorList[index % colorList.length];
                  topColor = colorList[(index + 1) % colorList.length];
                });
              },
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [bottomColor, topColor])),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 35.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                        ),
                        Icon(
                          Icons.notifications,
                          size: 35,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  CircularPercentIndicator(
                    radius: 80,
                    percent: 0.25,
                    backgroundColor: Colors.grey,
                    lineWidth: 10.0,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "TODAY",
                          style: TextStyle(fontSize: 15, color: Colors.white54),
                        ),
                        Text(
                          "2 / 9",
                          style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70),
                        )
                      ],
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.amber,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  const Text("PHASE ONE : NEW MOON"),
                ],
              ),
            ),
            body: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Morning",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "6 AM - 12 PM",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: ListTile(
                  title: Text("6:00 AM",
                      style: TextStyle(color: Colors.grey, fontSize: 13)),
                  subtitle: Text(
                    "Drink a glass of water",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  leading: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Icon(
                      Icons.done,
                      color: Colors.orange,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: ListTile(
                  title: Text("6:15 AM",
                      style: TextStyle(color: Colors.grey, fontSize: 13)),
                  subtitle: Text(
                    "Take a cold shower",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  leading: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Icon(
                      Icons.shower_outlined,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: ListTile(
                  title: Text("7:00 AM",
                      style: TextStyle(color: Colors.grey, fontSize: 13)),
                  subtitle: Text(
                    "Get Some Exercise",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  leading: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Icon(
                      Icons.directions_run_sharp,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: ListTile(
                  title: Text("MORNING",
                      style: TextStyle(color: Colors.grey, fontSize: 13)),
                  subtitle: Text(
                    "Drink Green Tea",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  leading: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Icon(
                      Icons.coffee_sharp,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ]));
  }
}
