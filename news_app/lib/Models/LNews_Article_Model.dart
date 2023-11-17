class LNewsArticleModel {
  final String? image;
  final String title;
  final String? description;

  const LNewsArticleModel(
      {required this.image, required this.title, required this.description});

  factory LNewsArticleModel.fromJson(json){
    return LNewsArticleModel(
            image: json['urlToImage'],
            title: json['title'],
            description: json['description']);
  }     
}
