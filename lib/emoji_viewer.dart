import 'dart:typed_data';

import 'package:flutter/material.dart';

/// EmojiViewer - Way to view all supported
/// types of emojis.
class EmojiViewer extends StatelessWidget {
  EmojiViewer({
    Key? key,
    required this.size,
    required this.emojiData,
    required this.emojiType,
  }) : super(key: key);

  double size = 16;
  Uint8List emojiData;
  String emojiType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const Text("test"),
    );
  }
}
