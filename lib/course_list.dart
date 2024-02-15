import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:the_course_explorer/models.dart';

class CourseAPI {
  Future<Course> getCourses(int i) async {
    try {
      final response = await http
          .get(Uri.parse('https://smsapp.bits-postman-lab.in/courses'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        print('$data');
        return Course.fromJson(data,i);
      } else {
        throw Exception(
            'Failed to load courses, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load courses: $e');
    }
  }
}
