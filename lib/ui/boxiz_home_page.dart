import 'package:boxiz_app/model/boxiz_model.dart';
import 'package:boxiz_app/model/boxiz_theme.dart';
import 'package:boxiz_app/ui/boxiz_detail_page.dart';
import 'package:flutter/material.dart';

class BoxizHomePage extends StatefulWidget {
  const BoxizHomePage({Key? key}) : super(key: key);

  @override
  _BoxizHomePageState createState() => _BoxizHomePageState();
}

class _BoxizHomePageState extends State<BoxizHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 16,
                    ),
                    Icon(
                      Icons.comment_bank_outlined,
                      color: Colors.orange,
                    ),
                    Text(
                      "128",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.vpn_key,
                      color: Colors.grey,
                    ),
                    Text("0", style: TextStyle(color: Colors.white)),
                    Icon(
                      Icons.shield,
                      color: BoxizTheme.accentColor,
                    ),
                    Text("3", style: TextStyle(color: Colors.white)),
                    // Badge(
                    //   child: Icon(
                    //     Icons.notifications,
                    //     color: Colors.white,
                    //   ),
                    // )
                  ],
                ),
              ),
              flex: 2,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: boxizItems.length,
                itemBuilder: (context, index) {
                  Boxiz _boxiz = boxizItems[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                            BoxizDetailPage(boxiz: _boxiz,)));
                      },
                      child: Container(
                        decoration: BoxDecoration(   color: BoxizTheme.cardColor,
                            borderRadius: BorderRadius.circular(16)
                        ),
                        height: 380,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
                                      color: Colors.blue,
                                      image: DecorationImage(image: NetworkImage(_boxiz.img ?? ""), fit: BoxFit.cover)),
                                )),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${_boxiz.prize}",
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(0.6),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                          decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.4),
                                              borderRadius: BorderRadius.circular(4)),
                                          child: Text(
                                            "${_boxiz.type}",
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      _boxiz.title ?? "unknown",
                                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      _boxiz.datetime ?? "unknown",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.emoji_events,
                                          color: Colors.tealAccent,
                                        ),
                                        Text(
                                          _boxiz.coin ?? "unknown",
                                          style: TextStyle(
                                              color: Colors.tealAccent, fontSize: 14, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: _boxiz.items
                                              ?.map((e) => Container(
                                            margin: EdgeInsets.only(right: 4),
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.white.withOpacity(0.3)),
                                                borderRadius: BorderRadius.circular(4)),
                                            child: Text(
                                              "$e",
                                              style: TextStyle(color: Colors.orange),
                                            ),
                                          ))
                                              .toList() ??
                                              [],
                                        ),
                                        Spacer(),
                                        Text(
                                          "Live in",
                                          style: TextStyle(
                                              color: Colors.white.withOpacity(0.4),
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(width: 8,),
                                        Text(
                                          "${_boxiz.liveIn?.inMinutes ?? 0}m ${_boxiz.liveIn?.inSeconds ?? 0}s",
                                          style: TextStyle(color: BoxizTheme.accentColor),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              flex: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.home),
                      iconSize: 28,
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.radio_button_checked),
                      iconSize: 28,
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shield),
                      iconSize: 28,
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.waterfall_chart),
                      iconSize: 28,
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.confirmation_num_outlined),
                      iconSize: 28,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}