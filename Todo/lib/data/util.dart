class Utils {
  // DateTime -> int 로 형변환 하는 함수
  static int getFormatTime(DateTime date) {
    return int.parse(
        "${date.year}${makeTwoDigit(date.month)}${makeTwoDigit(date.day)}}");
  }

  // 다시 int -> DateTime 으로 형변환 하는 함수
  static DateTime numToDateTime(int date) {
    String d = date.toString();
    int year = int.parse(d.substring(0, 4));
    int month = int.parse(d.substring(4, 6));
    int day = int.parse(d.substring(6, 8));
    return DateTime(year, month, day);
  }

  // 202378 => 20230708
  // 위 월,날짜를 두자리 수로 맞추기 위한 함수
  static String makeTwoDigit(int num) {
    return num.toString().padLeft(2, "0");
  }
}
