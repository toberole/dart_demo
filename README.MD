### Dart
    Dart是单线程模型，通过消息循环来执行任务[类似node.js],没有了所谓的主线程/子线程之分。
    Dart也是Event-Looper以及Event-Queue的模型，所有的事件都是通过EventLooper的依次执行。

dart中所有的东西都是对象。

### 内置数据类型
- Numbers
- Strings
- Booleans
- Lists
- Maps

"??" 数据域操作符 
eg：AA ?? "999" 表示如果AA为空，返回999
eg: AA ??= "999" 表示如果AA为空，给AA赋值999

"_" 代表private


dart 中在没有显示的指定变量的类型时，debug模式下变量类型都是dynamic类型

使用".."级联符号可以在一个对象上进行一系列的操作。

如果函数只有一条语句，可以使用"=>"

所有的函数都有返回值，如果没有指定返回值，则隐式的返回null

使用 "?."
p?.y=4// if p is non-null,set its y value to 4

runtimeType 获取对象的类型

延迟加载库 deferred as
import 'package:deferred/hello.dart' deferred as hello;
使用时 调用hello.LoadLibrary()
- 延迟库的常量在其作为导入文件时不是常量。这些常量不存在，直到迟库被加载完成。
- 不能在导入文件中使用延迟库常量的类型。相反，考虑将接口类型移到同时由延迟库和导入文件导入的库。
- Dart隐含调用LoadLibrary（）插入到定义deferred as namespace。在调用LoadLibrary（）函数返回一个Future。

不同的Isolate对象之间通信，必须通过对方的sendPort来给对方发送信息。
eg：A ioslate 给 B isolate发送信息，A需要持有B的sendPort
    B isolate 给 A isolate发送信息，B需要持有A的sendPort










