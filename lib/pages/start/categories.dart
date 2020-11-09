import 'package:calibration/generated/l10n.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatefulWidget {
  final Function(String) onChoose;

  const CategoriesView({Key key, this.onChoose}) : super(key: key);

  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  List<String> _categories = <String>[
    S.current.catFemale,
    S.current.catMale,
    S.current.catKids,
    S.current.catShoes,
    S.current.catAccessory,
    S.current.catElectronic,
    S.current.catToys,
    S.current.catHome
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(S.of(context).startCategorySuggestion),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  _categories[index],
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                onTap: () {
                  if (widget.onChoose != null) {
                    widget.onChoose(_categories[index]);
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
