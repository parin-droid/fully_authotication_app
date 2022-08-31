class SongModel {
  List<MainList>? mainList;

  SongModel({this.mainList});

  SongModel.fromJson(Map<String, dynamic> json) {
    if (json['mainList'] != null) {
      mainList = <MainList>[];
      json['mainList'].forEach((v) {
        mainList!.add(MainList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (mainList != null) {
      data['mainList'] = mainList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainList {
  List<SliderList>? sliderList;

  MainList({this.sliderList});

  MainList.fromJson(Map<String, dynamic> json) {
    if (json['sliderList'] != null) {
      sliderList = <SliderList>[];
      json['sliderList'].forEach((v) {
        sliderList!.add(SliderList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (sliderList != null) {
      data['sliderList'] = sliderList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SliderList {
  String? image;
  String? name;
  String? details;
  String? audio;
  bool? isPlaying;

  SliderList({this.image, this.name, this.details, this.audio, this.isPlaying});

  SliderList.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    details = json['details'];
    audio = json['audio'];
    isPlaying = json['isPlaying'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = image;
    data['name'] = name;
    data['details'] = details;
    data['audio'] = audio;
    data['isPlaying'] = isPlaying;
    return data;
  }
}
