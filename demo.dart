class Demo {
  String str = "";
  int count = 0;

  // Demo(String str){
  //   this.str = str;
  // }

  Demo(this.str, this.count);

  // 命名构造函数
  Demo.newDemo(String str, int count) {
    this.str = str;
    this.count = count;
  }
}

// 抽象类
abstract class Anim {
  void eat();
}

class Dog extends Anim {
  void eat() {
    print("hello eat");
  }
}

// 枚举
enum Color { red, whilte }

// 泛型
class DEMO<T> {
  T data;
  DEMO(this.data);
}
