import 'dart:async';

main(List<String> args) {
  func_async_test().then((value){
    print(value);
  }).catchError((error){
    print(error.toString());
  });
}

Future<String> func_async_test(){
  return new Future((){
     //Do a long running task. E.g. Network Call.
      return "net call";
  });
}
