import 'dart:typed_data';

import 'package:flutter/material.dart';

/// EmojiViewer - Way to view all supported
/// types of emojis.
class EmojiViewer extends StatelessWidget {
  const EmojiViewer({
    super.key,
    required this.size,
    required this.emojiData,
    required this.emojiType,
  });

  final double size;
  final Uint8List emojiData;
  final String emojiType; // this can only by image for now

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Image.memory(emojiData),
    );
  }
}
