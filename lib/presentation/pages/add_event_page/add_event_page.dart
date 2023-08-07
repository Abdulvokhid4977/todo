import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/services/db_helper.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Color? dropDownValue = Colours.priorityBlue;
  final List<Color> priorityColors = [
    Colours.priorityBlue,
    Colours.priorityOrange,
    Colours.priorityRed,
  ];
  final Map<String, Object?> _addingHandler = {
    'id': UniqueKey().toString(),
    'name': '',
    'description': '',
    'createdAt': '',
    'updatedAt': '',
    'location': '',
    'colorValue': 0,
    'eventDate': '',
  };
  void _submit() {
    _formKey.currentState!.save();
    DBHelper.insert('events', _addingHandler);
    if (kDebugMode) {
      print(DBHelper.getData('events'));
    }
  }

  @override
  void initState() {
    super.initState();
    _addingHandler['colorValue'] = dropDownValue!.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(13, 16, 19, 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Event name",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colours.textFieldColor),
                    ),
                    filled: true,
                    fillColor: Colours.textFieldColor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colours.textFieldColor)),
                  ),
                  cursorColor: Colors.black,
                  validator: (val) {
                    if (val == null) {
                      return 'It should not be empty';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _addingHandler['name'] = value;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 4),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Event description",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colours.textFieldColor),
                    ),
                    filled: true,
                    fillColor: Colours.textFieldColor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colours.textFieldColor)),
                  ),
                  cursorColor: Colors.black,
                  validator: (val) {
                    if (val == null) {
                      return 'It should not be empty';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _addingHandler['description'] = value;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 4),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Event location",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.location_on,
                      color: Colors.blue,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colours.textFieldColor),
                    ),
                    filled: true,
                    fillColor: Colours.textFieldColor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colours.textFieldColor)),
                  ),
                  cursorColor: Colors.black,
                  validator: (val) {
                    if (val == null) {
                      return 'It should not be empty';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _addingHandler['location'] = value;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 6),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Priority color",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    width: 75,
                    decoration: BoxDecoration(color: Colours.lightGrey),
                    child: DropdownButton(
                        value: dropDownValue,
                        icon: const Icon(Icons.expand_more),
                        items: priorityColors
                            .map<DropdownMenuItem<Color>>(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  color: value,
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            dropDownValue = val;
                          });
                        }),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 4),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Event time",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colours.textFieldColor),
                    ),
                    filled: true,
                    fillColor: Colours.textFieldColor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colours.textFieldColor)),
                  ),
                  cursorColor: Colors.black,
                  validator: (val) {
                    if (val == null) {
                      return 'It should not be empty';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _addingHandler['eventDate'] = value;
                  },
                ),
                Container(
                  height: 46,
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colours.priorityBlue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      _submit();
                      Navigator.of(context).pop();
                    },
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Add",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
