import 'dart:convert';

class ServiceDetails {
    final String? id;
    final String? title;
    final String? description;
    final int? price;
    final String? noOfPerson;
    final String? type;
    final String? image;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? cId;
    final String? planType;
    final String? mainPlanType;
    final String? poojaSamagri;
    final String? fruitFlower;
    final dynamic timeText;

    ServiceDetails({
        this.id,
        this.title,
        this.description,
        this.price,
        this.noOfPerson,
        this.type,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.cId,
        this.planType,
        this.mainPlanType,
        this.poojaSamagri,
        this.fruitFlower,
        this.timeText,
    });

    factory ServiceDetails.fromRawJson(String str) => ServiceDetails.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ServiceDetails.fromJson(Map<String, dynamic> json) => ServiceDetails(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        noOfPerson: json["no_of_person"],
        type: json["type"],
        image: json["image"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        cId: json["c_id"],
        planType: json["plan_type"],
        mainPlanType: json["main_plan_type"],
        poojaSamagri: json["pooja_samagri"],
        fruitFlower: json["fruit_flower"],
        timeText: json["time_text"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "no_of_person": noOfPerson,
        "type": type,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "c_id": cId,
        "plan_type": planType,
        "main_plan_type": mainPlanType,
        "pooja_samagri": poojaSamagri,
        "fruit_flower": fruitFlower,
        "time_text": timeText,
    };
}
