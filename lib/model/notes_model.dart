class NotesModel {
  String? title;
  String? description;
  String? date;
  int? color;
  NotesModel(
      {required this.title,
      required this.description,
      this.date,
      required this.color});
}
