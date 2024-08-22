extension StringExt on String {
  String replacePercentage(int newPercentage) {
    return replaceAll('{percentage}', '$newPercentage%');
  }

  String getFutureDate() {
    final now = DateTime.now();
    final futureDate = now.add(Duration(days: int.parse(this)));
    final monthNames = [
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
    final month = monthNames[futureDate.month - 1];
    final day = futureDate.day;
    final year = futureDate.year;
    return '$month $day, $year';
  }

  String get twoDecimalPlaces {
    final doubleValue = double.tryParse(this);
    if (doubleValue == null) return this;
    return doubleValue.toStringAsFixed(2);
  }

  String get twoDecimalPlacesCurrency {
    final doubleValue = double.tryParse(this);
    if (doubleValue == null) return this;

    final formattedValue = doubleValue.toStringAsFixed(2);
    final parts = formattedValue.split('.');
    final integerPart = parts[0];
    final decimalPart = parts[1];
    final formattedInteger = integerPart.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]},',
    );

    return '$formattedInteger.$decimalPart';
  }
}
