class NewsModel {
  final String title;
  final String content;

  NewsModel({required this.title, required this.content});

  factory NewsModel.fromJsonMap(Map<String, dynamic> json) => NewsModel(
    title: json['title']['rendered'],
    content: json['content']['rendered'],
  );
}
