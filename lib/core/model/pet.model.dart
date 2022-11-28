class PetModel {
  String? sId;
  final bool returned;
  String? catBreed;
  String? dogBreed;
  final String color;
  final String gender;
  final String owner;
  final String pelage;
  final String size;
  final String species;
  final String status;
  final String photo;
  final String contact;
  final String city;
  String? observation;
  final String date;

  PetModel({
    this.sId,
    required this.returned,
    this.catBreed,
    required this.dogBreed,
    required this.color,
    required this.gender,
    required this.owner,
    required this.pelage,
    required this.size,
    required this.species,
    required this.status,
    required this.photo,
    required this.contact,
    required this.city,
    this.observation,
    required this.date,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      returned: json['returned'],
      sId: json['_id'],
      catBreed: json['cat_breed'],
      dogBreed: json['dog_breed'],
      color: json['color'],
      gender: json['gender'],
      owner: json['owner'],
      pelage: json['pelage'],
      photo: json['photo'],
      size: json['size'],
      species: json['species'],
      status: json['status'],
      contact: json['contact'] ?? "",
      city: json['city'] ?? "-",
      observation: json['observation'] ?? "Sem observação",
      date: json['date'] ?? "-",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['returned'] = returned;
    data['cat_breed'] = catBreed;
    data['dog_breed'] = dogBreed;
    data['color'] = color;
    data['gender'] = gender;
    data['owner'] = owner;
    data['pelage'] = pelage;
    data['size'] = size;
    data['species'] = species;
    data['status'] = status;
    data['photo'] = photo;
    data['contact'] = contact;
    data['city'] = city;
    data['observation'] = observation;
    data['date'] = date;
    return data;
  }
}
