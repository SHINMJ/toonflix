class Utility {
  static String secToMinute(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 4);
  }

  static String secToMinuteOnlySec(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(5, 7);
  }

  static String secFormat(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2);
  }
}