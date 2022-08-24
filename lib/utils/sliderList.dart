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
