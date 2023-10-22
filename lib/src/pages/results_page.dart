import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/imc.dart';
import '../shared/constants.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({
    super.key,
  });

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  late final Future<Box<Imc>> storage;
  @override
  void initState() {
    super.initState();
    storage = Hive.openBox<Imc>('IndicesMassa');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kApplicationTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              height: 50.0,
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.topLeft,
              child: const Text(
                'Seus Resultados',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: FutureBuilder(
              future: storage,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Box<Imc> indices = snapshot.data!;
                  return ListView.builder(
                    itemCount: indices.length,
                    itemBuilder: (context, index) {
                      var imc = indices.getAt(index);
                      return ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        leading: Text(
                          imc!.calcular(),
                          style: kBMITextStyle,
                        ),
                        title: Text(
                          imc.classificar().toUpperCase(),
                          style: kResultTextStyle,
                        ),
                        subtitle:
                            Text('Peso: ${imc.peso} - Alutra: ${imc.altura}'),
                      );
                    },
                  );
                }
                return const Center(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
          BottomButton(
            buttonTitle: 'RECALCULAR',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
