import "./domain/Person.dart";
import 'dart:isolate';


// 无类型参数的匿名函数item
void test(){
  var list = ["apples","bananas","oranges"];

  list.forEach((item){
    print("${list.indexOf(item)}:$item\n");
  });
}

void test1(){
  var n = 11;
  print("the type of n is ${n.runtimeType}");
}

void test2(){
  print("=====  test2  =====");

  var emp = new Employee.fromJson({});

  if (emp is Person) {
    emp.name = "Person Bob";
  }else{
    emp.em_name = "Employee Bob";
  }

  print(emp.toString());
}

void test3(){
  
}

void main(List<String> args){
	print("hello world");

  // test();
  // test1();
  test2();
}

void test0(){
  var testAA;
  print(testAA ?? "testAA is null");
  var testBB;
  print(testAA ??= "testBB is BB");
  print(testBB);

  var name = "hellokit";

  if (!name.isEmpty) {
    print("name: "+name);
  }

  // 数字
  int x = 100;
  double y = 20;
  int z = int.parse("100");
  double d =double.parse("22.22");

  print("z: "+z.toString());
  print("d: "+d.toString());

  print("z = $z");
  print("d = $d");

  // list
  var list = [11,22,33,44,55];
  list.add(6);
  
  print("-------------------------------------------\n");
  for (var item in list) {
    print("$item\n");
  }
  print("-------------------------------------------\n");

  list.remove(11);
  for (var item in list) {
    print("$item\n");
  }

  // 常量list
  var c_list =const [4,3,2,1];
  print("常量list\n");
  for (var item in c_list) {
    print("$item\n");
  }

  // map
  var map = new Map<String,int>();
  map["h"] = 22;
  map["j"] = 33;

 var entries = map.entries;

 for (var item in entries) {
   print("key = "+item.key);
   print("value = "+item.value.toString());
 }

 var map1 = {"h":"gg","j":"kk"};

  print("命名参数");

  func_test(s1: "hello",s2: "world");

  func_test1(s1: "给命名参数一个默认值");

  func_test2();
}

// 命名参数
// dart命名参数 当调用函数的时候，必须指定参数的名字。
// 要使用命名参数，可以将函数的参数包括在花括号{}内。
func_test({String s1,String s2}){
  print("s1 = $s1,s2 = $s2");
}

// 给命名参数一个默认值
func_test1({String s1,String s2 = "kkkkk"}){
  print("s1 = $s1,s2 = $s2");
}

// 匿名函数
func_test2(){
  // 函数
  var func = (){
    print("hello test2");
  };

  func();
}

// 异常处理
func_test3(int a,int b){
  try {
    double i = a/b;
  } on IntegerDivisionByZeroException{

  }catch (e) {
    print(e.toString());
  }finally{
    print("=== finally ===");
  }
}








































