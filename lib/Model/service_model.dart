import 'dart:convert';

class ServiceModel {
    String? id;
    String? artistName;
    String? categoryId;
    String? subId;
    List<String>? servicesImage;
    String? profileImage;
    String? mrpPrice;
    String? specialPrice;
    String? vId;
    String? roll;
    String? serDesc;
    String? serviceStatus;
    String? helperPrice;
    dynamic chefsPrice;
    String? perDCharge;
    String? taxStatus;
    String? gstAmount;
    String? chargeType;
    String? serviceType;
    dynamic transport;
    String? requestStatus;
    String? serviceImg;
    String? plans;
    String? firstPrice;
    String? lastPrice;

    ServiceModel({
        this.id,
        this.artistName,
        this.categoryId,
        this.subId,
        this.servicesImage,
        this.profileImage,
        this.mrpPrice,
        this.specialPrice,
        this.vId,
        this.roll,
        this.serDesc,
        this.serviceStatus,
        this.helperPrice,
        this.chefsPrice,
        this.perDCharge,
        this.taxStatus,
        this.gstAmount,
        this.chargeType,
        this.serviceType,
        this.transport,
        this.requestStatus,
        this.serviceImg,
        this.plans,
        this.firstPrice,
        this.lastPrice,
    });

    factory ServiceModel.fromRawJson(String str) => ServiceModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json["id"],
        artistName: json["artist_name"],
        categoryId: json["category_id"],
        subId: json["sub_id"],
        servicesImage: json["services_image"] == null ? [] : List<String>.from(json["services_image"]!.map((x) => x)),
        profileImage: json["profile_image"],
        mrpPrice: json["mrp_price"],
        specialPrice: json["special_price"],
        vId: json["v_id"],
        roll: json["roll"],
        serDesc: json["ser_desc"],
        serviceStatus: json["service_status"],
        helperPrice: json["helper_price"],
        chefsPrice: json["chefs_price"],
        perDCharge: json["per_d_charge"],
        taxStatus: json["tax_status"],
        gstAmount: json["gst_amount"],
        chargeType: json["charge_type"],
        serviceType: json["service_type"],
        transport: json["transport"],
        requestStatus: json["request_status"],
        serviceImg: json["service_img"],
        plans: json["plans"],
        firstPrice: json["first_price"],
        lastPrice: json["last_price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "artist_name": artistName,
        "category_id": categoryId,
        "sub_id": subId,
        "services_image": servicesImage == null ? [] : List<dynamic>.from(servicesImage!.map((x) => x)),
        "profile_image": profileImage,
        "mrp_price": mrpPrice,
        "special_price": specialPrice,
        "v_id": vId,
        "roll": roll,
        "ser_desc": serDesc,
        "service_status": serviceStatus,
        "helper_price": helperPrice,
        "chefs_price": chefsPrice,
        "per_d_charge": perDCharge,
        "tax_status": taxStatus,
        "gst_amount": gstAmount,
        "charge_type": chargeType,
        "service_type": serviceType,
        "transport": transport,
        "request_status": requestStatus,
        "service_img": serviceImg,
        "plans": plans,
        "first_price": firstPrice,
        "last_price": lastPrice,
    };
}
