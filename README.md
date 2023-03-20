AwesomeStickers - simple and easy to use stickers menu!

## Features

 - [x] Selecting stickers :D
 - [x] Displaying them :D
 - [ ] Sources
   - [x] Emoji Kitchen (all emojis supported by GBoard, thanks to emojikitchen.dev)
   - [ ] Noto animated emoji (soon)
   - [ ] Custom packs?

## Getting started

#### 1. Load the plugin

To provide a nice and fast user experience awsome stickers will get cached to device,
to do so we use objectbox (will switch to something else probably as it is quite heavy
dependency).

So in your `main.dart` file add the following import:

```dart
import 'package:awesome_stickers/cache/cache.dart';

{...}

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // add this line if it isn't here at the beggining of main()
  {...}
  await prepareCache(); // add this line before runApp
  runApp(const MyApp());
}

```

#### 2. Searching for emojis!

Each (currently only EmojiKitchen) provider have it's own .search() method to find the right sticker to suggest.
As a search query you should provide entire message that was written by user or a emoji/text (assuming you are
writting a chat app)

```dart
import 'package:awesome_stickers/emoji_picker.dart';
import 'package:awesome_stickers/emojiprovider/class.dart';

var Emoji? emoji;

EmojiPicker(
    msgString: searchQuery,
    callback: (newEmoji) {
        setState(() {
            emoji = newEmoji;
        });
    },
),
```

This widget will be 128 px tall if there are any results or 0 px tall if there are none, so you don't need to worry about it too much.

as for callback - this code will get executed after user have picked one of emojis.

#### 3. Displaying emoji

There's nothing easier than displaying an emoji! Assuming that `emoji` is of type `Emoji` you can do the following to display the emoji:

```dart
emoji.display(32); 
```

Code above will display the emoji in a 32x32 square!