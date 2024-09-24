class Student {
  String name;
  String phoneNumber;
  String img;
  String subject;
  String uid;

  Student({
    this.name = '',
    this.img = '',
    this.phoneNumber = '',
    this.subject = '',
    this.uid = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'img': img,
      'subject': subject,
      'uid': uid,
    };
  }

  Student fromMap(Map<String, dynamic>? myMap) {
    return Student(
      img: myMap!['img'],
      name: myMap['name'],
      phoneNumber: myMap['phoneNumber'],
      subject: myMap['subject'],
      uid: myMap['uid'],
    );
  }
}
class Meal {
  String title;
  String description;
  String img;
  String uid;



  Meal({
    this.img = '',
    this.title = '',
    this.description = '',
    this.uid = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'img': img,
      'uid': uid,
    };
  }

  Meal fromMap(Map<String, dynamic>? myMap) {
    return Meal(
      img: myMap!['img'],
      title: myMap['title'],
      description: myMap['description'],
      uid: myMap['uid'],
    );
  }
}

class Department {
  String name;
  List<dynamic> subjects;
  String uid;
  Department({
    this.name = '',
    this.uid = '',
    this.subjects = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'subjects': subjects,
      'uid': uid,
    };
  }

  Department fromMap(Map<String, dynamic>? myMap) {
    return Department(
      name: myMap!['name'],
      subjects: myMap['subjects'],
      uid: myMap['uid'],
    );
  }
}
