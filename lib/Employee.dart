class Employee {
  int _id;
  String _name;
  double _salary;

  Employee(this._id,this._name,this._salary);

  double get salary => _salary;

  set salary(double value) {
    _salary = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}