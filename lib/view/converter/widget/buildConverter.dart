import 'package:flutter/material.dart';
import '../../../core/model/doviz.dart';
import '../../../core/service/dovizApi.dart';
import '../../../core/utils/constants.dart';

class BuildConverter extends StatefulWidget {
  const BuildConverter({Key? key}) : super(key: key);

  @override
  State<BuildConverter> createState() => _BuildConverterState();
}

class _BuildConverterState extends State<BuildConverter> {
  TextEditingController _inputController = TextEditingController();
  TextEditingController _outputController = TextEditingController();

  final List<String> _from = ["USD", "EUR", "TRY"];
  final List<String> _to = ["TRY", "EUR", "USD"];

  String _fromSelected = "USD";
  String _toSeleceted = "TRY";

  late final DovizApi dovizService;
  Doviz? doviz;

  bool _isConverted = false;

  @override
  void initState() {
    super.initState();
    dovizService = DovizApi();
  }

  _convertMethod(String _from, String _to, String _amount) async {
    try {
      var data = await dovizService.fetchDoviz(_from, _to, _amount);
      setState(() {
        doviz = data;
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 229,
      child: Padding(
        padding:
        const EdgeInsets.only(left: padding, right: padding, bottom: 12.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            buildTextFields(),
            Column(
              children: [
                Row(
                  children: [
                    buildButton("1", context),
                    buildButton("2", context),
                    buildButton("3", context),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4", context),
                    buildButton("5", context),
                    buildButton("6", context),
                  ],
                ),
                Row(
                  children: [
                    buildButton("7", context),
                    buildButton("8", context),
                    buildButton("9", context),
                  ],
                ),
                Row(
                  children: [
                    buildButton(",", context),
                    buildButton("0", context),
                    Expanded(
                      child: SizedBox(
                        width: 90,
                        height: 90,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _inputController.clear();
                                _outputController.clear();
                                _isConverted = false;
                              });
                              _inputController.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset: _inputController.text.length));
                            },
                            child: const Icon(
                              Icons.clear,
                              color: primary,
                              size: 45,
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  buildTextFields() {
    return Column(
      children: [
        const SizedBox(
          height: 55,
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _inputController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Amount",
                ),
                onChanged: (value) {
                  print(_inputController.value.text);
                  _convertMethod(
                      _fromSelected, _toSeleceted, _inputController.text);
                  setState(() {
                    _isConverted = true;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: primary, width: 0.80),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: _from
                      .map((value) => DropdownMenuItem(
                    child: Text(
                      value,
                      style: const TextStyle(color: orange),
                    ),
                    value: value,
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _fromSelected = value!;
                    });
                  },
                  isExpanded: false,
                  value: _fromSelected,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _outputController,
                enabled: false,
                decoration: InputDecoration(
                  hintText: _isConverted == false ? "0.0" : doviz?.result.toString(),
                ),
                onChanged: (text) {},
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: primary, width: 0.80),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: _to
                      .map((value) => DropdownMenuItem(
                    child: Text(
                      value,
                      style: const TextStyle(color: orange),
                    ),
                    value: value,
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _toSeleceted = value!;
                    });
                  },
                  isExpanded: false,
                  value: _toSeleceted,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }

  buildButton(String buttonText, BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 90,
        height: 90,
        child: OutlinedButton(
          onPressed: () {
            setState(() {
              _inputController.text = _inputController.text + buttonText;
              _inputController.selection = TextSelection.fromPosition(
                  TextPosition(offset: _inputController.text.length));
            });
            _convertMethod(_fromSelected, _toSeleceted, _inputController.text);
            setState(() {
              _isConverted = true;
            });
          },
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
          child: Container(
              child: Text(
                buttonText,
                style: Theme.of(context).textTheme.bodyText1,
              )),
        ),
      ),
    );
  }
}
