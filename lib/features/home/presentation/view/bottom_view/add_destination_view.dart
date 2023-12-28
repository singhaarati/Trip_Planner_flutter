import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:trip_planner/features/destination/domain/entity/destination_entity.dart';
import 'package:trip_planner/features/destination/presentation/viewmodel/destination_view_model.dart';

class AddDestinationView extends ConsumerStatefulWidget {
  const AddDestinationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddDestinationViewState();
}

class _AddDestinationViewState extends ConsumerState<AddDestinationView> {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final priceController = TextEditingController();
  //final pictureController = TextEditingController();

  checkCameraPermission() async {
    if (await Permission.camera.request().isRestricted ||
        await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  File? _img;
  Future _browseImage(WidgetRef ref, ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
          ref.read(destinationViewModelProvider.notifier).uploadImage(_img);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  final _formkey = GlobalKey<FormState>();

  void createDestination() {
  
    DestinationEntity newDestination = DestinationEntity(
        name: nameController.text.trim(),
        location: locationController.text.trim(),
        price: priceController.text.trim(),
        picture: ref.read(destinationViewModelProvider).imageName ?? '');

    ref
        .read(destinationViewModelProvider.notifier)
        .createDestination(newDestination);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Destination'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.grey[300],
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                _browseImage(ref, ImageSource.camera);
                                Navigator.pop(context);
                                // Upload image it is not null
                              },
                              icon: const Icon(Icons.camera),
                              label: const Text('Camera'),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                _browseImage(ref, ImageSource.gallery);
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.image),
                              label: const Text('Gallery'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                      height: 200,
                      width: 400,
                      child: _img != null
                          ? Image(
                              image: FileImage(_img!),
                              fit: BoxFit.cover,
                            )
                          : Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/images/city1.jpg'),
                                fit: BoxFit.cover,
                              )),
                            )),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Destination Name',
                    hintText: 'Enter destination name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: locationController,
                  decoration: const InputDecoration(
                    labelText: 'Location',
                    hintText: 'Enter location',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    hintText: 'Enter price',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      createDestination();
                    }
                  },
                  child: const Text('Save Destination'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
