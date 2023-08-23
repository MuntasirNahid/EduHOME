class Student {
  final String fullName;
  final int classStudies;
  final String location;
  final String phoneNumber;
  final String password;
  final String picturePath;
  final String institution;
  final List<String> teacherId;

  Student({
    required this.fullName,
    required this.classStudies,
    required this.location,
    required this.phoneNumber,
    required this.password,
    required this.picturePath,
    required this.institution,
    required this.teacherId,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      fullName: json['fullName'],
      classStudies: json['classStudies'],
      location: json['location'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      picturePath: json['picturePath'],
      institution: json['institution'],
      teacherId: List<String>.from(json['teacherId']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'classStudies': classStudies,
      'location': location,
      'phoneNumber': phoneNumber,
      'password': password,
      'picturePath': picturePath,
      'institution': institution,
      'teacherId': teacherId,
    };
  }
}
