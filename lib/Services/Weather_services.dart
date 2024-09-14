import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '665fa64896164622b7b200859241309'; // Replace with your valid API key
  final String forecastBaseUrl = 'https://api.weatherapi.com/v1/forecast.json';
  final String searchBaseUrl = 'https://api.weatherapi.com/v1/search.json';

  // Fetch current weather
  Future<Map<String, dynamic>> fetchCurrentWeather(String city) async {
    final url = Uri.parse('$forecastBaseUrl?key=$apiKey&q=$city&days=1&aqi=no&alerts=no');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body); // Parse the JSON data
    } else {
      throw Exception('Failed to fetch weather data: ${response.body}');
    }
  }

  // Fetch 7-day forecast
  Future<Map<String, dynamic>> fetch7daysForecast(String city) async {
    final url = Uri.parse('$forecastBaseUrl?key=$apiKey&q=$city&days=7&aqi=no&alerts=no');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body); // Parse the JSON data
    } else {
      throw Exception('Failed to fetch weather data: ${response.body}');
    }
  }

  // Fetch city suggestions
  Future<List<dynamic>?> fetchCitySuggestions(String query) async {
    final url = Uri.parse('$searchBaseUrl?key=$apiKey&q=$query');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body); // Parse the JSON data
    } else {
      throw Exception('Failed to fetch city suggestions: ${response.body}');
    }
  }
}