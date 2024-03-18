class Employee {
  final String name;
  final int yearsOfExperience;

  Employee({required this.name, required this.yearsOfExperience});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'],
      yearsOfExperience: json['years_of_experience'],
    );
  }
}
