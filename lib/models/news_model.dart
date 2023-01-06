class News{
  final String  author;
  final  String title;
  final  String description;
  final String imageUrl;
  News({
    required this.author, required this.title, required this.description, required this.imageUrl

  });

  static void add(News news) {}
  
}