import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  Future<String> formatDateDMMMYYYY(String dateString) async {
    DateTime dateTime = DateTime.parse(dateString);
    await initializeDateFormatting('id_ID', null);
    String formattedDate = DateFormat('d MMMM yyyy', 'id_ID').format(dateTime);
    return formattedDate;
  }

  Future<String> parseDateFromIndoFormat(String indoDate) async {
    await initializeDateFormatting('id_ID', null);
    DateTime dateTime = DateFormat('d MMMM yyyy', 'id_ID').parse(indoDate);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
}
