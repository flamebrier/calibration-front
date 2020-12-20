import 'package:calibration/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../styles.dart';

class EnterExisting extends StatelessWidget {
  final bool implyLeading;

  EnterExisting({Key key, this.implyLeading = true}) : super(key: key);

  final TextEditingController _linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.startAlready),
        leading: implyLeading
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Styles.actionColor,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            : Container(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              if (!implyLeading) ...[
                Text(S.current.startNotAuth,
                    style: Theme.of(context).textTheme.subtitle2),
                Container(height: 25)
              ],
              Text(S.current.startAlreadyLong),
              Container(height: 25),
              TextField(
                controller: _linkController,
                decoration: InputDecoration(
                    labelText: S.current.startLinkInfo,
                    border: OutlineInputBorder()),
                onSubmitted: (text) {},
              ),
              Spacer(),
              ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _linkController,
                  builder: (context, value, child) {
                    if ((value.text ?? "").isEmpty) {
                      return Container();
                    }
                    return IconButton(
                      icon: Icon(Icons.play_circle_fill_rounded),
                      color: Styles.actionColor,
                      splashRadius: 24,
                      onPressed: () {},
                      iconSize: 128,
                    );
                  })
            ]),
      ),
    );
  }
}
