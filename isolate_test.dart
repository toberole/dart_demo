import 'dart:async';
import 'dart:isolate';

//作为入口函数，它本身也是在一个isolate内部运行。
void main() {
  //Isolate的概念，利用 彼此隔离的堆内存，运行异步任务，多个isolate之间可以相互通信。

 //拿到当前isolate的接收端口
  ReceivePort receiverPort = new ReceivePort();
 
  //创建一个另外的Isolate
  //创建，第一个参数是 一个Function ，方法，可以传匿名方法，也可以自定义
  //创建ioslate 并且把main这个的sendPort传给了它
  Future<Isolate> isolate = Isolate.spawn(entryPoint, receiverPort.sendPort);
  // isolate.setErrorsFatal(errorsAreFatal)
  isolate.then((v){
    // 获取到创建的isolate
    print("v.runtimeType: "+v.runtimeType.toString());
  });
  
  // 读取对方发送过来的消息
  // 方式一：注册监听 有消息到来的时 会回调到此
  // 方式二：await for (var msg in receiverPort) 

  //dart的一个isolate的运行过程，也是通过事件驱动的，通过事件队列的循环，来响应各种变化。
  // 注册监听 有消息到来的时 会回调到此
  receiverPort.listen((t) {
    if (t is SendPort) {// 受到B的snedPort，拿到该sendport可以给B发消息
      print("main 受到 new ioslate的 sendPort");
      // 拿到new ioslate的sendPort 给B发送消息
      t.send("收到收到!"); 
    } else{
      print("main接收到 new ioslate  发来的消息~~~~~" + t);
    }
  });

//  sleep(Duration(seconds: 2)); 
//  print("main睡眠结束"); //
}

//参数：sendPort 是main函数所在的传过来的sendPort，所以，当前这个可以用它来向main传信
void entryPoint(SendPort sendPort) {
  // 用main的sendPort给 main发送消息
  sendPort.send("我是new lsolate，我给main 发消息啦"); 

  ReceivePort receiverPort = new ReceivePort();
  //要实现双向通信，必须把new lsolate的sendPort给main
  sendPort.send(receiverPort.sendPort); 

  //
  for (var i = 0; i < 3; i++) {
    sendPort.send("new lsolate message_"+i.toString());
  }

  // 关闭通信
  // receiverPort.close();

  // 读取对方发送过来的消息
  // 方式一：注册监听 有消息到来的时 会回调到此
  // 方式二：await for (var msg in receiverPort) 
  receiverPort.listen((t) {
    print("B接收到 main 的消息~~~~~" + t);
  });
}
