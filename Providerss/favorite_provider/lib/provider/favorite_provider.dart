import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  List<String> _words = [];
  List<String> get words => _words;

  //Todo: Chuyen_Doi_Like
  void toggleFavorite(String word) {
    final isExist = _words.contains(word);
    if (isExist) {
      _words.remove(word);
    } else {
      _words.add(word);
    }
    notifyListeners();
  }

  //Todo: Ton_Tai
  bool isExist(String word) {
    final isExist = _words.contains(word);
    return isExist;
  }

  //Todo: Xoa_Favorite
  void clearFavorite() {
    _words = [];
    notifyListeners();
  }

  //Todo: Static FavoriteProvider
  static FavoriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
