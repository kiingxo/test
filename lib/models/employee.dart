// employee_model.dart

class Employee {
  final String name;
  final String contact;
  final String group;
  final String department;
  final String session;
  final String dateAdded;

  Employee({
    required this.name,
    required this.contact,
    required this.group,
    required this.department,
    required this.session,
    required this.dateAdded,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'],
      contact: json['contact'],
      group: json['group'],
      department: json['department'],
      session: json['session'],
      dateAdded: json['date_added'],
    );
  }
}
