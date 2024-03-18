import 'package:flutter/material.dart';
import 'package:zylu_assignment/controllers/fetch_employee_data_controller.dart';
import 'package:zylu_assignment/models/employee.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Employee> employees = [];
  bool isLoading = false;

  void getEmployeeData() async {
    try {
      employees = await fetchEmployeeData();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    getEmployeeData();
    setState(() {
      isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Zylu Assignment",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
            itemCount: employees.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(
                  Icons.person,
                ),
                trailing: employees[index].yearsOfExperience > 5
                    ? const SizedBox()
                    : const Icon(
                        Icons.flag,
                        color: Colors.green,
                      ),
                title: Text(employees[index].name),
              );
            }),
      ),
    );
  }
}
