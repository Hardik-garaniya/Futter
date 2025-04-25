class CashModel {
  final String id;
  final String description;
  final int total;
  final int noteCount;
  final String breakdown;
  final String date;
  final String time;

  CashModel({
    required this.id,
    required this.description,
    required this.total,
    required this.noteCount,
    required this.breakdown,
    required this.date,
    required this.time,
  });

  CashModel copyWith({
    String? id,
    String? description,
    int? total,
    int? noteCount,
    String? breakdown,
    String? date,
    String? time,
  }) {
    return CashModel(
      id: id ?? this.id,
      description: description ?? this.description,
      total: total ?? this.total,
      noteCount: noteCount ?? this.noteCount,
      breakdown: breakdown ?? this.breakdown,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  factory CashModel.fromMap(Map<String, dynamic> map) {
    return CashModel(
      id: map['id'],
      description: map['description'],
      total: map['total'],
      noteCount: map['noteCount'],
      breakdown: map['breakdown'],
      date: map['date'],
      time: map['time'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'total': total,
      'noteCount': noteCount,
      'breakdown': breakdown,
      'date': date,
      'time': time,
    };
  }
}
