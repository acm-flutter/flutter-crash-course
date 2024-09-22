import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/create_contacts/profile_screen.dart';
import 'package:test_app/create_contacts/user_model.dart';
import '../../screens.dart';

class ContactCard extends StatelessWidget {
  ContactCard({super.key, required this.contact});
  MyUser contact;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goto(
          context: context,
          screen: ProfileScreen(
            user: contact,
          ),
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.orange,
            radius: 38.5,
            child: contact.img.isEmpty
                ? Text(
                    contact.name[0].toUpperCase(),
                    style: TextStyle(fontSize: 20),
                  )
                :
                //method check if the url is valid or not
                ClipRRect(
                    borderRadius: BorderRadius.circular(38.5),
                    child: Image(
                      image: NetworkImage(contact.img),
                      fit: BoxFit.cover,
                      height: 77,
                      width: 77,
                    ),
                  ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contact.name,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                contact.phoneNumber,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
