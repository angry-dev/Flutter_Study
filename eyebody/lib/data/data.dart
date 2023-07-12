class Food {
  int? id;
  int? date;
  int? type;
  int? kcal;
  String? image;
  String? memo;

  Food({this.id, this.date, this.type, this.kcal, this.image, this.memo});

  factory Food.fromDB(Map<String, dynamic> data) {
    return Food(
      id: data["id"],
      date: data["date"],
      type: data["type"],
      kcal: data["kcal"],
      image: data["image"],
      memo: data["memo"],
    );
  }

  // db에 저장할 수 있게 Map 으로 변환하는 함수
  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "date": this.date,
      "type": this.type,
      "kcal": this.kcal,
      "image": this.image,
      "memo": this.memo,
    };
  }
}

class WorkOut {
  int? id;
  int? date;
  int? time;
  String? image;
  String? name;
  String? memo;

  WorkOut({this.id, this.date, this.time, this.image, this.name, this.memo});

  factory WorkOut.fromDB(Map<String, dynamic> data) {
    return WorkOut(
      id: data["id"],
      date: data["date"],
      time: data["time"],
      image: data["image"],
      name: data["name"],
      memo: data["memo"],
    );
  }

  // db에 저장할 수 있게 Map 으로 변환하는 함수
  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "date": this.date,
      "time": this.time,
      "image": this.image,
      "name": this.name,
      "memo": this.memo,
    };
  }
}

class EyeBody {
  int? id;
  int? date;
  int? weight;
  String? image;

  EyeBody({this.id, this.date, this.weight, this.image});

  factory EyeBody.fromDB(Map<String, dynamic> data) {
    return EyeBody(
      id: data["id"],
      date: data["date"],
      weight: data["weight"],
      image: data["image"],
    );
  }

  // db에 저장할 수 있게 Map 으로 변환하는 함수
  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "date": this.date,
      "weight": this.weight,
      "image": this.image,
    };
  }
}