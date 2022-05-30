import 'package:dart_study/dart_study.dart' as dart_study;
import 'package:dart_study/exceptions.dart';
import 'package:dart_study/future_asyncro.dart';
import 'dart:async';
import 'dart:io';

Future<int> sum(int a, int b) {
  return Future.sync(() => a + b);
}

Future<void> example() async {
  final a = await sum(1, 4);
  print(a);
  final b = await sum(a, 9);
  print(b);
  final c = await sum(a, b);
  print(c);
}

void main(List<String> arguments) async {
  // первый вариант с помощью then
  /*
  Работать с Future через обработчики then и catchError — не самая хорошая идея, 
  особенно если нужно передать результат одного Future во второй, 
  а второго в третий и т. д., порождая callback hell.
  https://habr.com/ru/company/surfstudio/blog/539362/
   */
  //final a = sum(1, 4);
  // a.then((a) {
  //   print(a);
  //   final b = sum(a, 9);
  //   b.then((b) {
  //     print(b);
  //     final c = sum(a, b);
  //     c.then((value) => print(value));
  //   });
  // });

//второй вариант с помощью async/await
/*
при таком подходе мы теряем обработчик catchError, 
однако никто не мешает нам обрабатывать ошибки через стандартный try/catch.
https://habr.com/ru/company/surfstudio/blog/539362/ 
*/
//final a = await sum(1, 4);
//   print(a);
//   final b = await sum(a, 9);
//   print(b);
//   final c = await sum(a, b);
//   print(c);

  print('start');
  example();
  print('end');
  // после первого принта, запускается выполнение функции example
  //поток не задерживается, поток пустой и выполнятся принт print('end');
  // и когда готов результ работы функции отображается 5 14 19
}
