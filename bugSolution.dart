```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final List<dynamic> data = jsonDecode(response.body);
        for (var item in data) {
          final name = item['name'];
          if (name != null) {
            print('Name: $name');
          } else {
            print('Error: Missing name field in item: $item');
          }
        }
      } on FormatException catch (e) {
        print('Error: Invalid JSON format: $e');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```