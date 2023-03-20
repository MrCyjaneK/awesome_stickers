import 'dart:typed_data';

import 'package:awesome_stickers/emojiprovider/class.dart';
import 'package:awesome_stickers/emojiprovider/emojikitchen/emojikitchen.g.dart';
import 'package:awesome_stickers/cache/cache.dart';
import 'package:flutter/material.dart';

class EmojiKitchenEmoji implements Emoji {
  List<String> matches;

  EmojiKitchenEmoji({
    required this.emojiId,
    required this.matches,
    required this.appendix,
  });
  int emojiId;

  String appendix;

  @override
  Widget display(int size) {
    return SizedBox(
        width: size.toDouble(),
        height: size.toDouble(),
        child: FutureBuilder(
          future: Cache.cacheUrl('$emojiKitchenMirror$appendix'),
          builder: (context, cache) {
            if (cache.data != null) {
              return Image.memory(Uint8List.fromList(cache.data!.byteList));
            } else {
              return const LinearProgressIndicator();
            }
          },
        )
        // Image.network(
        // '$emojiKitchenMirror$appendix',
        // ),
        );
  }

  @override
  Future<Uint8List> getData() async {
    final c = await Cache.cacheUrl('$emojiKitchenMirror$appendix');
    return Uint8List.fromList(c.byteList);
  }

  @override
  String getType() {
    return "image/png";
  }

  @override
  Uri getUrl() {
    return Uri.parse('$emojiKitchenMirror$appendix');
  }
}

String emojiKitchenMirror = EmojiKitchenEmojiPack.mirrors[0];

class EmojiKitchenEmojiPack implements EmojiPack {
  static List<String> mirrors = [
    "https://emoji.stulpy.sk/emojikitchen", // Community
    "http://emoji.stulpy.sk/emojikitchen", // Community
    "https://www.gstatic.com/android/keyboard/emojikitchen", // Official
    "http://234tjkzhjjvbavk374exxozjdm2vs2iti5pw7ccxtuyfpltdtkuq.b32.i2p/emojikitchen", // [TOR] Communtiy
    "http://cataj7v4zgchsibshnl5as6jtm4oaciei4au6ezdwa6v7a4cgeoet3qd.onion/emojikitchen", // [I2P] Community
  ];

  final int defaultMirror = 0;

  @override
  Future<void> cacheAll() {
    // TODO: implement cacheAll
    throw UnimplementedError();
  }

  @override
  List<Emoji> search(String query) {
    print(query);
    final newEmojis1 =
        emojiKitchenEmojiList.take(emojiKitchenEmojiList.length).toList();
    final newEmojis2 =
        emojiKitchenEmojiList.take(emojiKitchenEmojiList.length).toList();
    newEmojis1.removeWhere(
      (element) => !query.endsWith(element.matches[0]),
    );
    newEmojis2.removeWhere(
      (element) =>
          !query.endsWith(element.matches[0]) &&
          !query.endsWith(element.matches[1]),
    );
    newEmojis2.removeWhere(
      (element) =>
          !query.endsWith(element.matches[0] + element.matches[1]) &&
          !query.endsWith(element.matches[1] + element.matches[0]),
    );

    // for (var element in newEmojis1) {
    //   print(element.appendix);
    // }
    return [...newEmojis2, ...newEmojis1].take(100).toList();
  }
}
