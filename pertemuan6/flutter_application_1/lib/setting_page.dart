import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting Page'),
      ),
      body: ListView( //UBAH JADI LISTVIEW
        padding : const EdgeInsets.all(16.0),
        children: [
          ListTile (
            leading: const Icon(Icons.color_lens),
            title: const Text('Theme'),
            subtitle: const Text('Light / Dark'),
            trailing : DropdownButton<String>(
              items: const [
                DropdownMenuItem(value: 'light', child: Text('Light')),
                DropdownMenuItem(value: 'dark', child: Text('Dark')),
              ],
              onChanged: (value) {},
              hint : const Text('Select Theme'),
                // Handle theme change
            ),
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Notifications'),
            value: true,
            onChanged: (val) {
              // Handle notification toggle
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About App'),
            subtitle : const Text('Version 1.0.0'),
          ),
        ]
      ),
    );
  }
}
