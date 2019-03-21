class Person {
  String name;

  Person.fromJson(Map data){
    print("in person");
  }
}

class Employee extends Person {
  String em_name;

  Employee.fromJson(Map data):super.fromJson(data){
    print("in Employee");
  }

  @override
  String toString() {
    return "P_name ${name}: E_name ${em_name}";
  }
}

