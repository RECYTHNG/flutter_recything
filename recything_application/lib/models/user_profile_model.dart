class UserProfile {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final int point;
  final String badge;
  final String gender;
  final DateTime birthDate;
  final String address;
  final String pictureUrl;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.point,
    required this.badge,
    required this.gender,
    required this.birthDate,
    required this.address,
    required this.pictureUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      point: json['point'],
      badge: json['badge'],
      gender: json['gender'],
      birthDate: DateTime.parse(json['birth_date']),
      address: json['address'],
      pictureUrl: json['picture_url'],
    );
  }
}
