class Question3 {
  int id;
  int start;
  int end;
  Question3({
    required this.id,
    required this.start,
    required this.end,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'start': start,
      'end': end,
    };
  }

  factory Question3.fromMap(Map<String, dynamic> map) {
    return Question3(
      id: map['id'] as int,
      start: map['start'] as int,
      end: map['end'] as int,
    );
  }

  @override
  String toString() => 'Question3(id: $id, start: $start, end: $end)';
}
