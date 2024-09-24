import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/final_project/screens/single_tuter_screen.dart';
import 'package:test_app/final_project/services/models.dart';
import 'package:test_app/shared_methods.dart';
import '../../shared/methods/check_network_image_validation.dart';
import '../../shared/themes/colors.dart';
import '../../shared/themes/text.dart';
import '../../shared/widgets/loader.dart';

class TuterCard extends StatelessWidget {
  TuterCard({super.key, required this.student});
  Student student;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          goto(
            context: context,
            screen: SingleTuterScreen(
              student: student,
            ),
          );
        },
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: lightOrange,
              radius: 30,
              child: student.img.isEmpty
                  ? Text(
                      student.name[0].toUpperCase(),
                      style: h4,
                    )
                  :
                  //method check if the url is valid or not
                  FutureBuilder(
                      future: isValidNetowrkImage(url: student.img),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Loader();
                        } else if (snapshot.hasError ||
                            snapshot.data == false) {
                          return Text(
                            student.name[0].toUpperCase(),
                            style: h4,
                          );
                        } else {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(38.5),
                            child: Image(
                              image: NetworkImage(student.img),
                              fit: BoxFit.cover,
                              height: 77,
                              width: 77,
                            ),
                          );
                        }
                      },
                    ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name,
                  style: title1.merge(TextStyle(color: Colors.black)),
                ),
                Text(
                  student.phoneNumber,
                  style: title1.merge(TextStyle(color: grey)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
