import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planner/features/destination/domain/entity/destination_entity.dart';

import '../viewmodel/destination_view_model.dart';

class LoadDestination extends StatelessWidget {
  final WidgetRef ref;
  final List<DestinationEntity> lstDestinations;
  const LoadDestination(
      {super.key, required this.lstDestinations, required this.ref});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lstDestinations.length,
      itemBuilder: ((context, index) => ListTile(
          title: Text(lstDestinations[index].name),
          subtitle: Text(lstDestinations[index].name),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                      'Are you sure you want to delete ${lstDestinations[index].name}?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          ref.read(destinationViewModelProvider.notifier);
                          //.deleteDestination(context, lstDestinations[index]);
                        },
                        child: const Text('Yes')),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete),
          ))),
    );
  }
}
