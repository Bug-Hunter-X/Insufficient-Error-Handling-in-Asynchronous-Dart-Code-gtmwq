```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming the API returns a JSON list
      final List<dynamic> data = jsonDecode(response.body);
      // Process the data here, potential error if data is not a list
      for (var item in data) {
        print(item['name']); //Error if 'name' is missing in some items
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    //This catch is too general, needs better error handling
  }
}
```