import 'package:dio/dio.dart';
import 'package:effective_mobile/feature/data/data_sources/api_const/api_const.dart';
import 'package:effective_mobile/feature/data/models/hotel_model.dart';
import 'package:effective_mobile/feature/data/models/register_model.dart';
import 'package:effective_mobile/feature/data/models/room_model.dart';


class ApiService {
  final Dio _client = Dio();
  get dio => null;
  Future<HotelModel?> getUsers() async {
    try {
      var response = await _client.get(ApiConstHotel.url());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return HotelModel.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<Room>?> getUsers1() async {
    try {
      var response = await _client.get(ApiConstRoom.uri());
      if (response.statusCode == 200 || response.statusCode == 201) {
        List rooms = response.data['rooms'];
        return rooms.map((e) => Room.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<RegisterModel?> getUsers2() async {
    try {
      var response = await _client.get(ApiConstRegister.url());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return RegisterModel.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
