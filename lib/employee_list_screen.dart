import 'package:flutter/material.dart';
import 'employee_model.dart';
import 'employee_details_screen.dart'; // Make sure to import the details screen

class EmployeeListScreen extends StatelessWidget {
  final List<Employee> employees;

  EmployeeListScreen({required this.employees});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final employee = employees[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(employee.profileImage),
            ),
            title: Text(employee.name),
            subtitle: Text(employee.companyName),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmployeeDetailsScreen(employee: employee),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
