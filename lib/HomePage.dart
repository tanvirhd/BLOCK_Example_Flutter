import 'package:flutter/material.dart';
import 'Employee.dart';
import 'EmployeeBloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState(){
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final EmployeeBloc employeeBloc = new EmployeeBloc();

  @override
  void dispose() {
    employeeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Employee App")),
      body: Container(
        child:  StreamBuilder<List<Employee>>(
          stream: employeeBloc.employeeListStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.00),
                        child: Text("${snapshot.data[index].id}.",style: TextStyle(fontSize: 20.0))
                      ),
                      Container(
                          padding: EdgeInsets.all(20.00),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${snapshot.data[index].name}",style: TextStyle(fontSize: 18.0)),
                              Text("Tk ${snapshot.data[index].salary}",style: TextStyle(fontSize: 16.0))
                            ],
                          )
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.thumb_up),
                          color: Colors.green,
                          onPressed: (){
                            employeeBloc.employeeSalaryInc.add(snapshot.data[index]);
                          },
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.thumb_down),
                          color: Colors.red,
                          onPressed: (){
                            employeeBloc.employeeSalaryDec.add(snapshot.data[index]);
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
