import 'dart:convert';


import 'package:http/http.dart' as http;
import '../models/models.dart';

class ApiService {
    Future<String> fetchRandomImageUrl() async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final imageUrl = data['message'];
      return imageUrl;
    } else {
      throw Exception('Failed to load random dog image');
    }
  }
   Future<User> fetchUserProfile() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final user = data['results'][0];
      return User(
        name: '${user['name']['title']} ${user['name']['first']} ${user['name']['last']}',
        location: '${user['location']['street']['name']}, ${user['location']['city']}, ${user['location']['state']}, ${user['location']['country']}, ${user['location']['postcode']}',
        email: user['email'],
        dob: user['dob']['date'],
        registeredDate: user['registered']['date'],
        imageUrl: user['picture']['large'],
      );
    } else {
      throw Exception('Failed to load random user profile');
    }
  }
}
