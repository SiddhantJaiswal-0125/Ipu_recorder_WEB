class Role {
  String? name;
  String? description;

  Role.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'];
}