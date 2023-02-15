//Todo: Model
class VideoModel {
  int? id;
  String? title;
  String? author;
  String? description;
  int? id_category;
  String? name_category;
  String? information_category;
  String? type;
  String? url_video;
  String? url_youtube;
  String? url_photo;
  String? week_day_number;

  //Todo: Contructor
  VideoModel({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.id_category,
    required this.information_category,
    required this.type,
    required this.name_category,
    required this.url_video,
    required this.url_youtube,
    required this.url_photo,
    required this.week_day_number,
  });

  //Todo: fromJson()
  VideoModel.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.title = json['title'],
        this.author = json['author'],
        this.description = json['description'],
        this.id_category = json['id_category'],
        this.name_category = json['name_category'],
        this.information_category = json['information_category'],
        this.type = json['type'],
        this.url_video = json['url_video'],
        this.url_youtube = json['url_youtube'],
        this.url_photo = json['url_photo'],
        this.week_day_number = json['week_day_number'];

  //Todo: toJson()
  toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "author": this.author,
      "description": this.description,
      "id_category": this.id_category,
      "name_category": this.name_category,
      "information_category": this.information_category,
      "type": this.type,
      "url_video": this.url_video,
      "url_youtube": this.url_youtube,
      "url_photo": this.url_photo,
      "week_day_number": this.week_day_number,
    };
  }
}
