import 'package:awesome_stickers/emojiprovider/class.dart';
import 'package:awesome_stickers/emojiprovider/emojikitchen/implementation.dart';
import 'package:flutter/material.dart';

class EmojiPicker extends StatelessWidget {
  EmojiPicker({
    Key? key,
    required this.msgString,
    required this.callback,
  }) : super(key: key);

  final String msgString;

  final provider = EmojiKitchenEmojiPack();

  late final List<Emoji> emojis = provider.search(msgString);

  final void Function(Emoji emoji) callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: emojis.isEmpty ? 0 : 128,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ListView.builder(
          itemCount: emojis.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                callback(emojis[index]);
              },
              child: emojis[index].display(128),
            );
          },
        ),
      ),
    );
  }
}
