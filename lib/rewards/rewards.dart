import 'package:findrecycler/rewards/widgets/rotator.dart';
import 'package:flutter/material.dart';

class Rewards extends StatelessWidget {
  const Rewards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(title: Text('Rewards')),
      backgroundColor: Colors.greenAccent,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 40, top: 10),
              itemCount: 1,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => _buildListItem(index),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(int index) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 18.0,
      ),
      child: Card(
        child: ListTile(
          leading: FlutterLogo(),
          title: Text('One-line with both widgets'),
          trailing: Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
