class Incident {
  final String title;
  final String description;
  final String imageURL;

  Incident({this.description, this.title,this.imageURL});

  factory Incident.fromJson(Map<String, dynamic> json) {
    return Incident(description: json['description'], title: json["title"],imageURL: json["image"]);
  }
}
