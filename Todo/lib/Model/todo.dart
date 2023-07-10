class Todo {
  // 제목, 메모, 카테고리
  String title, memo, category;
  // 색상, 할일 성공 유무, 날짜
  int color, done, date;

  Todo({
    required this.title,
    required this.memo,
    required this.category,
    required this.color,
    required this.done,
    required this.date,
  });
}
