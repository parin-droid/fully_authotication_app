import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:fully_authotication_app/utils/sliderList.dart';

class DemoScreen2 extends StatefulWidget {
  final String? audio;
  final List<SliderList> list;
  final int index;
  final AudioPlayer audioPlayer;
  bool isPlay;
  final bool? isActive;

  DemoScreen2({
    Key? key,
    this.audio,
    required this.isPlay,
    required this.audioPlayer,
    required this.list,
    required this.index,
    this.isActive,
  }) : super(key: key);

  @override
  State<DemoScreen2> createState() => _DemoScreen2State();
}

class _DemoScreen2State extends State<DemoScreen2> {
  String path = "";
  List<SliderItem> sliderList = [
    SliderItem(
        "https://i.pinimg.com/236x/68/d4/d6/68d4d699e52690575178891f9a3cd17e.jpg",
        "Musik Pagi",
        12),
    SliderItem(
        "https://w0.peakpx.com/wallpaper/156/705/HD-wallpaper-purple-flowers-design-purple-flowers-design-art-background.jpg",
        "Musik Anu",
        22),
    SliderItem(
        "https://is5-ssl.mzstatic.com/image/thumb/Purple124/v4/ff/a1/b9/ffa1b949-1081-5a64-022b-1fb7d4c74299/source/512x512bb.jpg",
        "Imran khan",
        15),
    SliderItem(
        "https://img.freepik.com/free-vector/copy-space-violet-wavy-shapes-background_23-2148403375.jpg?w=2000",
        "Honey Singh",
        18),
    SliderItem(
        "https://files.123freevectors.com/wp-content/original/14693-violet-background-design.jpg",
        "Badshah",
        26),
  ];

  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  Duration currentPosition = Duration();
  Duration duration1 = Duration();
  AudioPlayer audioPlayer = AudioPlayer();

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  /* void getData() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      currentPosition = Duration(milliseconds: widget.currentPosition);
      duration1 = Duration(milliseconds: widget.duration);
      setState(() {
        position = currentPosition;
        duration = duration1;
      });
    });
  }*/

  @override
  void initState() {
    //getData();
    super.initState();
    widget.audioPlayer.onDurationChanged.listen((newDuration) {
      if (mounted) {
        setState(() {
          duration = newDuration;
        });
      }
    });

    widget.audioPlayer.onAudioPositionChanged.listen((newposition) {
      if (mounted) {
        setState(() {
          position = newposition;
        });
      }
    });
    widget.audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        position = Duration.zero;
        widget.audioPlayer.stop();
        sliderList1[widget.index].isPlaying = false;
      });
    });
    setAudio();
  }

  Future setAudio() async {
    final player = AudioCache(prefix: 'assets/songs/');
    final url = await player.load(widget.list[widget.index].audio!);
    path = url.path;
    widget.audioPlayer.setUrl(url.path, isLocal: true);

    if (widget.isActive == false) {
      widget.audioPlayer.play(path);
      setState(() {
        sliderList1[widget.index].isPlaying = true;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DraggableHome(
          curvedBodyRadius: 30,
          headerExpandedHeight: 0.1,
          title: const Text("Texas"),
          headerWidget: const SizedBox(),
          body: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                        aspectRatio: 1.2,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        initialPage: 2),
                    items: widget.list
                        .map((e) => Container(
                              clipBehavior: Clip.antiAlias,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40)),
                              child: Image.network(
                                e.image!,
                                fit: BoxFit.cover,
                              ),
                            ))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.list[widget.index].name!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.list[widget.index].details!,
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Slider(
                      min: 0.0,
                      activeColor: const Color(0xFFB459FE),
                      inactiveColor: const Color(0xFFF3E8FF),
                      thumbColor: const Color(0xFFB459FE),
                      max: duration.inSeconds.toDouble(),
                      value: position.inSeconds.toDouble(),
                      onChanged: (val) async {
                        final position = Duration(seconds: val.toInt());
                        await widget.audioPlayer.seek(position);
                        await widget.audioPlayer.resume();
                        setState(() {
                          sliderList1[widget.index].isPlaying = true;
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(formatTime(position)),
                        Text(formatTime(duration - position)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.skip_previous,
                            size: 30,
                            color: Color(0xFFB459FE),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (widget.isActive == true) {
                            if (sliderList1[widget.index].isPlaying == false) {
                              widget.audioPlayer.play(path);
                              setState(() {
                                sliderList1[widget.index].isPlaying = true;
                              });
                            } else {
                              widget.audioPlayer.pause();
                              setState(() {
                                sliderList1[widget.index].isPlaying = false;
                              });
                            }
                          } else {
                            if (sliderList1[widget.index].isPlaying == false) {
                              widget.audioPlayer.resume();
                              setState(() {
                                sliderList1[widget.index].isPlaying = true;
                              });
                            } else {
                              widget.audioPlayer.pause();
                              setState(() {
                                sliderList1[widget.index].isPlaying = false;
                              });
                            }
                          }
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: const Color(0xFFB459FE),
                              borderRadius: BorderRadius.circular(30)),
                          child: sliderList1[widget.index].isPlaying == true
                              ? const Icon(
                                  Icons.pause,
                                  size: 40,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.play_arrow,
                                  size: 40,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.skip_next,
                            size: 30,
                            color: Color(0xFFB459FE),
                          )),
                    ],
                  ),
                ],
              ),
            )
          ]),
    );
  }
}

class SliderItem {
  final String? image;
  final String? name;
  final int? qty;

  SliderItem(
    this.image,
    this.name,
    this.qty,
  );
}
