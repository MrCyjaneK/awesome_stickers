import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

void main() async {
  final input = await http.read(
    Uri.parse(
      "https://github.com/xsalazar/emoji-kitchen/blob/main/scripts/emojiOutput.json?raw=true",
    ),
  );
  // final input = File("emojiOutput.json").readAsStringSync();
  final json = jsonDecode(input) as Map<String, dynamic>;
  final f = File("../lib/emojiprovider/emojikitchen/emojikitchen.g.dart");
  f.createSync();
  final writer = f.openWrite();
  writer.writeln("// GENERATED CODE - DO NOT MODIFY BY HAND");
  writer.writeln("// Handled by dart run emoji_generate.dart");
  writer.writeln("// ");
  writer.writeln("// Last generated: ${DateTime.now().toIso8601String()}");
  writer.writeln("");
  writer.writeln(
    "import 'package:awesome_stickers/emojiprovider/emojikitchen/implementation.dart';",
  );
  writer.writeln("");
  writer.writeln("final emojiKitchenEmojiList = [");
  var i = 0;
  List<dynamic> list = [];
  json.forEach((key, value) {
    list.addAll(value);
  });
  List<String> addedAppendix = [];
  for (var value in list) {
    final l = "\\u{${value['leftEmoji']}}".replaceAll("-", r"}\u{");
    final r = "\\u{${value['rightEmoji']}}".replaceAll("-", r"}\u{");
    final lr = l + r;
    // if (i > 100) continue;
    final appendix =
        "/${value['date']}/u${value['leftEmoji'].replaceAll("-", "-u")}/u${value['leftEmoji'].replaceAll("-", "-u")}_u${value['rightEmoji'].replaceAll("-", "-u")}.png";
    if (addedAppendix.contains(appendix)) continue;
    addedAppendix.add(appendix);
    writer.writeln(
      '    EmojiKitchenEmoji(emojiId: $i, matches: ["$l", "$r", "$lr"], appendix: "$appendix"),',
      // '{emojiId: $i, matches: ["$l", "$r", "$lr"], appendix: "/${value['date']}/u${value['leftEmoji'].replaceAll("-", "-u")}/u${value['leftEmoji'].replaceAll("-", "-u")}_u${value['rightEmoji'].replaceAll("-", "-u")}.png"},',
    );
    i++;
  }
  // for (var value in json) {
  //   print(value);
  //   value.forEach((key2, value) {
  //     print(key);
  //
  //     final l = "\\u{${value['leftEmoji']}}";
  //     final r = "\\u{${value['rightEmoji']}}";
  //     final lr = l + r;
  //     writer.writeln(
  //       'EmojiKitchenEmoji(emojiId: $i, matches: ["$l", "$r", "$lr"]),',
  //     );
  //     i++;
  //   });
  // })
  writer.writeln("];");
}
