import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:fully_authotication_app/providers/index_provider.dart';
import 'package:fully_authotication_app/providers/songs_provider.dart';
import 'package:fully_authotication_app/repositry/login_repositry.dart';
import 'package:fully_authotication_app/screens/demo_screen2.dart';
import 'package:fully_authotication_app/utils/mytheme.dart';
import 'package:fully_authotication_app/utils/sliderList.dart';
import 'package:provider/provider.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlay = false;
  bool isLoading = true;
  bool isOpen = false;
  int currentIndex = 0;
  int mainIndex = 0;
  List<SliderList> sliderList = [
    SliderList(
        image:
            "https://i2.wp.com/www.freshfmnigeria.com/wp-content/uploads/2022/01/top-ten.jpg?resize=640%2C360&ssl=1",
        name: "Top 10 Bollywood",
        qty: 10,
        audio: 'demo.mpeg',
        isPlaying: false),
    SliderList(
        image:
            "https://media.npr.org/assets/img/2019/12/05/npr-2019-music_songs_bkou-16x9_wide-ad0cbb94578350c959c86897995df63f391b633a-s1300-c85.webp",
        name: "Best songs 2019",
        qty: 22,
        audio: 'demo2.mpeg',
        isPlaying: false),
    SliderList(
        image:
            "https://www.myweddingsongs.com/wp-content/uploads/2018/03/journey-songs.jpg",
        name: "Top 10 Journey",
        qty: 15,
        audio: 'demo3.mpeg',
        isPlaying: false),
    /*  SliderList(
        image:
            "https://img.freepik.com/free-vector/copy-space-violet-wavy-shapes-background_23-2148403375.jpg?w=2000",
        name: "Honey Singh",
        qty: 18,
        audio: 'demo4.mpeg',
        isPlaying: false),
    SliderList(
        image:
            "https://files.123freevectors.com/wp-content/original/14693-violet-background-design.jpg",
        name: "Badshah",
        qty: 26,
        audio: 'demo5.mpeg',
        isPlaying: false),*/
  ];

  @override
  void initState() {
    super.initState();
  }

  Future setAudio() async {
    final player = AudioCache(prefix: 'assets/songs/');
    final url = await player.load(sliderList1[currentIndex].audio!);
    audioPlayer.setUrl(url.path, isLocal: true);
  }

  @override
  void dispose() {
    audioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final songIndex = context.watch<IndexProvider>();
    final songProvider = context.watch<SongProvider>();
    final Repository repository;
    final provider = context.read<MyTheme>();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () async {
          /* int cuttentPosition = await audioPlayer.getCurrentPosition();
          int duration = await audioPlayer.getDuration();
          print(cuttentPosition);
          print("duration : $duration");*/
          if (songProvider.songModel!.mainList![mainIndex]
                  .sliderList![songIndex.currentIndex].isPlaying ==
              true) {
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DemoScreen2(
                          isPlay: songProvider.songModel!.mainList![mainIndex]
                              .sliderList![songIndex.currentIndex].isPlaying!,
                          audioPlayer: audioPlayer,
                          list: songProvider
                              .songModel!.mainList![mainIndex].sliderList!,
                          isActive: true,
                          index: songIndex.currentIndex,
                        )));
            setState(() {});
          } else {
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DemoScreen2(
                          isPlay: songProvider.songModel!.mainList![mainIndex]
                              .sliderList![songIndex.currentIndex].isPlaying!,
                          audioPlayer: audioPlayer,
                          list: songProvider
                              .songModel!.mainList![mainIndex].sliderList!,
                          isActive: true,
                          index: songIndex.currentIndex,
                        )));
            setState(() {});
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: Colors.transparent,
            elevation: 8,
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFF25073E),
                  borderRadius: BorderRadius.circular(25)),
              child: ListTile(
                leading: Container(
                  clipBehavior: Clip.antiAlias,
                  height: 50,
                  width: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25)),
                  child: Image.network(
                    songProvider.songModel!.mainList![mainIndex]
                        .sliderList![songIndex.currentIndex].image!,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  songProvider.songModel!.mainList![mainIndex]
                      .sliderList![songIndex.currentIndex].name!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  songProvider.songModel!.mainList![mainIndex]
                      .sliderList![songIndex.currentIndex].details!,
                  style: const TextStyle(color: Colors.grey),
                ),
                trailing: GestureDetector(
                  onTap: () async {
                    setState(() {
                      songProvider.songModel!.mainList![mainIndex]
                              .sliderList![songIndex.currentIndex].isPlaying =
                          !songProvider.songModel!.mainList![mainIndex]
                              .sliderList![songIndex.currentIndex].isPlaying!;
                    });
                    int duration2 = await audioPlayer.getDuration();
                    if (songProvider.songModel!.mainList![mainIndex]
                            .sliderList![songIndex.currentIndex].isPlaying ==
                        true) {
                      String url =
                          "https://samplelib.com/lib/preview/mp3/sample-15s.mp3";
                      await audioPlayer.resume();
                      audioPlayer.onPlayerStateChanged.listen((event) {
                        if (event == PlayerState.COMPLETED) {
                          setState(() {
                            songProvider
                                .songModel!
                                .mainList![mainIndex]
                                .sliderList![songIndex.currentIndex]
                                .isPlaying = false;
                          });
                        }
                      });
                      print("song play");
                    } else {
                      await audioPlayer.pause();
                      print("song Pause");
                    }
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: songProvider
                                .songModel!
                                .mainList![mainIndex]
                                .sliderList![songIndex.currentIndex]
                                .isPlaying ==
                            true
                        ? const Icon(
                            Icons.pause,
                            color: Color(0xFFB459FE),
                          )
                        : const Icon(
                            Icons.play_arrow,
                            color: Color(0xFFB459FE),
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: DraggableHome(
          curvedBodyRadius: 30,
          headerExpandedHeight: 0.25,
          title: const Text("Texas"),
          headerWidget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          ZoomDrawer.of(context)!.toggle();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Good Morning!",
                  style: TextStyle(color: Colors.white54),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Texas",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          body: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Playlist",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See more",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 230,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: sliderList.length,
                        itemBuilder: (context, index) {
                          final item = sliderList[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  mainIndex = index;
                                });
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Image.network(
                                      item.image!,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    left: 5,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 10.0, sigmaY: 10.0),
                                        child: Container(
                                          height: 70,
                                          width: 190,
                                          decoration: BoxDecoration(
                                              color: Colors.black45
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      item.name!,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "♫ ${item.qty} Tracks",
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                  width: 40,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: const Icon(
                                                    Icons.play_arrow,
                                                    color: Color(0xFFB459FE),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Recently Played",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See more",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: songProvider
                          .songModel!.mainList![mainIndex].sliderList!.length,
                      itemBuilder: (context, index) {
                        final item = songProvider
                            .songModel!.mainList![mainIndex].sliderList![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 10),
                          child: ListTile(
                            onTap: () async {
                              if (audioPlayer.state == PlayerState.PLAYING) {
                                audioPlayer.stop();
                                setState(() {
                                  currentIndex = index;
                                });
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DemoScreen2(
                                              /* audio:
                                                    sliderList1[index].audio!,*/
                                              isPlay: item.isPlaying!,
                                              audioPlayer: audioPlayer,
                                              isActive: false,
                                              list: songProvider
                                                  .songModel!
                                                  .mainList![mainIndex]
                                                  .sliderList!,
                                              index: index,
                                            )));
                                setState(() {});
                              } else {
                                setState(() {
                                  currentIndex = index;
                                  item.isPlaying = !item.isPlaying!;
                                });
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DemoScreen2(
                                              /*  audio:
                                                    sliderList[index].audio!,*/
                                              isPlay: item.isPlaying!,
                                              audioPlayer: audioPlayer,
                                              isActive: false,
                                              list: songProvider
                                                  .songModel!
                                                  .mainList![mainIndex]
                                                  .sliderList!,
                                              index: index,
                                            )));
                                setState(() {});
                              }
                            },
                            leading: Container(
                              clipBehavior: Clip.antiAlias,
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25)),
                              child: Image.network(
                                item.image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              item.name!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              item.details!,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert),
                            ),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            )
          ]),
    );
  }
}
