import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../pages/lost/lost_store.dart';
import '../../pages/lost/pages/lost_list_match.dart';

class BottomSheetCustom extends StatefulWidget {
  final String phoneNumber;

  const BottomSheetCustom({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<BottomSheetCustom> createState() => _BottomSheetCustomState();
}

class _BottomSheetCustomState extends State<BottomSheetCustom> {
  final LostStore store = LostStore();

  bool _hasCallSupport = false;
  Future<void>? _launched;

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  void initState() {
    super.initState();
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            label: const Text(
              "Contato",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: _hasCallSupport
                ? () => setState(() {
                      _launched = _makePhoneCall(widget.phoneNumber);
                    })
                : null,
            icon: const Icon(Icons.phone, color: Colors.white),
          ),
          const SizedBox(width: 5),
          ElevatedButton.icon(
            label: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Match",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () {
              // store.getClusters();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LostListMatch(),
                ),
              );
            },
            icon: const Icon(Icons.favorite, color: Colors.white),
          ),
          FutureBuilder<void>(future: _launched, builder: _launchStatus),
        ],
      ),
    );
  }
}
