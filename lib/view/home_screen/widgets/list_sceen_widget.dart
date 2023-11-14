import 'package:flutter/material.dart';
import 'package:flutter_application_8/utils/color_Const/color_constant.dart';

class ListScreenWidget extends StatefulWidget {
  const ListScreenWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.deleteOnTap,
      required this.color});
  final String title;
  final String description;
  final void Function()? deleteOnTap;
  final int color;

  @override
  State<ListScreenWidget> createState() => _ListScreenWidgetState();
}

class _ListScreenWidgetState extends State<ListScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: MyColors.MyColorList[widget.color],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                    Text(
                      widget.description,
                      style: TextStyle(color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                IconButton(
                  onPressed: widget.deleteOnTap,
                  icon: Icon(Icons.delete),
                )
              ],
            ),
            Text(
              "Date",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
