import 'package:flutter/material.dart';
import 'package:projeto_piloto/app/wallet/pages/wallet_detail_page.dart';

class WalletButtonWidget extends StatelessWidget {
  const WalletButtonWidget(
      {Key? key,
      this.heading,
      this.subheading,
      this.supportingText,
      this.imageName})
      : super(key: key);

  final String? heading;
  final String? subheading;
  final String? supportingText;
  final String? imageName;

  @override
  Widget build(BuildContext context) {
    return _walletButton(
        context: context,
        heading: heading,
        subheading: subheading,
        supportingText: supportingText,
        imageName: imageName);
  }

  Card _walletButton(
      {BuildContext? context,
      String? heading = "",
      String? imageName = "",
      String? subheading = "",
      String? supportingText = ""}) {
    // var cardImage =
    //     NetworkImage('https://source.unsplash.com/random/800x600?building');

    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text(heading!),
                subtitle: Text(subheading!),
                trailing: Icon(Icons.favorite_outline),
              ),
            ),
            Container(
              height: 150.0,
              child: Ink.image(
                image: Image.asset(imageName!).image,
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
                  child: const Text(
                    'Mais informações',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    /* ... */
                  },
                ),
                TextButton(
                  child: const Text(
                    'Abrir',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context!,
                      MaterialPageRoute(
                          builder: (context) => WalletDetailPage(
                                heading: heading,
                              )),
                    );
                  },
                )
              ],
            )
          ],
        ));
  }
}
