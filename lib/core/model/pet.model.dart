import 'character.model.dart';

class PetModel {
  final int id;
  CatBreed? catBreed;
  final ColorPet color;
  final Gender gender;
  final String owner;
  final Pelage pelage;
  final String photo;
  final SizePet size;
  final Species species;
  final int status;
  String? contact;
  String? city;
  String? observation;
  String? date;

  PetModel({
    required this.id,
    this.catBreed,
    required this.color,
    required this.gender,
    required this.owner,
    required this.pelage,
    required this.photo,
    required this.size,
    required this.species,
    required this.status,
    this.contact,
    this.city,
    this.observation,
    this.date,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json['id'],
      catBreed: json['cat_breed'] != null
          ? CatBreed.fromJson(json['cat_breed'])
          : null,
      color: ColorPet.fromJson(json['color']),
      gender: Gender.fromJson(json['gender']),
      owner: json['owner'],
      pelage: Pelage.fromJson(json['pelage']),
      photo: json['photo'],
      size: SizePet.fromJson(json['size']),
      species: Species.fromJson(json['species']),
      status: json['status'],
      contact: json['contact'] ?? "",
      city: json['city'] ?? "-",
      observation: json['observation'] ?? "sem observação",
      date: json['date'] ?? "-",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cat_breed'] = catBreed;
    data['color'] = color;
    data['gender'] = gender;
    data['owner'] = owner;
    data['pelage'] = pelage;
    data['photo'] = photo;
    data['size'] = size;
    data['species'] = species;
    data['status'] = status;
    data['contact'] = contact;
    data['city'] = city;
    data['observation'] = observation;
    data['date'] = date;
    return data;
  }
}
