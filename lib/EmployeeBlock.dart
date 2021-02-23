import 'dart:async';
import 'Employee.dart';


class EmployeeBlock {
  List<Employee> _employeeList=[
    Employee(1,"Employee One",10000),
    Employee(2,"Employee Two",20000),
    Employee(3,"Employee Three",30000),
    Employee(4,"Employee Four",40000),
    Employee(5,"Employee Five",50000),
    Employee(6,"Employee Six",60000),
    Employee(7,"Employee Seven",700000),
    Employee(8,"Employee Eight",80000),
    Employee(9,"Employee Nine",90000),
    Employee(10,"Employee Ten",100000),
  ];

  final _employeeListStreamController=StreamController<List<Employee>>();
  final _salaryIncrementStreamController=StreamController<Employee>();
  final _salaryDecrementStreamController=StreamController<Employee>();

  Stream<List<Employee>> get employeeListStream => _employeeListStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink => _employeeListStreamController.sink;

  StreamSink<Employee> get employeeSalaryInc => _salaryIncrementStreamController.sink;

  StreamSink<Employee> get employeeSalaryDec => _salaryDecrementStreamController.sink;

  EmployeeBlock(){
    _employeeListStreamController.add(_employeeList);
    _salaryIncrementStreamController.stream.listen(_incSalary);
    _salaryDecrementStreamController.stream.listen(_decSalary);
  }

  _incSalary(Employee employee){
     double salary =employee.salary;
     double incrementedSalary = salary * (20/100);
     _employeeList[employee.id-1].salary=salary+incrementedSalary;
     employeeListSink.add(_employeeList);
  }

  _decSalary(Employee employee){
    double salary =employee.salary;
    double decrementedSalary = salary * (20/100);
    _employeeList[employee.id-1].salary=salary-decrementedSalary;
    employeeListSink.add(_employeeList);
  }


  void dispose(){
    _employeeListStreamController.close();
    _salaryIncrementStreamController.close();
    _salaryDecrementStreamController.close();
  }
}