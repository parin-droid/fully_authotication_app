class SliderList {
  final String? image;
  final String? name;
  final String? details;
  final int? qty;
  final String? audio;
  bool isPlaying = false;
  SliderList(
      {this.image,
      this.details,
      this.name,
      this.qty,
      this.audio,
      this.isPlaying = false});
}

class SliderMainList {
  final List<SliderList>? sliderList;

  SliderMainList(this.sliderList);
}

List<SliderMainList> mainList = [
  SliderMainList(sliderList1),
  SliderMainList(sliderList2),
  SliderMainList(sliderList3),
];

List<SliderList> sliderList1 = [
  SliderList(
      image:
          "https://i.pinimg.com/236x/68/d4/d6/68d4d699e52690575178891f9a3cd17e.jpg",
      name: "Musik Pagi",
      details: "Mamank * Popular Song",
      qty: 12,
      audio: 'demo.mpeg',
      isPlaying: false),
  SliderList(
      image:
          "https://w0.peakpx.com/wallpaper/156/705/HD-wallpaper-purple-flowers-design-purple-flowers-design-art-background.jpg",
      name: "Musik Anu",
      details: "Techsis * Popular Song",
      qty: 22,
      audio: 'demo2.mpeg',
      isPlaying: false),
  SliderList(
      image:
          "https://is5-ssl.mzstatic.com/image/thumb/Purple124/v4/ff/a1/b9/ffa1b949-1081-5a64-022b-1fb7d4c74299/source/512x512bb.jpg",
      name: "Imran khan",
      details: "Quartz * Popular Song",
      qty: 15,
      audio: 'demo3.mpeg',
      isPlaying: false),
  SliderList(
      image:
          "https://img.freepik.com/free-vector/copy-space-violet-wavy-shapes-background_23-2148403375.jpg?w=2000",
      name: "Honey Singh",
      details: "Vision * Popular Song",
      qty: 18,
      audio: 'demo4.mpeg',
      isPlaying: false),
  SliderList(
      image:
          "https://files.123freevectors.com/wp-content/original/14693-violet-background-design.jpg",
      name: "Badshah",
      details: "Protolog * Popular Song",
      qty: 26,
      audio: 'demo5.mpeg',
      isPlaying: false),
];
List<SliderList> sliderList2 = [
  SliderList(
      image:
          "https://images.pexels.com/photos/2539761/pexels-photo-2539761.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Badshah",
      details: "Protolog * Popular Song",
      qty: 26,
      audio: 'demo6.mpeg',
      isPlaying: false),
  SliderList(
      image:
          "https://images.pexels.com/photos/963486/pexels-photo-963486.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Imran khan",
      details: "Quartz * Popular Song",
      qty: 15,
      audio: 'demo7.mpeg',
      isPlaying: false),
  SliderList(
      image:
          "https://images.pexels.com/photos/963436/pexels-photo-963436.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Musik Pagi",
      details: "Mamank * Popular Song",
      qty: 12,
      audio: 'demo8.mpeg',
      isPlaying: false),
  SliderList(
      image:
          "https://images.pexels.com/photos/1045535/pexels-photo-1045535.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Honey Singh",
      details: "Vision * Popular Song",
      qty: 18,
      audio: 'demo9.mpeg',
      isPlaying: false),
  SliderList(
      image:
          "https://images.pexels.com/photos/351087/pexels-photo-351087.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Musik Anu",
      details: "Techsis * Popular Song",
      qty: 22,
      audio: 'demo10.mpeg',
      isPlaying: false),
];

List<SliderList> sliderList3 = [
  SliderList(
      image:
          "https://images.pexels.com/photos/276514/pexels-photo-276514.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Badshah",
      details: "Protolog * Popular Song",
      qty: 26,
      audio: 'demo11.mpeg',
      isPlaying: false),
  SliderList(
      image:
          "https://images.pexels.com/photos/1055613/pexels-photo-1055613.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Imran khan",
      details: "Quartz * Popular Song",
      qty: 15,
      audio: 'demo12.mpeg',
      isPlaying: false),
  SliderList(
      image:
          "https://images.pexels.com/photos/1600150/pexels-photo-1600150.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Musik Pagi",
      details: "Mamank * Popular Song",
      qty: 12,
      audio: 'demo13.mpeg',
      isPlaying: false),
  SliderList(
      image:
          "https://images.pexels.com/photos/3003108/pexels-photo-3003108.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Honey Singh",
      details: "Vision * Popular Song",
      qty: 18,
      audio: 'demo14.mpeg',
      isPlaying: false),
  SliderList(
      image:
          "https://images.pexels.com/photos/2233777/pexels-photo-2233777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Musik Anu",
      details: "Techsis * Popular Song",
      qty: 22,
      audio: 'demo15.mpeg',
      isPlaying: false),
];
