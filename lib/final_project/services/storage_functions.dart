import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:test_app/final_project/services/auth_service.dart';
import 'package:test_app/final_project/services/firestore_services.dart';
import 'package:test_app/firestore_usage/firestore_functions.dart';

class StorageServices {
  var user = Auth().myUser;

  Future<void> uploadProfileImage({
    required File imageFile,
    required context,
  }) async {
    var ref = FirebaseStorage.instance.ref();
    var imageRef = ref.child('users/${user!.uid}/${user!.uid}');
    var uploadedImage = await imageRef.putFile(imageFile);
    var imageUrl = await uploadedImage.ref.getDownloadURL();
    FirestoreServices().updateProfilImage(
      imageUrl: imageUrl,
      context: context,
    );
  }

  Future<void> uploadMealImage({
    required File imageFile,
    required String mealTitle,
    required String mealDescription,
    required context,
  }) async {
    var ref = FirebaseStorage.instance.ref();
    var imageRef = ref.child('meals');
    var uploadedImage = await imageRef.putFile(imageFile);
    var imageUrl = await uploadedImage.ref.getDownloadURL();
    await FirestoreFunctions().createNewMeal(
      title: mealTitle,
      img: imageUrl,
      description: mealDescription,
      context: context,
    );
  }

  Future<void> deleteUserStorage() async {
    await FirebaseStorage.instance.ref('users/${user!.uid}').listAll().then(
          (value) => value.items.forEach(
            (element) async {
              await FirebaseStorage.instance.ref(element.fullPath).delete();
            },
          ),
        );
    await FirebaseStorage.instance
        .ref('users/${user!.uid}/groups')
        .listAll()
        .then(
          (value) => value.items.forEach(
            (element) async {
              await FirebaseStorage.instance.ref(element.fullPath).delete();
            },
          ),
        );
  }
}
