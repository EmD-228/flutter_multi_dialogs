# multiple_dialog

This is a magazine with multiple material designs。
including loadingDialog, alertDialog, bottomDialog, listDialog and continuous addition。。。。。


## Getting Started

    multiple_dialog: ^0.1.5
    
    import 'package:multiple_dialog/multiple_dialog.dart';

## 1. showLoadingDialog

    ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                ),
                child: const Text(
                  "showLoadingDialog",
                ),
                onPressed: () {
                  showLoadingDialog(
                    context: context,
                    backgroundColor: Colors.white,
                    direction: Direction(
                      orientations: Orientations.Vertical,
                    ),
                  );
                },
              ),
## 2. showAlertDialog

         ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                ),
                child: const Text("showAlertDialog"),
                onPressed: () {
                  showAlertDialog(
                      context: context,
                      title: const Text("Title"),
                      content: const Text("This is the content"),
                      semanticLabel: "AlertDialog Extension",
                      actions: <Widget>[
                        TextButton(
                          child: const Text("Confirm"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text("Cancel"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ]);
                },
              ),
  
## 3. showBottomDialog
       
      ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                  ),
                  child: Text(
                    "showBottomDialog",
                    style: _style(),
                  ),
                  onPressed: () {
                    showBottomDialog(
                      context: context,
                      title: const Text("Title"),
                      content: Container(child: const Text("This is the content")),
                      isScrollControlled: true,
                      actions: <Widget>[
                        TextButton(
                          child: const Text("Confirm"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: const Text("Cancel"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  }),

## 4. showCustomAlertDialog
     ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                ),
                child: const Text("showCustomAlertDialog"),
                onPressed: () {
                  showCustomAlertDialog(
                      context: context,
                      dialogBuilder: DialogBuilder(
                        simpleBuilder: SimpleBuilder(
                          title: const Text("Title"),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                for (var i in list)
                                  InkWell(
                                    child: Text(i),
                                    onTap: () {
                                      debugPrint('Tapped item: $i');
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      confirmWidget: const Text("Confirm"),
                      cancelWidget: const Text("Cancel"),
                      onConfirmCallBack: () {
                        Navigator.pop(context);
                      },
                      onCancelCallBack: () {
                        Navigator.pop(context);
                      });
                },
              ),

## 5. showCustomDialog
     ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                ),
                child: const Text(
                  "showCustomDialog",
                ),
                onPressed: () {
                  showCustomDialog(
                    context: context,
                    simpleBuilder: SimpleBuilder(),
                    children: <Widget>[const Text("Custom Dialog")],
                  );
                },
              ),

## 6. SimpleListDialog
     ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                ),
                child: const Text("showSimpleListDialog"),
                onPressed: () {
                  showSimpleListDialog(
                      context: context,
                      simpleBuilder: SimpleBuilder(),
                      children: <Widget>[
                        for (var i in list) Text(i),
                      ],
                      onItemCallBack: (index) {
                        debugPrint('Selected item: ${list[index]}');
                      });
                },
              ),
              
#### If you want to customize the Dialog, you can override showCustomDialog or showCustomAlertDialog

  A few resources to get you started if this is your first Flutter project:

  - [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
  - [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

  For help getting started with Flutter, view our
  [online documentation](https://flutter.dev/docs), which offers tutorials,
  samples, guidance on mobile development, and a full API reference.

### LICENSE

    Copyright 2025 EmD-228
    
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    
       http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.


