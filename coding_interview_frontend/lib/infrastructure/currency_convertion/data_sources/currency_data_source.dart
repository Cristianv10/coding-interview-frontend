import 'dart:convert';
import 'package:coding_interview_frontend/domain/core/models/conversion_request.dart';
import 'package:coding_interview_frontend/infrastructure/currency_convertion/network/currency_network.dart';
import 'package:http/http.dart' as http;

class CurrencyDataSource {
  Future<Map<String, dynamic>> fetchConversionRate(
      ConversionRequest request) async {
    final queryParams = request.toQueryParameters();
    final uri = Uri.parse(CurrencyNetwork.baseUrl)
        .replace(queryParameters: queryParams);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Failed to fetch conversion rate: ${response.statusCode}');
    }
  }
}
