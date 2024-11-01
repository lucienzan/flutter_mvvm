import 'package:flutter/material.dart';
import 'package:flutter_mvvm/provider/hotel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repository/hotel/hotel_impl/hotel_impl.dart';

class HotelList extends ConsumerStatefulWidget {
  const HotelList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HotelListState();
}

class _HotelListState extends ConsumerState<HotelList> {
  List<Hotel> hotelList = [];
  bool isLoading = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchHotels();
  }

  Future<void> fetchHotels() async {
    try {
      isLoading = true;
      hotelList = await ref.read(hotelRepoProvider).fetchHotels();
    } on Exception catch (e) {
      errorMessage = e.toString();
    } finally {
      setState(() {
      isLoading = false;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hotels')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : _buildHotels(),
    );
  }

  Widget _buildHotels() {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: ListView.separated(
      itemCount: hotelList.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Colors.grey,
          thickness: 2,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        final Hotel hotel = hotelList[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'name: ${hotel.name}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'classification: ${hotel.classification}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'city: ${hotel.city}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'parking: ${hotel.parkingLotCapacity ?? "NA"}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10.0),
            const Divider(color: Colors.grey),
            if (hotel.reviews.isEmpty)
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Be the first reviewer',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            if (hotel.reviews.isNotEmpty)
              ListView.separated(
                primary: false,
                shrinkWrap: true,
                itemCount: hotel.reviews.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(color: Colors.grey);
                },
                itemBuilder: (BuildContext context, int index) {
                  final Review review = hotel.reviews[index];

                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${review.score}'),
                    ),
                    title: Text(review.review ?? 'No written review'),
                  );
                },
              ),
          ],
        );
      },
    ),
  );
}
}

