class Task {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  int? remind;
  String? repeat;
  Task({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.remind,
    this.repeat,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isCompleted'] = isCompleted;
    data['color'] = color;
    data['remiind'] = remind;
    data['note'] = note;
    data['date'] = date;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['repeat'] = repeat;
    data['title'] = title;
    return data;
  }

  Task.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    note = map['note'];
    isCompleted = map['isCompleted'];
    date = map['date'];
    color = map['color'];
    startTime = map['startTime'];
    endTime = map['endTime'];
    remind = map['remind'];
    repeat = map['repeat'];
  }
}
