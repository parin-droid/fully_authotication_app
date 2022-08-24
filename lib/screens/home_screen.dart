import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fully_authotication_app/utils/mytheme.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';

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
  List<Color> darkColorList = [
    Colors.indigo,
    Colors.grey.shade800,
    Colors.black54
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

  Color bottomColor1 = Colors.grey.shade800;
  Color topColor1 = Colors.indigo;

  String? demo = "English";
  List<String> language = ["English", "Hindi", "Chinese"];
  final translator = GoogleTranslator();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<MyTheme>();
    Future.delayed(const Duration(seconds: 2), () {
      if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
        setState(() {
          bottomColor1 = Colors.indigo;
        });
      } else {
        setState(() {
          bottomColor = Colors.redAccent;
        });
      }
    });
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
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? MyTheme.darkTheme.scaffoldBackgroundColor
                  : MyTheme.lightTheme.scaffoldBackgroundColor,
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              iconSize: 30.0,
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
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? MyTheme.darkTheme.backgroundColor
                : MyTheme.lightTheme.backgroundColor,
            title: const Text(""),
            headerWidget: AnimatedContainer(
              duration: const Duration(seconds: 2),
              onEnd: () {
                if (Theme.of(context).brightness == Brightness.dark) {
                  setState(() {
                    index = index + 1;
                    bottomColor1 = darkColorList[index % darkColorList.length];
                    topColor1 =
                        darkColorList[(index + 1) % darkColorList.length];
                  });
                } else {
                  setState(() {
                    index = index + 1;
                    bottomColor = colorList[index % colorList.length];
                    topColor = colorList[(index + 1) % colorList.length];
                  });
                }
              },
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: Theme.of(context).brightness == Brightness.dark
                          ? [bottomColor1, topColor1]
                          : [bottomColor, topColor])),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 35.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                        ),
                        DropdownButton(
                            value: demo,
                            items: language.map((String e) {
                              return DropdownMenuItem<String>(
                                  value: e, child: Text(e));
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                provider.global = value.toString();
                                print(provider.global);
                                demo = value.toString();
                              });
                            }),
                        Switch(
                            value: toggleTheme.value,
                            onChanged: (value) {
                              setState(() {
                                toggleTheme.value = value;
                              });
                            }),
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
                      children: [
                        FutureBuilder<String>(
                            future: provider.getData("TODAY"),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white54),
                                );
                              }
                              return CircularProgressIndicator();
                            }),
                        FutureBuilder<String>(
                            future: provider.getData("2 / 9"),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!,
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70),
                                );
                              }
                              return CircularProgressIndicator();
                            }),
                      ],
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? MyTheme.darkTheme.dividerColor
                            : MyTheme.lightTheme.dividerColor,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  FutureBuilder<String>(
                      future: provider.getData("PHASE ONE : NEW MOON"),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data!);
                        }
                        return CircularProgressIndicator();
                      }),
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
                  children: [
                    FutureBuilder<String>(
                        future: provider.getData("Morning"),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            );
                          }
                          return CircularProgressIndicator();
                        }),
                    FutureBuilder<String>(
                        future: provider.getData("6 AM - 12 PM"),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data!,
                              style: TextStyle(color: Colors.grey),
                            );
                          }
                          return CircularProgressIndicator();
                        }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListTile(
                  title: FutureBuilder<String>(
                      future: provider.getData("6:00 AM"),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data!,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13));
                        }
                        return CircularProgressIndicator();
                      }),
                  subtitle: FutureBuilder<String>(
                      future: provider.getData("Drink a glass of water"),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black),
                          );
                        }
                        return CircularProgressIndicator();
                      }),
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Icon(
                      Icons.done,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? MyTheme.darkTheme.indicatorColor
                          : MyTheme.lightTheme.indicatorColor,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListTile(
                  title: FutureBuilder<String>(
                      future: provider.getData("6:15 AM"),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data!,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13));
                        }
                        return CircularProgressIndicator();
                      }),
                  subtitle: FutureBuilder<String>(
                      future: provider.getData("Take a cold shower"),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black),
                          );
                        }
                        return CircularProgressIndicator();
                      }),
                  leading: const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Icon(
                      Icons.shower_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListTile(
                  title: FutureBuilder<String>(
                      future: provider.getData("7:00 AM"),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data!,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13));
                        }
                        return CircularProgressIndicator();
                      }),
                  subtitle: FutureBuilder<String>(
                      future: provider.getData("Get Some Exercise"),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black),
                          );
                        }
                        return CircularProgressIndicator();
                      }),
                  leading: const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Icon(
                      Icons.directions_run_sharp,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListTile(
                  title: FutureBuilder<String>(
                      future: provider.getData("MORNING"),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data!,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13));
                        }
                        return CircularProgressIndicator();
                      }),
                  subtitle: FutureBuilder<String>(
                      future: provider.getData("Drink Green Tea"),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black),
                          );
                        }
                        return CircularProgressIndicator();
                      }),
                  leading: const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Icon(
                      Icons.coffee_sharp,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                ),
              ),
            ]));
  }
}
