class DateParser {

  static List months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];


  static String parseDate(DateTime articleDate, DateTime now){

    // Today
    if (now.toString().substring(0, 10) == articleDate.toString().substring(0, 10))
      return 'Today, ${articleDate.toString().substring(11, 16)}';
    
    // Yesterday
    if (
        now.day == articleDate.day + 1 &&
        now.month == articleDate.month &&
        now.year == articleDate.year
      )
    return 'Yesterday, ${articleDate.toString().substring(11, 16)}';
    
    // This year
    if (now.year == articleDate.year)
      return '${months[articleDate.month - 1]} ${articleDate.day}';

    // Other date
    return '${months[articleDate.month - 1]} ${articleDate.day}, ${articleDate.year}';

  }
}