import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'employee_provider.dart';
import 'employee_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EmployeeProvider()),
        FutureProvider<void>(
          create: (context) => context.read<EmployeeProvider>().fetchEmployees(), initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'Employee Directory App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: EmployeeListScreen(employees: [],),
      ),
    );
  }
}
