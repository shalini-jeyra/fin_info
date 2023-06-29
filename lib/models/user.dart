import 'dart:convert';

class User {
  final String name;
  final String location;
  final String email;
  final String dob;
  final String registeredDate;
  final String imageUrl;

  User({
    required this.name,
    required this.location,
    required this.email,
    required this.dob,
    required this.registeredDate,
    required this.imageUrl,
  });


  User copyWith({
    String? name,
    String? location,
    String? email,
    String? dob,
    String? registeredDate,
    String? imageUrl,
  }) {
    return User(
      name: name ?? this.name,
      location: location ?? this.location,
      email: email ?? this.email,
      dob: dob ?? this.dob,
      registeredDate: registeredDate ?? this.registeredDate,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'email': email,
      'dob': dob,
      'registeredDate': registeredDate,
      'imageUrl': imageUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      location: map['location'] ?? '',
      email: map['email'] ?? '',
      dob: map['dob'] ?? '',
      registeredDate: map['registeredDate'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(name: $name, location: $location, email: $email, dob: $dob, registeredDate: $registeredDate, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.name == name &&
      other.location == location &&
      other.email == email &&
      other.dob == dob &&
      other.registeredDate == registeredDate &&
      other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      location.hashCode ^
      email.hashCode ^
      dob.hashCode ^
      registeredDate.hashCode ^
      imageUrl.hashCode;
  }
}
