/*
Dart和Java一样只支持单继承。而且Dart中没有和Java一样提供Interface字段去声明一个接口，但是也有抽象类。

如果想使用和Java接口一样的功能可以使用Mixins和implements两种方式，分别解释下两种方式：

Mixins : 指能够将另一个或多个类的功能添加到您自己的类中，而无需继承这些类。
implements : 将一个类作为接口使用

 */
class A {
  void a() {
    print("A#a ......");
  }
}

class B implements A {
  @override
  void a() {
    print("B#a ......");
  }
}

class C {
  void c() {
    print("C#c ......");
  }
}

class D extends B with C {
  void d() {
    print("D#d ......");
  }
}

main(List<String> args) {
  print("hello mixins with");

  D d = D();
  d.a();
  d.c();
  d.d();
}
