class Blog {
  final String title;
  final String? urlToImage;
  final String description;

  Blog({required this.title, this.urlToImage,required this.description});

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      title: json['title'] ?? '', // Provide a default value
      urlToImage: json['urlToImage'], // Nullable, so no default needed
      description: json['description'] ?? '',
    );
  }
}
