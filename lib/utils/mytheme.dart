import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

final ValueNotifier<bool> toggleTheme = ValueNotifier<bool>(false);

class MyTheme with ChangeNotifier {
  String global = "English";
  final translator = GoogleTranslator();

  Future<String> getData(String data) async {
    var result = await translator.translate(data,
        to: global == "English"
            ? 'en'
            : global == "Hindi"
                ? 'hi'
                : global == "Chinese"
                    ? 'zh-cn'
                    : "");
    print(result.text);
    return result.text;
  }

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(),
      indicatorColor: Colors.orange,
      dividerColor: Colors.amber,
      backgroundColor: Colors.white);

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black12,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(),
      dividerColor: Colors.greenAccent,
      indicatorColor: Colors.lightGreen,
      backgroundColor: Colors.grey.shade900);
}
