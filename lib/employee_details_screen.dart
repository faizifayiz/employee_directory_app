import 'package:flutter/material.dart';
import 'employee_model.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final Employee employee;

  EmployeeDetailsScreen({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(employee.profileImage),
                radius: 60,
              ),
            ),
            SizedBox(height: 16),
            Text('Name: ${employee.name}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Email: ${employee.email}'),
            SizedBox(height: 16),
            Text('Company Details:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Name: ${employee.companyName}'),
          ],
        ),
      ),
    );
  }
}
