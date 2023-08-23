class ArticleModel {
  final int artId;
  final String image;
  final String title;
  final String description;
  final String likes;
  final String views;
  final String addDate;
  final String username;
  final String avatar;
  final String profession;
  final int userId;

  ArticleModel(
      {required this.avatar,
        required this.profession,
        required this.username,
        required this.userId,
        required this.title,
        required this.description,
        required this.image,
        required this.addDate,
        required this.artId,
        required this.likes,
        required this.views});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        avatar: json["avatar"] as String? ?? "",
        profession: json["profession"] as String? ?? "",
        username: json["username"] as String? ?? "",
        userId: json["user_id"] as int? ?? 0,
        title: json["title"] as String? ?? "",
        description: json["description"] as String? ?? "",
        image: json["image"] as String? ?? "",
        addDate: json["add_date"] as String? ?? "",
        artId: json["art_id"] as int? ?? 0,
        likes: json["likes"] as String? ?? "",
        views: json["views"] as String? ?? "");
  }
}