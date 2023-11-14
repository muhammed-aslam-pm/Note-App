import 'package:flutter/material.dart';
import 'package:flutter_application_8/model/notes_model.dart';
import 'package:flutter_application_8/utils/color_Const/color_constant.dart';
import 'package:flutter_application_8/view/home_screen/widgets/list_sceen_widget.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final _toDoFormKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  List<NotesModel> noteList = [
    NotesModel(title: "T1", description: "D1", color: 0),
    NotesModel(title: "T2", description: "D2", color: 0),
  ];
  int selectedIndex = 0;

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListScreenWidget(
          title: noteList[index].title!,
          description: noteList[index].description!,
          color: noteList[index].color!,
          deleteOnTap: () {
            noteList.removeAt(index);
            setState(() {});
          },
        ),
        itemCount: noteList.length,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => StatefulBuilder(
                builder: (context, inState) {
                  return SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsetsDirectional.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Form(
                        key: _toDoFormKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: titleController,
                              decoration: InputDecoration(
                                  fillColor: Colors.green[200],
                                  filled: true,
                                  hintText: "Title",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: descriptionController,
                              decoration: InputDecoration(
                                fillColor: Colors.green[200],
                                filled: true,
                                hintText: "Description",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: dateController,
                              decoration: InputDecoration(
                                fillColor: Colors.green[200],
                                filled: true,
                                hintText: "Date",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: Icon(Icons.calendar_month_outlined),
                              ),
                              keyboardType: TextInputType.datetime,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                MyColors.MyColorList.length,
                                (index) => InkWell(
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: MyColors.MyColorList[index],
                                        border: Border.all(
                                            width: 5,
                                            color: selectedIndex == index
                                                ? MyColors.MyColorBorder[index]
                                                : Colors.transparent)),
                                  ),
                                  onTap: () {
                                    selectedIndex = index;
                                    inState(
                                      () {},
                                    );
                                  },
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                noteList.add(NotesModel(
                                    title: titleController.text,
                                    description: descriptionController.text,
                                    color: selectedIndex));

                                Navigator.pop(context);
                                titleController.clear();
                                descriptionController.clear();
                                dateController.clear();
                                setState(() {});
                              },
                              child: Text("Add"),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.green[900]),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green[900]),
    );
  }
}
