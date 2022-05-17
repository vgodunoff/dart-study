import 'package:dart_study/dart_study.dart' as dart_study;
import 'package:dart_study/exceptions.dart';

void main(List<String> arguments) {
  //распространенный пример Исключений и их обработка
  //в данном случае деление на ноль

  // в dart для целочисленного деления используется int operator ~/
  // "double operator / " -  а результат деления от оператора / будет с десятичным остатком
  // try {
  //   int x = 9;
  //   int y = 0;
  //   int z = x ~/ y; // 4

  //   //var z = x / y; //4,5 при делении на ноль - Infinity
  //   // переменная z является double

  //   print(z);
  // } on IntegerDivisionByZeroException catch (e, s) {
  //   print("Обработка исключения $e");
  //   print("Стек $s");
  // }
  // print("Завершение программы");

  try {
    final a = div('-5', '2');
    //если в строке 26 появилось Исключение, то остальные команды не выполняются
    // print(a); не будет выполнено
    // мы сразу попадаем в блок catch
    print(a);
  } on IncorrectIntString catch (error) {
    // с помощью ключевого слова on можем обрабатывать конкретные исключения
    print(error);
  } on DivisionByZero catch (error) {
    // с помощью ключевого слова on можем обрабатывать конкретные исключения
    print(error);
  } catch (error) {
    // в конце можем добавить catch чтобы отловить неучтенные ситуации
    print('Неопознанная ошибка $error');
  } finally {
    // после ключевого слова finally код выполняется всегда, вне зависимости от исключений
    // это нужно использовать например для закрытия открытого файла
    // или для завершения "крутилки" - CircularProgressIndicator
    print('finally sdfgvsdf');
  }
}
