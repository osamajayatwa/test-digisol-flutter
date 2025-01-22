import 'package:dartz/dartz.dart';
import 'package:test_digisol_flutter/core/class/crud.dart';
import 'package:test_digisol_flutter/core/class/statusrequest.dart';
import 'package:test_digisol_flutter/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  Future<Either<StatusRequest, List<dynamic>>> getData() async {
    var response = await crud.getData(AppLink.homepage, {});
    return response.fold(
      (l) => Left(StatusRequest.serverfailure),
      (r) => Right(r),
    );
  }
}
