void main(List<String> args){
	print("hello world");

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



}