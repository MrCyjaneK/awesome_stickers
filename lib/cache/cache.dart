import 'package:awesome_stickers/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

bool isCacheLoaded = false;

final cacheBox = store.box<Cache>();
late Store store;
Future<void> prepareCache() async {
  final docsDir = await getApplicationSupportDirectory();
  // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
  store = await openStore(directory: "${docsDir.path}/awesome-emoji-cache");
  print(
      "[awesome-emoji] cache loaded at: '${docsDir.path}/awesome-emoji-cache'");
  isCacheLoaded = true;
}

@Entity()
class Cache {
  Cache({
    required this.key,
    required this.byteList,
  });
  @Id()
  int id = 0;
  @Index()
  String key;
  @Property(type: PropertyType.byteVector)
  List<int> byteList;

  static Future<Cache> cacheUrl(String url) async {
    if (!isCacheLoaded) {
      print("!!! AwesomeStickers cache is not loaded");
      print("!!! add `await prepareCache() to your main()`");
      return Cache(key: url, byteList: await http.readBytes(Uri.parse(url)));
    }
    final qres = cacheBox.query(Cache_.key.equals(url)).build().findFirst();
    if (qres != null) {
      return qres;
    }
    final resp = await http.readBytes(Uri.parse(url));
    final c = Cache(key: url, byteList: resp)..save();
    return c;
  }

  void save() {
    id = cacheBox.put(this);
  }
}
