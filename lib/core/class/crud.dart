import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:ecommerc2/core/costant/StatusRequest.dart';

class Crud {
  Future<Either<Statusrequest, Map>> PostData(String linkurl, Map data) async {
    try {
      var response = await http.post(Uri.parse(linkurl), body: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);

        if (responsebody.isNotEmpty) {
          return Right(responsebody);
        } else {
          return left(Statusrequest.nodatafailure);
        }
      } else {
        return left(Statusrequest.serverfailure);
      }
    } catch (e) {
      return left(Statusrequest.serverExeption);
    }
  }
}
