import 'package:flutter/material.dart';
import 'package:perdimeupet/theme/app_theme.dart';

class FindDetailsPage extends StatefulWidget {
  const FindDetailsPage({Key? key}) : super(key: key);

  @override
  _FindDetailsPageState createState() => _FindDetailsPageState();
}

class _FindDetailsPageState extends State<FindDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.defaultTheme.primaryColor,
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              label: const Text(
                "Contato",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
              icon: const Icon(Icons.phone, color: Colors.white),
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              label: const Text(
                "Mensagem",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
              icon: const Icon(Icons.chat, color: Colors.white),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/two.jpg'),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Gênero: Macho"),
                    const Text("Cor: Marron"),
                    const Text("Raça: Sem raça definida"),
                    const Text("Porte: Pequeno"),
                    const Text("Pelo: Curto"),
                    const Text("Espécie: Gato"),
                    const Text("Status: Perdido"),
                    const Text("Observação: Possui coleira rosa"),
                    const Text("Perdido em Palmas-TO na data de 10/11/2021"),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Buscar animais semelhantes",
                          style: TextStyle(color: Colors.white),
                        ))
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
