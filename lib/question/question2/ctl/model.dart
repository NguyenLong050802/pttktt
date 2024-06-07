class Question2 {
  String name;
  int weight;
  int price;
  double per;
  Question2({
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

  factory Question2.fromMap(Map<String, dynamic> map) {
    return Question2(
      name: map['name'] as String,
      weight: map['weight'] as int,
      price: map['price'] as int,
      per: map['per'] as double,
    );
  }

  @override
  String toString() => 'Question2(name: $name, weight: $weight, price: $price , per: $per)';
}
