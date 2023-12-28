import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planner/config/constants/api_endpoint.dart';
import 'package:trip_planner/features/destination/presentation/viewmodel/destination_view_model.dart';

import '../../../../config/router/app_route.dart';

class DestinationUserView extends ConsumerWidget {
  const DestinationUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var destinationState = ref.watch(destinationViewModelProvider);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('Destination detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (destinationState.isLoading) ...{
              const CircularProgressIndicator(),
            } else if (destinationState.error != null) ...{
              Text(destinationState.error!),
            } else if (destinationState.singleDestination!.isEmpty) ...{
              const Center(
                child: Text('No Destinations'),
              ),
            } else ...{
              Expanded(
                child: ListView.builder(
                  itemCount: destinationState.singleDestination!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 400,
                          child: ClipRRect(
                            child: Image.network(
                              ApiEndpoints.imageUrl +
                                  destinationState
                                      .singleDestination![index].picture,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            destinationState.singleDestination![index].name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            destinationState.singleDestination![index].location,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text(
                            'Price: ${destinationState.singleDestination![index].price}',
                            //destinationState.singleDestination[index].price,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoute.bookingRoute,
                                  arguments: destinationState
                                      .singleDestination![index].destinationId);
                            },
                            child: const Text(
                              'Book Now',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text(
                                            "Are you sure want to delete ${destinationState.singleDestination![index].name}"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('No')),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                ref
                                                    .read(
                                                        destinationViewModelProvider
                                                            .notifier)
                                                    .deleteDestinationById(
                                                        context,
                                                        destinationState
                                                                .singleDestination![
                                                            index]);
                                              },
                                              child: const Text('Yes')),
                                        ],
                                      ));
                            },
                            child: const Text(
                              'Delete Destination',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            },
          ],
        ),
      ),
    );
  }
}
