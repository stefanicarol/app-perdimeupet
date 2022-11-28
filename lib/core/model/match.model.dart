class MatchModel {
  int? size;
  List<PetsMatch>? pets;

  MatchModel({this.size, this.pets});

  MatchModel.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    if (json['pets'] != null) {
      pets = <PetsMatch>[];
      json['pets'].forEach((v) {
        pets!.add(PetsMatch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['size'] = size;
    if (pets != null) {
      data['pets'] = pets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PetsMatch {
  int? id;
  int? catBreed;
  int? color;
  int? gender;
  int? pelage;
  int? size;
  int? species;

  PetsMatch({
    this.id,
    this.catBreed,
    this.color,
    this.gender,
    this.pelage,
    this.size,
    this.species,
  });

  PetsMatch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catBreed = json['cat_breed'];
    color = json['color'];
    gender = json['gender'];
    pelage = json['pelage'];
    size = json['size'];
    species = json['species'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cat_breed'] = catBreed;
    data['color'] = color;
    data['gender'] = gender;
    data['pelage'] = pelage;
    data['size'] = size;
    data['species'] = species;
    return data;
  }
}
