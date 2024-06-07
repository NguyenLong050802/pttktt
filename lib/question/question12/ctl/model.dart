class Question12 {
  String name;
  int weight;
  int price;
  double per;
  Question12({
    required this.name,
    required this.weight,
    required this.price,
    required this.per,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'weight': weight,
      'price': price,
      'per': per,
    };
  }

  factory Question12.fromMap(Map<String, dynamic> map) {
    return Question12(
      name: map['name'] as String,
      weight: map['weight'] as int,
      price: map['price'] as int,
      per: map['per'] as double,
    );
  }

  @override
  String toString() => 'name: $name, weight: $weight, price: $price ';
}
