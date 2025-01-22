import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:test_digisol_flutter/core/class/statusrequest.dart';

class Crud {
  Future<Either<StatusRequest, List<dynamic>>> getData(
      String linkurl, Map<String, dynamic> params) async {
    final uri = Uri.parse(linkurl).replace(queryParameters: params);
    final response = await http.get(uri);

    if (response.statusCode == 200 || response.statusCode == 201) {
      try {
        final List<dynamic> responseBody = jsonDecode(response.body);

        return Right(responseBody);
      } catch (e) {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }
}
