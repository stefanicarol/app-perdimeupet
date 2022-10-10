class CharacterModel {
  String? sId;
  List<CatBreed>? catBreed;
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
        catBreed!.add(new CatBreed.fromJson(v));
      });
    }
    if (json['color'] != null) {
      color = <ColorPet>[];
      json['color'].forEach((v) {
        color!.add(new ColorPet.fromJson(v));
      });
    }
    if (json['gender'] != null) {
      gender = <Gender>[];
      json['gender'].forEach((v) {
        gender!.add(new Gender.fromJson(v));
      });
    }
    if (json['pelage'] != null) {
      pelage = <Pelage>[];
      json['pelage'].forEach((v) {
        pelage!.add(new Pelage.fromJson(v));
      });
    }
    if (json['size'] != null) {
      size = <SizePet>[];
      json['size'].forEach((v) {
        size!.add(new SizePet.fromJson(v));
      });
    }
    if (json['species'] != null) {
      species = <Species>[];
      json['species'].forEach((v) {
        species!.add(new Species.fromJson(v));
      });
    }
    if (json['status'] != null) {
      status = <Status>[];
      json['status'].forEach((v) {
        status!.add(new Status.fromJson(v));
      });
    }

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.catBreed != null) {
      data['cat_breed'] = this.catBreed!.map((v) => v.toJson()).toList();
    }
    if (this.color != null) {
      data['color'] = this.color!.map((v) => v.toJson()).toList();
    }
    if (this.gender != null) {
      data['gender'] = this.gender!.map((v) => v.toJson()).toList();
    }
    if (this.pelage != null) {
      data['pelage'] = this.pelage!.map((v) => v.toJson()).toList();
    }
    if (this.size != null) {
      data['size'] = this.size!.map((v) => v.toJson()).toList();
    }
    if (this.species != null) {
      data['species'] = this.species!.map((v) => v.toJson()).toList();
    }
    if (this.status != null) {
      data['status'] = this.status!.map((v) => v.toJson()).toList();
    }

    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cat_breed'] = this.catBreed;
    data['_id'] = this.sId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color'] = this.color;
    data['_id'] = this.sId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['gender'] = this.gender;
    data['_id'] = this.sId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pelage'] = this.pelage;
    data['_id'] = this.sId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['size'] = this.size;
    data['_id'] = this.sId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['species'] = this.species;
    data['_id'] = this.sId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['_id'] = this.sId;
    return data;
  }
}
