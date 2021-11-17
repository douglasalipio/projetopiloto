import 'package:flutter/material.dart';

class WalletButtonWidget extends StatelessWidget {
  const WalletButtonWidget(
      {Key? key, this.heading, this.subheading, this.supportingText})
      : super(key: key);

  final String? heading;
  final String? subheading;
  final String? supportingText;

  @override
  Widget build(BuildContext context) {
    return _walletButton(
        heading: heading,
        subheading: subheading,
        supportingText: supportingText);
  }

  Card _walletButton(
      {String? heading = "",
      String? subheading = "",
      String? supportingText = ""}) {
    var cardImage =
        NetworkImage('https://source.unsplash.com/random/800x600?house');

    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(heading!),
              subtitle: Text(subheading!),
              trailing: Icon(Icons.favorite_outline),
            ),
            Container(
              height: 150.0,
              child: Ink.image(
                image: cardImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.centerLeft,
              child: Text(supportingText!),
            ),
            ButtonBar(
              children: [
                TextButton(
                  child: const Text('Mais informações',style: TextStyle(color: Colors.green),),
                  onPressed: () {
                    /* ... */
                  },
                ),
                TextButton(
                  child: const Text('Abrir', style: TextStyle(color: Colors.green),),
                  onPressed: () {
                    /* ... */
                  },
                )
              ],
            )
          ],
        ));
  }
}
