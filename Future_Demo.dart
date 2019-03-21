import 'dart:async';

main(List<String> args) {
  print("main start");

  new Future(() => print('future #1'));
  new Future(() => print('future #2'));
}