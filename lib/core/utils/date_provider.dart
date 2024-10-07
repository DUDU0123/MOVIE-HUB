class DateProvider {
  static String getDateInMonthDateFormat({required String dateString}) {
    DateTime date = DateTime.parse(dateString);
    List<String> monthAbbreviations = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    String month = monthAbbreviations[date.month - 1];
    int day = date.day;

    String formattedDate = '$day $month';

    return formattedDate;
  }
}
