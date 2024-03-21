// where there is a superclass and multiple subclasses and we want to get object of subclasses based on the user input then we create factory class
// which takes the responsibility of creating object of class based on the input

// ignore_for_file: constant_identifier_names

enum EmployeeType { HR, AndroidDeveloper, WebDeveloper }

abstract class Employee {
  int salary();
}

class WebDeveloper implements Employee {
  @override
  int salary() {
    return 80000;
  }
}

class AndroidDeveloper implements Employee {
  @override
  int salary() {
    return 6000;
  }
}

class HR implements Employee {
  @override
  int salary() {
    return 4000;
  }
}

class EmployeeFactory {
  static Employee getShape(EmployeeType employeeType) {
    if (employeeType == EmployeeType.AndroidDeveloper) {
      return AndroidDeveloper();
    } else if (employeeType == EmployeeType.WebDeveloper) {
      return WebDeveloper();
    } else if (employeeType == EmployeeType.HR) {
      return HR();
    }
    return HR();
  }
}

void main() {
  Employee employee = EmployeeFactory.getShape(EmployeeType.AndroidDeveloper);
  print(employee.salary());
}
