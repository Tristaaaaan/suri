// Define a function to get the start and end of the current day in milliseconds since epoch
int getStartOfDayInMillis() {
  final now = DateTime.now();
  final startOfDay = DateTime(now.year, now.month, now.day);
  return startOfDay.millisecondsSinceEpoch;
}

int getEndOfDayInMillis() {
  final now = DateTime.now();
  final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59, 999);
  return endOfDay.millisecondsSinceEpoch;
}
