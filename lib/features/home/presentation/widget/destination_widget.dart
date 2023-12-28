import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planner/features/destination/domain/entity/destination_entity.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../destination/presentation/viewmodel/destination_view_model.dart';

class DestinationWidget extends StatelessWidget {
  final WidgetRef ref;
  final List<DestinationEntity> destinationList;
  const DestinationWidget(
      {super.key, required this.ref, required this.destinationList});

  @override
  Widget build(BuildContext context) {
    var destinationState = ref.watch(destinationViewModelProvider);
    return GridView.builder(
      shrinkWrap: true,
      itemCount: destinationList.length,
      //  scrollDirection: Axis.horizontal,
      //physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              ref
                  .read(destinationViewModelProvider.notifier)
                  .getDestinationById(
                      context, destinationList[index].destinationId!);
            },
            child: Card(
              color: const Color.fromARGB(255, 214, 187, 209),
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        ApiEndpoints.imageUrl +
                            destinationState.destinations[index].picture,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      destinationList[index].name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 1),
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        Text(
                          "4.5",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
