/*
在Dart中实现并发可以用Isolate，它是类似于线程(thread)但不共享内存的
独立运行的worker，是一个独立的Dart程序执行环境。
其实默认环境就是一个main isolate。

在Dart语言中，所有的Dart代码都运行在某个isolate中，
代码只能使用所属isolate的类和值。不同的isolate可以通过
port发送message进行交流。(首字母大写的Isolate代表Isolate对象，
小写的isolate代表一个独立的Dart代码执行环境)

由spawn操作创建的Isolate对象具有控制接口(control port)和
控制该对象的能力(capability)。当然， 用Isolate.Isolate构造方法创建的
Isolate对象可以不必带有这些能力。

Isolate对象不能用SendPort发送给另一个Isolate对象，
但是控制接口(control port)和能力(capability)是可以发送的，
并且可以在另一个Isolate对象中用发送来的接口与能力创建一个新的Isolate对象。
 */

import 'dart:async';
import 'dart:isolate';

main() async {
  var receivePort = new ReceivePort();
  await Isolate.spawn(echo, receivePort.sendPort);

  // 'echo'发送的第一个message，是它的SendPort
  var sendPort = await receivePort.first;

  var msg = await sendReceive(sendPort, "foo");
  print('received $msg');
  msg = await sendReceive(sendPort, "bar");
  print('received $msg');
}

/// 新isolate的入口函数
echo(SendPort sendPort) async {
  // 实例化一个ReceivePort 以接收消息
  var port = new ReceivePort();

  // 把它的sendPort发送给宿主isolate，以便宿主可以给它发送消息
  sendPort.send(port.sendPort);

  // 监听消息
  await for (var msg in port) {
    var data = msg[0];
    SendPort replyTo = msg[1];
    replyTo.send(data);
    if (data == "bar") port.close();
  }
}

/// 对某个port发送消息，并接收结果
Future sendReceive(SendPort port, msg) {
  ReceivePort response = new ReceivePort();
  port.send([msg, response.sendPort]);
  return response.first;
}










































