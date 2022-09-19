class CharacterModel {
  final int id;
  final String description;
  final List<Elements> elements;

  CharacterModel(
      {required this.id, required this.description, required this.elements});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
        id: json['id'],
        description: json['description'],
        elements: List.from(json['elements'])
            .map((e) => Elements.fromJson(e))
            .toList());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['elements'] = elements.map((v) => v.toJson()).toList();
    return data;
  }
}

class Elements {
  final int id;
  final String value;

  Elements({required this.id, required this.value});

  factory Elements.fromJson(Map<String, dynamic> json) {
    return Elements(id: json['id'], value: json['value']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['value'] = value;
    return data;
  }
}
