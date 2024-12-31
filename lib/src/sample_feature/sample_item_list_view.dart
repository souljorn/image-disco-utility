import 'package:flutter/material.dart';
import 'package:flutter_picture_application/src/sample_feature/sample_item_list.dart';
import 'package:provider/provider.dart';

import '../settings/settings_view.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {


  const SampleItemListView({
    super.key,
  });

  
  static const routeName = '/';


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: Provider.of<SampleItemList>(context).items.length,
        itemBuilder: (BuildContext context, int index) {
          
          return Consumer<SampleItemList>(builder:(
            context, cart, child) =>
              ListTile(
              title: Text('SampleItem ${cart.getItem(index).image.assetName}'),
              leading: CircleAvatar(
                // Display the Flutter Logo image asset.
                foregroundImage: cart.getItem(index).image,
              ),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                cart.setCurrentItem(index);
                Navigator.restorablePushNamed(
                  context,
                  SampleItemDetailsView.routeName,
                );
              })
           );
        },
      ),
    );
  }
}
