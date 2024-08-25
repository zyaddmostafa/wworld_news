class SavedArticle {
  final String title;
  final String? image;
  final String desc;
  final String email;

  SavedArticle(
      {required this.title,
      required this.image,
      required this.desc,
      required this.email});

  factory SavedArticle.fromjson(json) {
    return SavedArticle(
      title: json['title'],
      image: json['image'],
      desc: json['description'],
      email: json['email'],
    );
  }
}
