class Incident {
  final String title;
  final String description;

  Incident({this.description, this.title});

  factory Incident.fromJson(Map<String, dynamic> json) {
    return Incident(description: json['description'], title: json["title"]);
  }
}
