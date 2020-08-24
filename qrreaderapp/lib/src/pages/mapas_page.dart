import 'package:flutter/material.dart';

import 'package:qrreaderapp/src/providers/db_provider.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ScanModel>>(
        future: DBProvider.db.getTodosScans(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final scans = snapshot.data;

          if (scans.length == 0) {
            return Center(child: Text('No hay información'));
          }

          return ListView.builder(
              itemCount: scans.length,
              itemBuilder: (context, index) => Dismissible(
                    key: UniqueKey(),
                    background: Container(color: Colors.red),
                    onDismissed: (direction) =>
                        DBProvider.db.deleteScan(scans[index].id),
                    child: ListTile(
                        leading: Icon(Icons.cloud_queue,
                            color: Theme.of(context).primaryColor),
                        title: Text(scans[index].valor),
                        subtitle: Text('ID: ${scans[index].id}'),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.grey)),
                  ));
        });
  }
}
