import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/controller/task_controller.dart';
import '../../../utils/constant_utils.dart';
import '../../shared/button_widget.dart';


class BodyOfBottomSheet extends StatefulWidget {
  const BodyOfBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyOfBottomSheet> createState() => _BodyOfBottomSheetState();
}

class _BodyOfBottomSheetState extends State<BodyOfBottomSheet> {
  late TextEditingController _titleController;

  @override
  void initState() {
    _titleController = TextEditingController(
        text: Provider.of<TaskController>(context, listen: false)
            .taskUpdate
            .title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    clear();
    return Consumer<TaskController>(
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Text(
              value.update ? 'update Note' : 'Add Note',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: AppColors.white,
                  ),
            ),
            addVerticalSpace(10),
            TextFormField(
              controller: _titleController,
              textInputAction: TextInputAction.next,
              maxLines: 6,
              minLines: 6,
              maxLength: 15,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: AppColors.white, fontSize: 25),
              decoration: InputDecoration(
                  counterStyle: Theme.of(context).textTheme.headline2,
                  hintText: 'Type something...',
                  filled: true,
                  fillColor: const Color.fromARGB(255, 40, 39, 39),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
            ),
            addVerticalSpace(15),
            ButtonWidget(
                text: 'Save',
                visible: !value.loading,
                onPressed: () {
                  if (value.update) {
                    value.upadteTask(
                        title: _titleController.text,
                        id: value.taskUpdate.id ?? 0);
                  } else {
                    value.createTask(title: _titleController.text);
                    _titleController.clear();
                  }

                  Navigator.pop(context);
                }),
            addVerticalSpace(10)
          ],
        ),
      ),
    );
  }

  clear() {
    if (!Provider.of<TaskController>(context, listen: false).update) {
      _titleController.clear();
    }
  }
}
