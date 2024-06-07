class ProflieModel {
  String name;
  String email;
  String phoneNumber;
  String address;
  String gender;
  String birthDate;

  ProflieModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.gender,
    required this.birthDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'address': address,
      'gender': gender,
      'birth_date': birthDate,
    };
  }

  factory ProflieModel.fromJson(Map<String, dynamic> json) {
    return ProflieModel(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      address: json['address'],
      gender: json['gender'],
      birthDate: json['birth_date'],
    );
  }
}
