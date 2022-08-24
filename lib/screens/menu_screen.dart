import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String selectedIndex = "";
  List<MenuListItem> menuList = [
    MenuListItem("Home", Icons.home_filled),
    MenuListItem("Artist", Icons.perm_identity_outlined),
    MenuListItem("Popular", Icons.auto_graph_outlined),
    MenuListItem("My Music", Icons.folder_shared),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF25073E),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
              ),
              Container(
                  clipBehavior: Clip.antiAlias,
                  height: 100,
                  width: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25)),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: 30,
              ),
              const Text(
                "Hi!",
                style: TextStyle(color: Colors.white54),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Texas",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                  itemCount: menuList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = menuList[index];
                    return ListTile(
                      onTap: () {
                        setState(() {
                          selectedIndex = item.name!;
                          print(item.name);
                        });
                      },
                      leading: Icon(
                        item.icon,
                        shadows: selectedIndex == item.name
                            ? [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.8),
                                  spreadRadius: 4,
                                  blurRadius: 40,
                                  offset: Offset(0, 3),
                                )
                              ]
                            : [],
                        color: selectedIndex == item.name
                            ? Colors.white
                            : Colors.white54,
                      ),
                      title: Text(
                        item.name!,
                        style: TextStyle(
                            color: selectedIndex == item.name
                                ? Colors.white
                                : Colors.white54),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class MenuListItem {
  final String? name;
  final IconData? icon;

  MenuListItem(this.name, this.icon);
}
