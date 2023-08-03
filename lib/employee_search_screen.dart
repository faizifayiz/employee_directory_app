import 'package:flutter/material.dart';
import 'employee_model.dart';

class EmployeeSearchScreen extends StatelessWidget {
  final List<Employee> employees;
  final Function(Employee) onTap;

  EmployeeSearchScreen({required this.employees, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Employees'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by Name or Email',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                // Implement search logic here
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                final employee = employees[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(employee.profileImage),
                  ),
                  title: Text(employee.name),
                  subtitle: Text(employee.email),
                  onTap: () {
                    onTap(employee);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
