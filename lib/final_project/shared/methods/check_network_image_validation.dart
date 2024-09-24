import 'package:http/http.dart' as http;

Future<bool> isValidNetowrkImage({required String url}) async {
  try {
    var response = await http.head(Uri.parse(url));
    return response.statusCode == 200;
  } catch (error) {
    return false;
  }
}
