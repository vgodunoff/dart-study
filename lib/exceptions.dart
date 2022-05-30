//кроме встроенных классов исключений можно создать свои собственные исключения

class IncorrectIntString {
  final String incorrectString;

  IncorrectIntString(this.incorrectString);
  @override
  String toString() {
    // TODO: implement toString
    return 'Некорректная строка $incorrectString';
  }
}

class DivisionByZero {
  @override
  String toString() {
    // TODO: implement toString
    return 'Деление на ноль';
  }
}

//создали еще один класс исключений для функции inSquare
class NegativeDouble {
  final double incorrectDouble;

  NegativeDouble(this.incorrectDouble);
  @override
  String toString() {
    // TODO: implement toString
    return 'Число является отрицательным. Значение числа: $incorrectDouble';
  }
}

double div(String a, String b) {
  final aa = int.tryParse(a);
  final bb = int.tryParse(b);

  if (aa == null) {
    // в некорректных ситуациях бросаем исключения
    throw IncorrectIntString(a);
  }

  if (bb == null) {
    // в некорректных ситуациях бросаем исключения
    throw IncorrectIntString(b);
  }

  if (bb == 0) {
    // в некорректных ситуациях бросаем исключения
    throw DivisionByZero();
  }
  //код ниже можно не помещать в конструкцию try/catch для обработки исключений
  //потому что исключение будет поймано в блоке catch в main
  //это исключение будет пробрасываться вверх по стеку до близлежащего try/catch

  /*
try {
    final a = div('-5', '2');
    print(a);
  } on IncorrectIntString catch (error) {
       print(error);
  } on DivisionByZero catch (error) {
        print(error);
  } catch ('Неопознанная ошибка $error') { // ВОТ ЗДЕСЬ БУДЕТ ПОЙМАНО ИСКЛЮЧЕНИЕ NegativeDouble
       print(error);
  }
  */
  final result = inSquare(aa / bb);
  return result;
}

double inSquare(double a) {
  if (a < 0) {
    throw NegativeDouble(a);
  }
  return a * a;
}



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

  // try {
  //   final a = div('-5', '2');
  //   //если в строке 26 появилось Исключение, то остальные команды не выполняются
  //   // print(a); не будет выполнено
  //   // мы сразу попадаем в блок catch
  //   print(a);
  // } on IncorrectIntString catch (error) {
  //   // с помощью ключевого слова on можем обрабатывать конкретные исключения
  //   print(error);
  // } on DivisionByZero catch (error) {
  //   // с помощью ключевого слова on можем обрабатывать конкретные исключения
  //   print(error);
  // } catch (error) {
  //   // в конце можем добавить catch чтобы отловить неучтенные ситуации
  //   print('Неопознанная ошибка $error');
  // } finally {
  //   // после ключевого слова finally код выполняется всегда, вне зависимости от исключений
  //   // это нужно использовать например для закрытия открытого файла
  //   // или для завершения "крутилки" - CircularProgressIndicator
  //   print('finally sdfgvsdf');
  // }