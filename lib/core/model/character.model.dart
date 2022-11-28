class CharacterModel {
  String? sId;
  List<CatBreed>? catBreed;
  List<DogBreed>? dogBreed;
  List<ColorPet>? color;
  List<Gender>? gender;
  List<Pelage>? pelage;
  List<SizePet>? size;
  List<Species>? species;
  List<Status>? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CharacterModel(
      {this.sId,
      this.catBreed,
      this.dogBreed,
      this.color,
      this.gender,
      this.pelage,
      this.size,
      this.species,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV});

  CharacterModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['cat_breed'] != null) {
      catBreed = <CatBreed>[];
      json['cat_breed'].forEach((v) {
        catBreed!.add(CatBreed.fromJson(v));
      });
    }
    if (json['dog_breed'] != null) {
      dogBreed = <DogBreed>[];
      json['dog_breed'].forEach((v) {
        dogBreed!.add(DogBreed.fromJson(v));
      });
    }
    if (json['color'] != null) {
      color = <ColorPet>[];
      json['color'].forEach((v) {
        color!.add(ColorPet.fromJson(v));
      });
    }
    if (json['gender'] != null) {
      gender = <Gender>[];
      json['gender'].forEach((v) {
        gender!.add(Gender.fromJson(v));
      });
    }
    if (json['pelage'] != null) {
      pelage = <Pelage>[];
      json['pelage'].forEach((v) {
        pelage!.add(Pelage.fromJson(v));
      });
    }
    if (json['size'] != null) {
      size = <SizePet>[];
      json['size'].forEach((v) {
        size!.add(SizePet.fromJson(v));
      });
    }
    if (json['species'] != null) {
      species = <Species>[];
      json['species'].forEach((v) {
        species!.add(Species.fromJson(v));
      });
    }
    if (json['status'] != null) {
      status = <Status>[];
      json['status'].forEach((v) {
        status!.add(Status.fromJson(v));
      });
    }

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (catBreed != null) {
      data['cat_breed'] = catBreed!.map((v) => v.toJson()).toList();
    }
    if (color != null) {
      data['color'] = color!.map((v) => v.toJson()).toList();
    }
    if (gender != null) {
      data['gender'] = gender!.map((v) => v.toJson()).toList();
    }
    if (pelage != null) {
      data['pelage'] = pelage!.map((v) => v.toJson()).toList();
    }
    if (size != null) {
      data['size'] = size!.map((v) => v.toJson()).toList();
    }
    if (species != null) {
      data['species'] = species!.map((v) => v.toJson()).toList();
    }
    if (status != null) {
      data['status'] = status!.map((v) => v.toJson()).toList();
    }

    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class CatBreed {
  int? id;
  String? catBreed;
  String? sId;

  CatBreed({this.id, this.catBreed, this.sId});

  CatBreed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catBreed = json['cat_breed'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cat_breed'] = catBreed;
    data['_id'] = sId;
    return data;
  }
}

class DogBreed {
  int? id;
  String? dogBreed;
  String? sId;

  DogBreed({this.id, this.dogBreed, this.sId});

  DogBreed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dogBreed = json['dog_breed'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dog_breed'] = dogBreed;
    data['_id'] = sId;
    return data;
  }
}

class ColorPet {
  int? id;
  String? color;
  String? sId;

  ColorPet({this.id, this.color, this.sId});

  ColorPet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['color'] = color;
    data['_id'] = sId;
    return data;
  }
}

class Gender {
  int? id;
  String? gender;
  String? sId;

  Gender({this.id, this.gender, this.sId});

  Gender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gender = json['gender'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gender'] = gender;
    data['_id'] = sId;
    return data;
  }
}

class Pelage {
  int? id;
  String? pelage;
  String? sId;

  Pelage({this.id, this.pelage, this.sId});

  Pelage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pelage = json['pelage'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pelage'] = pelage;
    data['_id'] = sId;
    return data;
  }
}

class SizePet {
  int? id;
  String? size;
  String? sId;

  SizePet({this.id, this.size, this.sId});

  SizePet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    size = json['size'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['size'] = size;
    data['_id'] = sId;
    return data;
  }
}

class Species {
  int? id;
  String? species;
  String? sId;

  Species({this.id, this.species, this.sId});

  Species.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    species = json['species'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['species'] = species;
    data['_id'] = sId;
    return data;
  }
}

class Status {
  int? id;
  String? sId;

  Status({this.id, this.sId});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['_id'] = sId;
    return data;
  }
}
