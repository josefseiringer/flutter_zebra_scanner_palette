import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../pages/scann/scann_controller.dart';

class ScannPage extends StatelessWidget {
  static const namedRoute = '/';
  const ScannPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter DataWedge Example'),
      ),
      body: GetBuilder<ScannController>(
        builder: (sCtrl) => Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text('Last codes:',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView.separated(
                    reverse: true,
                    itemCount: sCtrl.scanResults.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text('$index: ${sCtrl.scanResults[index].data}'),
                    ),
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                Wrap(
                  children: [
                    const Expanded(
                      child: Text('Last status:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    Expanded(
                      child: Text(sCtrl.lastStatus.value,
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
