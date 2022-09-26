class PetModel {
  final int id;
  int? catBreed;
  int? dogBreed;
  final int color;
  final int gender;
  final String owner;
  final int pelage;
  final String photo;
  final int size;
  final int species;
  final int status;

  PetModel({
    required this.id,
    this.catBreed,
    this.dogBreed,
    required this.color,
    required this.gender,
    required this.owner,
    required this.pelage,
    required this.photo,
    required this.size,
    required this.species,
    required this.status,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
        id: json['id'],
        catBreed: json['cat_breed'],
        dogBreed: json['dog_breed'],
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
    data['id'] = id;
    data['cat_breed'] = catBreed;
    data['dog_breed'] = catBreed;
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
