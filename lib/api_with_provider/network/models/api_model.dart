class GetApiModel {
    String? name;
    String? city;

    GetApiModel({
        required this.name,
        required this.city,
    });

    factory GetApiModel.fromJson(Map<String, dynamic> json) => GetApiModel(
        name: json["name"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "city": city,
    };
}
