// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String name;
  String imageUrl;
  String phoneNumber;
  int age;

  UserModel({
    this.name = '',
    this.imageUrl = '',
    this.phoneNumber = '',
    this.age = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'age': age,
      'imageUrl': imageUrl,
    };
  }

  UserModel fromMap({required Map<String, dynamic>? data}) {
    return UserModel(
      name: data!['name'],
      phoneNumber: data['phoneNumber'],
      age: data['age'],
      imageUrl: data['imageUrl'],
    );
  }
}
