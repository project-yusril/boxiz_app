import 'package:flutter/material.dart';
import 'package:boxiz_app/model/boxiz_theme.dart';
import 'package:boxiz_app/model/boxiz_model.dart';

class BoxizDetailPage extends StatefulWidget {
final Boxiz? boxiz;

BoxizDetailPage({Key? key, this.boxiz}) : super(key: key);

@override
_BoxizDetailPageState createState() => _BoxizDetailPageState();
}

class _BoxizDetailPageState extends State<BoxizDetailPage> {
  final List<BoxizSelect> _selectItem = [
    BoxizSelect(isOpen: false),
    BoxizSelect(isOpen: false),
    BoxizSelect(isOpen: false),
    BoxizSelect(isOpen: false),
    BoxizSelect(isOpen: false),
  ];

  final List<BoxizGrid> _boxizGridItems = List.generate(100, (index) {
    return BoxizGrid(
      (index + 1),
      false,
      isAvailable: index % 3 == 0 ? true : false,
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: MediaQuery.of(context).size.height / 1.5,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.boxiz?.img ?? "",
                      ),
                      fit: BoxFit.cover),
                ),
              )),
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: MediaQuery.of(context).size.height / 1.5,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    BoxizTheme.backgroundColor,
                    BoxizTheme.backgroundColor.withOpacity(0.5),
                    BoxizTheme.backgroundColor.withOpacity(0.25),
                    Colors.transparent
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                ),
              )),
          Positioned(
            left: 0,
            right: 0,
            top: 64,
            bottom: 16,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.white,
                        icon: Icon(Icons.arrow_back_ios)),
                    Text(
                      widget.boxiz?.title ?? "",
                      style: TextStyle(color: Colors.white),
                    ),
                    IconButton(onPressed: () {}, color: Colors.white, icon: Icon(Icons.info_outline)),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "${widget.boxiz?.liveIn?.inHours ?? "0h"}h "
                          "${widget.boxiz?.liveIn?.inMinutes ?? "0m"}m "
                          "${widget.boxiz?.liveIn?.inSeconds ?? "0s"}s",
                      style: TextStyle(
                        color: BoxizTheme.accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Starts at ${widget.boxiz?.datetime}",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 42,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _selectItem.length,
                          itemBuilder: (context, index) {
                            var item = _selectItem[index];
                            if (item.isOpen) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.deepOrangeAccent,
                                ),
                                child: Center(
                                  child: Text(item.number.toString()),
                                ),
                              );
                            }
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: BoxizTheme.backgroundColor,
                                    borderRadius: BorderRadius.circular(3),
                                    border: Border.all(color: BoxizTheme.accentColor)),
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Center(
                                    child: Icon(
                                      Icons.lock,
                                      color: BoxizTheme.accentColor,
                                    )),
                              ),
                            );
                          })),
                ),
                Text(
                  "Grid 1",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                      Text(
                        "TAKEN",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: BoxizTheme.accentColor)),
                      ),
                      Text(
                        "AVAILABLE",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Container(
                        height: 16,
                        width: 16,
                        decoration:
                        BoxDecoration(color: Colors.deepOrangeAccent, borderRadius: BorderRadius.circular(4)),
                      ),
                      Text(
                        "SELECTED",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.count(
                        padding: EdgeInsets.zero,
                        crossAxisCount: 10,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6,
                        children: _boxizGridItems.map((e) {
                          return GestureDetector(
                            onTap: () {
                              if (!e.isAvailable) {
                                return;
                              }
                              if (e.isAvailable && (e.isSelect ?? true)) {
                                setState(() {
                                  e.isSelect = false;
                                });
                                return;
                              }
                              setState(() {
                                e.isSelect = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: e.isSelect!
                                    ? Colors.orange
                                    : e.isAvailable
                                    ? Colors.white.withOpacity(0.2)
                                    : Colors.white.withOpacity(0.1),
                                border: Border.all(
                                    color: e.isSelect ?? false
                                        ? Colors.orange
                                        : (e.isAvailable)
                                        ? BoxizTheme.accentColor
                                        : Colors.transparent),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: e.isSelect!
                                    ? Icon(Icons.check)
                                    : Text(
                                  e.isAvailable ? "${e.number}" : "",
                                  style: TextStyle(color: BoxizTheme.accentColor, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: BoxizTheme.accentColor, borderRadius: BorderRadius.circular(32)),
                    padding: EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    child: Center(
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
