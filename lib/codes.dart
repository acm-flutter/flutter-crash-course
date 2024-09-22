/*
FocusScope.of(context).requestFocus(
   FocusNode(),
);
*/


// image picker
/*

dependencies:
  image_picker: ^latest_version
For Android, confirm that you have added the required permissions in AndroidManifest.xml :

<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>

For iOS, ensure you have the necessary entries in your Info.plist:

<key>NSPhotoLibraryUsageDescription</key>
<string>We need access to your photo library to select images.</string>



*/

/*

// Network img validation

Future<bool> isValidNetowrkImage({required String url}) async {
  try {
    var response = await http.head(Uri.parse(url));
    return response.statusCode == 200;
  } catch (error) {
    return false;
  }
}



 FutureBuilder(
                    future: isValidNetowrkImage(url: friend.img),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Loader();
                      } else if (snapshot.hasError || snapshot.data == false) {
                        return Text(
                          friend.name[0].toUpperCase(),
                          style: h4,
                        );
                      } else {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(38.5),
                          child: Image(
                            image: NetworkImage(friend.img),
                            fit: BoxFit.cover,
                            height: 77,
                            width: 77,
                          ),
                        );
                      }
                    },
                  ),
          ),


 */