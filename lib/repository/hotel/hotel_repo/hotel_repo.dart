import '../../../provider/hotel.dart';

abstract class HotelRepository {
  Future<List<Hotel>> fetchHotels();
}