class PetModel {
  final int id;
  List<PetElements> elements;

  PetModel({required this.id, required this.elements});

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
        id: json['id'],
        elements: List.from(json['elements'])
            .map((e) => PetElements.fromJson(e))
            .toList());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['elements'] = elements.map((v) => v.toJson()).toList();
    return data;
  }
}

class PetElements {
  final int catBreed;
  final int color;
  final int gender;
  final String owner;
  final int pelage;
  final String photo;
  final int size;
  final int species;
  final int status;

  PetElements({
    required this.catBreed,
    required this.color,
    required this.gender,
    required this.owner,
    required this.pelage,
    required this.photo,
    required this.size,
    required this.species,
    required this.status,
  });

  factory PetElements.fromJson(Map<String, dynamic> json) {
    return PetElements(
        catBreed: json['cat_breed'],
        color: json['color'],
        gender: json['gender'],
        owner: json['owner'],
        pelage: json['pelage'],
        photo: json['photo'],
        size: json['size'],
        species: json['species'],
        status: json['status']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cat_breed'] = catBreed;
    data['color'] = color;
    data['gender'] = gender;
    data['owner'] = owner;
    data['pelage'] = pelage;
    data['photo'] = photo;
    data['size'] = size;
    data['species'] = species;
    data['status'] = status;
    return data;
  }
}
