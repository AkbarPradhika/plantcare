class Plant {
  String id;
  String name;
  String type;
  String careInfo;

  Plant(
      {required this.id,
      required this.name,
      required this.type,
      required this.careInfo});

  factory Plant.fromMap(Map<String, dynamic> data) {
    return Plant(
      id: data['id'],
      name: data['name'],
      type: data['type'],
      careInfo: data['careInfo'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'careInfo': careInfo,
    };
  }
}
