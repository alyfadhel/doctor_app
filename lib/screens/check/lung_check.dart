import 'package:doctor_master/models/confirmation_model.dart';
import 'package:doctor_master/screens/check/confirmation_popup.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

final TextEditingController _controller = TextEditingController();

class checklung extends StatelessWidget {
  checklung({super.key});

  //static const screenRoute = '/category-pages';
  TextEditingController names = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phonenum = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController description = TextEditingController();
  // get names => null;

  // get username => null;

  // get email => null;

  // get password => null;

  // get phonenum => null;

  // get age => null;

  // get description => null;

  String? filePath;

//final String categoryid;
//final String categorytitle;
//categorysecondscreen(this.categoryid, this.categorytitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lung'),
        backgroundColor: Colors.red[200],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 0.0),
          child: Stack(children: <Widget>[
            Container(
                margin: const EdgeInsets.only(top: 0.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                child: Column(
                  children: const <Widget>[],
                )),
            Container(
              padding:
                  const EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 0.0,
                  ),
                  TextField(
                    controller: names,
                    decoration: InputDecoration(
                      labelText: ' patient name',
                      prefixIcon: const Icon(Icons.people),
                      border: myfocusborder(),
                      enabledBorder: myfocusborder(),
                      focusedBorder: myfocusborder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: phonenum,
                    decoration: InputDecoration(
                      labelText: 'phone',
                      prefixIcon: const Icon(Icons.phone),
                      border: myfocusborder(),
                      enabledBorder: myfocusborder(),
                      focusedBorder: myfocusborder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: age,
                    decoration: InputDecoration(
                      labelText: 'age',
                      prefixIcon: const Icon(Icons.person_2_rounded),
                      border: myfocusborder(),
                      enabledBorder: myfocusborder(),
                      focusedBorder: myfocusborder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: description,
                    minLines: 1,
                    maxLines: 20,
                    decoration: InputDecoration(
                      label: const Text('Description'),
                      prefixIcon: const Icon(Icons.description),
                      border: myfocusborder(),
                      enabledBorder: myfocusborder(),
                      focusedBorder: myfocusborder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          // if (result != null) {
                          // setState(() {
                          // _filePath = result.files.first.path;
                          //});
                          //}
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.file_upload_outlined,
                              size: 40.0,
                              color: Colors.red[200],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Upload Lungs Record',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.red[200],
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        if (names.text.isEmpty ||
                            phonenum.text.isEmpty ||
                            age.text.isEmpty ||
                            description.text.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Fill all form inputs'),
                          ));
                        } else {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    content: ConfirmationPopup(
                                        confirmationModel: ConfirmationModel(
                                      name: names.text,
                                      phone: phonenum.text,
                                      age: age.text,
                                      description: description.text,
                                    )),
                                  ));
                        }
                      },
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
  //
  // OutlineInputBorder myinputborder() {
  //   return const OutlineInputBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(20)),
  //       borderSide: BorderSide(
  //         color: Color(0xFFF2BEA1),
  //         width: 3,
  //       ));
  //}

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.red[200]!,
          width: 3,
        ));
  }
}
