import 'package:flutter/material.dart';
import 'package:notey_app/data/controller/auth_controller.dart';
import 'package:notey_app/data/controller/task_controller.dart';
import 'package:notey_app/data/local_storage/shared_perferance.dart';
import 'package:notey_app/ui/shared/button_widget.dart';
import 'package:notey_app/utils/constant_utils.dart';
import 'package:notey_app/utils/helper.dart';
import 'package:provider/provider.dart';

import 'body_of_bottom_sheet.dart';
import 'empty_note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TaskController>(context, listen: false).featchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Container(
        color: AppColors.graydark,
        width: 200,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.black26),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage(ImagePath.userImage),
              ),
              accountName: Text(SharedPref().getName),
              accountEmail: Text(SharedPref().getEmail),
            ),
            GestureDetector(
              onTap: () => context.read<AuthController>().logOut(),
              child: ListTile(
                title: Text('Logout',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: AppColors.white)),
                trailing: const Icon(Icons.exit_to_app),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 30,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ],
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Notes',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Consumer<TaskController>(
        builder: (context, value, child) => value.loading
            ? const Center(child: CircularProgressIndicator())
            : value.tasks.isNotEmpty
                ? ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          value.update = true;
                          value.taskUpdate = value.tasks[index];
                          // value.id = value.tasks[index].id;
                          showBottomSheet(context);
                        },
                        child: Dismissible(
                          background: Container(
                            color: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: const [
                                  Icon(Icons.favorite, color: Colors.white),
                                  Text('Move to favorites',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                          secondaryBackground: Container(
                            color: Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Icon(Icons.delete, color: Colors.white),
                                  Text('Move to trash',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                          key: UniqueKey(),
                          confirmDismiss: (DismissDirection direction) async {
                            if (direction == DismissDirection.startToEnd) {
                              return MessageHelper.showSnackBarMessage(
                                  message: "add to faviarte", status: true);
                            }
                            return await MessageHelper.showAlertDialog();
                          },
                          onDismissed: (DismissDirection direction) {
                            if (direction == DismissDirection.startToEnd) {
                              print("Add to favorite");
                            } else {
                              value.deleteTask(id: value.tasks[index].id ?? 0);
                              print('Remove item');
                            }
                            
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 20),
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: const LinearGradient(colors: [
                                  AppColors.blue,
                                  AppColors.green,
                                ])),
                            child: Text(
                              value.tasks[index].title ?? 'default',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => addVerticalSpace(15),
                    itemCount: value.tasks.length)
                : const EmptyNoteScreen(),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 10,
          onPressed: () {
            Provider.of<TaskController>(context, listen: false).update = false;
            showBottomSheet(context);
          },
          backgroundColor: AppColors.graydark,
          child: const Icon(
            Icons.add,
            color: AppColors.white,
          )),
    );
  }

  Future<dynamic> showBottomSheet(
    BuildContext context,
  ) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        backgroundColor: AppColors.graydark,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return const BodyOfBottomSheet();
        });
  }
}



