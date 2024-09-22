class MyUser {
  String name;
  String phoneNumber;
  String img;
  String uid;
  
  MyUser({
    this.name = '',
    this.img = '',
    this.phoneNumber = '',
    this.uid = '',
  });
  
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'img': img,
    };
  }

  MyUser fromMap(Map<String, dynamic>? myMap) {
    return MyUser(
      img: myMap!['img'],
      name: myMap['name'],
      phoneNumber: myMap['phoneNumber'],
    );
  }
}