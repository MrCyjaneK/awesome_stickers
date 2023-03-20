import 'package:flutter/widgets.dart';
import 'dart:typed_data';

abstract class Emoji {
  Widget display(int size);
  String getType();
  Future<Uint8List> getData();
  Uri getUrl();
}

abstract class EmojiPack {
  List<Emoji> search(String query);
  Future<void> cacheAll();
}
