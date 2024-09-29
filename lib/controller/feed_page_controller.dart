import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/controller/shared_preferences.dart';

import '../model/all_feed.dart';


class FeedPageController extends GetxController {
  RxList<Blog> resources = <Blog>[].obs;
  final preferences = Get.put(PrefrencesManager());
  RxBool isLoading = true.obs;

  // Base URL for the API
  static const String baseUrl = 'https://newsapi.org/v2/top-headlines'; // Replace with the actual endpoint
  static const String apiKey = 'a46214b74b554740ac7b440a10534893'; // Use your actual API key

  var recentlyViewedResources = <Blog>[].obs; // Recently viewed news

  @override
  void onInit() {
    super.onInit();
    fetchResources();
  }

  Future<void> fetchResources() async {
    isLoading.value = true;
    try {
      // Construct the URL with the API key
      final response = await http.get(Uri.parse('$baseUrl?apiKey=$apiKey&country=us')); // Add other query parameters as needed

      if (response.statusCode == 200) {
        print('Response body: ${response.body}'); // Debug output
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> blogs = data['articles']; // Ensure this matches the response structure
        resources.addAll(blogs.map((json) => Blog.fromJson(json)).toList());
      } else {
        throw Exception('Failed to load resources');
      }
    } catch (e) {
      print('Error fetching resources: $e');
      // Handle error here, e.g., show an error message to the user
    } finally {
      isLoading.value = false;
    }
  }
}
