import 'package:awesome_stickers/emoji_picker.dart';
import 'package:awesome_stickers/emojiprovider/class.dart';
import 'package:awesome_stickers/cache/cache.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await prepareCache();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome Stickers',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var sq = "";

  Emoji? emoji;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Awesome Stickers"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.orange),
              child: emoji == null
                  ? const Center(
                      child: Text("This is body content"),
                    )
                  : emoji!.display(512),
            ),
          ),
          EmojiPicker(
            msgString: sq,
            callback: (newEmoji) {
              setState(() {
                emoji = newEmoji;
              });
            },
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                sq = value;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Message"),
            ),
          )
        ],
      ),
    );
  }
}
