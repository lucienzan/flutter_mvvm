import 'dart:convert';

import 'package:flutter_mvvm/provider/hotel.dart';
import 'package:flutter_mvvm/repository/hotel/hotel_repo/hotel_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const String hotelJson = '''
[
  {
    "name":"ABC",
    "classification":5,
    "city":"New York",
    "parking_lot_capacity":500,
    "reviews":[
      {
        "score":4.5,
        "review":"Excellent"
      },
      {
        "score":5.0,
        "review":"Very friendly staff, excellent service!"
      }
    ]
  },
  {
    "name":"DEF",
    "classification":5,
    "city":"Boston",
    "reviews":[
      {
        "score":4.0,
        "review":"Very good"
      },
      {
        "score":5.0
      }
    ]
  },
  {
    "name":"GHI",
    "classification":5,
    "city":"LA"
  },
  {
    "name":"JKL",
    "classification":5,
    "city":"Chicago",
    "parking_lot_capacity":250,
    "reviews":[
      {
        "score":5,
        "review":"Recommended"
      },
      {
        "score":5.0,
        "review":"Soooo goooood"
      }
    ]
  }
]
''';

class HotelImpl extends HotelRepository {
  @override
  Future<List<Hotel>> fetchHotels() async {
    await Future.delayed(const Duration(seconds: 1));
    final hotels = jsonDecode(hotelJson);
    final hotelList = [for (final hotel in hotels) Hotel.fromJson(hotel)];
    return hotelList;
  }
}

final hotelRepoProvider = Provider<HotelImpl>((ref) {
  return HotelImpl();
});
