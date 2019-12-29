import 'dart:async';

import 'package:english_words/english_words.dart';

class Bloc {
  Set<WordPair> saved = Set<WordPair>();

  final _savedControler = StreamController<Set<WordPair>>.broadcast();

  get savedStream => _savedControler.stream;

  get addCurrentSaved => _savedControler.sink.add(saved);
  
  addToOrRemoveFromSavedList(WordPair item) {
    if(saved.contains(item)) {
      saved.remove(item);
    }else {
      saved.add(item);
    }
    
    _savedControler.sink.add(saved);
  }

  dispose(){
    _savedControler.close();
  }
}


var bloc = Bloc();