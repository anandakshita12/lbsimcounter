import 'dart:io';

void main(List<String> args) {
  int choice;
  int? value;
  bool stop = false;
  LBSIMCounter counter;
  String? userName;

  print('Enter Your UserName: ');
  userName = stdin.readLineSync();
  if (userName != null && userName.isNotEmpty) {
    counter = LBSIMCounter(count: 100, userName: userName);
  } else {
    return;
  }

  while (!stop) {
    print('''
     Enter your choice
    0. Print value
    1. Increment
    2. Decrement
    3. Multiply 
    4. Divide
    5. Remainder
    6. Change UserName
    7. Stop the operation
    ''');
    choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 0:
        print('Value of ${counter.userName}\'s Counter is: ${counter.count}');
        break;
      case 1:
        print('Enter the value you want to Increment in Counter: ');
        incrementCounter(
            counter: counter, value: int.parse(stdin.readLineSync()!));
        print('Value After Increment is: ${counter.count}');
        break;
      case 2:
        print('Enter the value you want to Decrement in Counter: ');
        decrementCounter(
            counter: counter, value: int.parse(stdin.readLineSync()!));
        print('Value After Decrement is: ${counter.count}');
        break;
      case 3:
        print('Enter the value you want to Multiply in Counter: ');
        multiplyCounter(
            counter: counter, value: int.parse(stdin.readLineSync()!));
        print('Value After Multiplication  is: ${counter.count}');
        break;
      case 4:
        print('Enter the value you want to Divide by Counter: ');
        divideCounter(
            counter: counter, value: int.parse(stdin.readLineSync()!));
        print('Value After Division is: ${counter.count}');
        break;
      case 5:
        print(
            'Enter the value you want to get Remainder after Divide by Counter: ');
        remainderCounter(
            counter: counter, value: int.parse(stdin.readLineSync()!));
        print(
            'Remainder After Division of value by Counter is: ${counter.count}');
        break;
      case 6:
        print('Enter the New Username: ');
        changeUsername(counter: counter, value: stdin.readLineSync()!);
        print('Username Updated: ${counter.userName}');
        break;
      case 7:
        stop = true;
        break;
      default:
        print('Wrong Choice');
        break;
    }
  }
}

class LBSIMCounter {
  int count;
  String userName;
  LBSIMCounter({required this.count, required this.userName});
}

void incrementCounter({required LBSIMCounter counter, required int value}) {
  counter.count += value;
}

void decrementCounter({required LBSIMCounter counter, required int value}) {
  counter.count -= value;
}

void multiplyCounter({required LBSIMCounter counter, required int value}) {
  counter.count *= value;
}

void divideCounter({required LBSIMCounter counter, required int value}) {
  counter.count ~/= value;
}

void remainderCounter({required LBSIMCounter counter, required int value}) {
  counter.count %= value;
}

void changeUsername({required LBSIMCounter counter, required String value}) {
  if (value.trim().isNotEmpty) {
    counter.userName = value;
  }
}
