import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 177, 59, 38)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora de IMC'), 
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAlturar = TextEditingController();
  String resultado = '';

  // ignore: non_constant_identifier_names
  void _ClearResultado() {
    setState(() {

      resultado = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(

        child: Padding(

          padding: const EdgeInsets.all(16.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Calculadora de IMC ',
              ),

              const SizedBox(
                height: 16,
              ),

              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(),
                controller: controllerPeso,
                decoration: const InputDecoration(
                  labelText: 'Peso',
                  hintText: 'Digite seu peso',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0),
                    )
                  )
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(),
                controller: controllerAlturar,
                decoration: const InputDecoration(
                  labelText: 'Altura',
                  hintText: 'Digite sua altura',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0),
                    )
                  )
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Text(resultado, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),

              const SizedBox(
                height: 16,
              ),

              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      num numAux = (num.parse(controllerPeso.text) / (num.parse(controllerAlturar.text) * num.parse(controllerAlturar.text)));
  
                      resultado = numAux.toStringAsFixed(2);
                    });
                  }, child: const Text('Calcular IMC')
                ),
              )
            ],
          ), 
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed:_ClearResultado,
        child: const Text('Lista Resultado'),
      ),
    );
  }
}
