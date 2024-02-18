extension DateExtension on String {
  String convertToDDMMYYYY() {
    String iso8601Date = "${this}T00:00:00.000Z";
    DateTime dateTime = DateTime.parse(iso8601Date);
    String formattedDate =
        "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year.toString()}";
    return formattedDate;
  }

  String convertToYYYYMMDD(DateTime dt) {
    DateTime dateTime = dt;
    String formattedDate =
        "${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    return formattedDate;
  }
}
