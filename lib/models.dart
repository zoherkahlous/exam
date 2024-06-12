class Aux {
  int? id;
  String? name;
  String? description;
  double? price;
  String? image;
  double? rating;
  String? brand;
  String? color;
  String? connectivity;
  bool? wireless;

  Aux({this.id,
    this.name,
    this.description,
    this.price,
    this.image,
    this.rating,
    this.brand,
    this.color,
    this.connectivity,
    this.wireless});

  Aux.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    rating = json['rating'];
    brand = json['brand'];
    color = json['color'];
    connectivity = json['connectivity'];
    wireless = json['wireless'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['brand'] = this.brand;
    data['color'] = this.color;
    data['connectivity'] = this.connectivity;
    data['wireless'] = this.wireless;
    return data;
  }

  @override
  String toString() {
    return 'Dogs(id: $id, name: $name, description: $description, price: $price, image: $image,rating:$rating,brand:$brand,color:$color,connectivity:$connectivity,wireless:$wireless)';
  }

  Aux copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    String? image,
    double? rating,
    String? brand,
    String? color,
    String? connectivity,
    bool? wireless,
  }) {
    return Aux(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description??this.description,
      price: price ??this.price,
      image: image ?? this.image,
      rating: rating??this.rating,
      brand: brand??this.brand,
      color: color??this.color,
      connectivity: connectivity??this.connectivity,
      wireless: wireless??this.wireless


    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description':description,
      'price':price,
      'image': image,
      'rating':rating,
      'brand':brand,
      'color':color,
      'connectivity':connectivity,
      'wireless':wireless

    };
  }

  factory Aux.fromMap(Map<String, dynamic> map) {
    return Aux(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] !=null ?map['description'] as String:null,
      price: map['price'] !=null ?map['price'] as double:null,
      image: map['image'] != null ? map['image'] as String : null,
        rating: map['rating'] != null ? map['rating'] as double : null ,
      brand: map['brand'] != null ? map['brand'] as String : null,
      color: map['color'] != null ? map['color'] as String : null,
      connectivity: map['connectivity'] != null ? map['connectivity'] as String : null,
      wireless: map['wireless'] != null ? map['wireless'] as bool : null,

    );
  }
}

