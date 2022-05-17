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
