class ArticleModel {
  final dynamic image;
  final dynamic title;
  final dynamic desc;

  ArticleModel({required this.image, required this.title, required this.desc});

  factory ArticleModel.fromjson(json) {
    return ArticleModel(
      image: json['image'],
      title: json['title'],
      desc: json['description'],
    );
  }
}
