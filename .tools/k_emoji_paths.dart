// import 'package:awesome_stickers/emojiprovider/emojikitchen/emojikitchen.g.dart'
import 'dart:io';

void main() {
  final fStr = File("../lib/emojiprovider/emojikitchen/emojikitchen.g.dart")
      .readAsLinesSync();
  fStr.forEach(
    (line) {
      if (!line.contains("EmojiKitchenEmoji")) return;
      print(
        line.substring(
          line.indexOf('appendix: "') + 'appendix: "'.length,
          line.length - 3,
        ),
      );
    },
  );
}
