class Article {
  late String title;
  String? author;
  late String description;
  late String urlToImage;
  DateTime? publishedAt;
  String? content;
  String? url;

  Article(
      {required this.title,
      required this.description,
      this.author,
      this.content,
      this.publishedAt,
      required this.urlToImage,
      this.url});
}
