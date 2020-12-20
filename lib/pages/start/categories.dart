import 'dart:convert';
import 'dart:developer';

import 'package:calibration/data/loader.dart';
import 'package:calibration/data/models.dart';
import 'package:calibration/generated/l10n.dart';
import 'package:calibration/styles.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatefulWidget {
  final Function(Category) onChoose;

  const CategoriesView({Key key, this.onChoose}) : super(key: key);

  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
/*   List<String> _categories = <String>[
    S.current.catFemale,
    S.current.catMale,
    S.current.catKids,
    S.current.catShoes,
    S.current.catAccessory,
    S.current.catElectronic,
    S.current.catToys,
    S.current.catHome
  ]; */

  List<Category> _baseCategories = List<Category>();
  List<Category> _categories = List<Category>();

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  _loadCategories() {
    Loader.instance.getCategories().then((response) {
      final body = json.decode(response.body);
      for (final i in body) {
        _baseCategories.add(Category()
          ..id = i["BaseCategory"]["Id"]
          ..name = i["BaseCategory"]["Name"]);
        for (final e in i["QuizCategories"]) {
          _categories.add(Category()
            ..id = e["Id"]
            ..name = e["Name"]
            ..baseCategoryId = e["BaseQuizCategory"]["Id"]);
        }
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  TextEditingController _catName = TextEditingController();

  Widget _addCatButton() {
    return RaisedButton.icon(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Scaffold(
              appBar: AppBar(
                  title: Text(S.current.addNewCat),
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Styles.actionColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: TextField(
                        controller: _catName,
                        decoration: InputDecoration(
                            labelText: S.current.addNewCatName,
                            border: OutlineInputBorder()),
                        onSubmitted: (text) {
                          Loader.instance.createCategory(text);
                          _loadCategories();
                        },
                      ))),
                  RaisedButton(
                      onPressed: () {
                        Loader.instance.createCategory(_catName.text);
                        _loadCategories();
                      },
                      child: Text(S.current.save))
                ],
              ),
            );
          }));
        },
        icon: Icon(Icons.add),
        label: Text(S.current.addNewCat));
  }

  @override
  Widget build(BuildContext context) {
    if (_categories.isEmpty) {
      return Column(
        children: [
          Center(child: _addCatButton()),
          Expanded(
              child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Styles.primaryColor),
            ),
          )),
        ],
      );
    }
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(child: _addCatButton()),
            Text(S.of(context).startCategorySuggestion),
            Expanded(
              child: ListView.builder(
                itemCount: _baseCategories.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Category base = _baseCategories[index];
                  if (base == null) {
                    return Container();
                  }
                  List<Category> list = _categories
                      .where((e) => e.baseCategoryId == base.id)
                      .toList();
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          catNames[base?.name] ?? base?.name ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(color: Styles.primaryColor),
                        ),
                        ListView.builder(
                            itemCount: list.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              Category item = list[index];
                              if (item == null) {
                                return Container();
                              }
                              return ListTile(
                                  title: Text(
                                    catNames[item?.name] ?? item?.name ?? "",
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  onTap: () {
                                    if (widget.onChoose != null) {
                                      widget.onChoose(item);
                                    }
                                  });
                            })
                      ]);
                },
              ),
            ),
          ],
        ));
  }
}
