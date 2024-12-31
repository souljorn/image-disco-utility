import 'package:flutter/material.dart';
import 'package:flutter_picture_application/src/sample_feature/sample_item_list.dart';
import 'package:provider/provider.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: Consumer<SampleItemList>(builder:(
            context, cart, child) =>Center(
        child:Image(image: AssetImage(cart.getItem(cart.currentItem).image.assetName)),
      ),
    ));
  }
}
