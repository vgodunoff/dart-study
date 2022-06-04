import 'package:dart_study/dart_study.dart' as dart_study;
import 'package:dart_study/exceptions.dart';
import 'package:dart_study/future_asyncro.dart';
import 'dart:async';
import 'dart:io';

Future<int> sum(int a, int b) {
  Future.delayed(Duration(seconds: 2));
  return Future.sync(() => a + b);
}

void main(List<String> args) async {
  print('start');
  final a = await sum(1, 4);
  print('другие операции');
  print('другие операции');
  print('другие операции');
  print(a);
  final b = await sum(a, 9);
  print(b);
  final c = await sum(a, b);
  print(c);
  print('end');
}
