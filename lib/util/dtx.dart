import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension CollectionXt<T> on Iterable<T>{

  Iterable<N> mapIndexed<N>(N Function(T item, int index) receiver){
    int index = 0;

    return map((e) => receiver(e, index++));
  }

  Map<K, T> associate<K>(MapEntry<K, T> Function(T item) factory){
    final data = <K, T>{};
    final entries = <MapEntry<K, T>>[];
    forEach((e) { entries.add(factory(e)); });
    data.addEntries(entries);

    return data;
  }

}

extension ContextDtx on BuildContext{
   ColorScheme get colorScheme => Theme.of(this).colorScheme;
   TextTheme get typography => Theme.of(this).textTheme;
}

extension MapDXt<K, V> on Iterable<MapEntry<K, V>>{

  Map<K, V> toMap(){
    final data = <K, V>{};
    data.addEntries(this);

    return data;
  }

}