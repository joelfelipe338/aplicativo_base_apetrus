import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
//Adiciona o arquivo que trabalha com as solicitações do bot
import 'ia_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _homePage = 2;


  @override
  Widget build(BuildContext context) {

    List<Widget> _widgetOptions = <Widget>[
      Container(color: Colors.blue,),
      Container(color: Colors.green,),
      _telaInicial(),
      Container(color: Colors.yellowAccent,),
      Container(color: Colors.pink,),
      Container(color: Colors.red,),
      TelaIA(),
    ];

    return Scaffold(
      body: _widgetOptions.elementAt(
        _homePage,
      ),
      bottomNavigationBar: _navHome(),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _floatingActionButtonWidget()
    );
  }

  _floatingActionButtonWidget(){
    // Esconde o FloatingActionButton na tela de chat AI
    if (_homePage == 6) {
      return null;
    }
    return FloatingActionButton(
      onPressed: () {

      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Mdi.wallet,
            color: Colors.white,
            size: 30,
          ),
          Text("Crédito", style: TextStyle(color: Colors.white, fontSize: 7, fontWeight: FontWeight.bold),)
        ],
      ),
      elevation: 2.0,
      backgroundColor: Colors.orange,
    );
  }

  Widget _telaInicial(){
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Align(alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: (){

              },
              child: Container(
                margin: EdgeInsets.all(20),
                width: 80,
                height: 80,
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.yellow),),
            ),),
          Center(child: Text("Mapa da apetrus", style: TextStyle(fontSize: 23),),)
        ],
      )
    );
  }

  _navHome(){
    return BottomAppBar(
      color: Color(0xff040b28),
      shape: CircularNotchedRectangle(),
      notchMargin: 2.0,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _navLoggedInOptions(context),
      ),
    );
  }

  List<Widget> _navLoggedInOptions(BuildContext context) {
    return <Widget>[
      Expanded(child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                setState((){
                  _homePage = 0;
                });
              },
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.local_offer,
                      color: _homePage == 0
                          ? Colors.orange
                          : Colors.white,
                    ),
                    Text(
                      'Ofertas',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 10.0,
                          color: _homePage == 0
                              ? Colors.orange
                              : Colors.white),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState((){
                  _homePage = 1;
                });
              },
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Mdi.qrcode,
                      color: _homePage == 1
                          ? Colors.orange
                          : Colors.white,
                    ),
                    Text(
                      "Saldos",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 10.0,
                        color: _homePage == 1
                            ? Colors.orange
                            : Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState((){
                  _homePage = 2;
                });
              },
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Mdi.map,
                      color: _homePage == 2
                          ? Colors.orange
                          : Colors.white,
                    ),
                    Text(
                      "Mapa",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 10.0,
                        color: _homePage == 2
                            ? Colors.orange
                            : Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
      SizedBox(width: MediaQuery.of(context).size.width * .14),
      Expanded(child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                setState((){
                  _homePage = 3;
                });
              },
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Mdi.magnify,
                      color: _homePage == 3
                          ? Colors.orange
                          : Colors.white,
                    ),
                    Text(
                      "Explorar",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 10.0,
                        color: _homePage == 3
                            ? Colors.orange
                            : Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                setState((){
                  _homePage = 4;
                });
              },
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Mdi.car,
                      color: _homePage == 4
                          ? Colors.orange
                          : Colors.white,
                    ),
                    Text(
                      "Veículos",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 10.0,
                        color: _homePage == 4
                            ? Colors.orange
                            : Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState((){
                  _homePage = 5;
                });
              },
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.person_outline,
                      color: _homePage == 5
                          ? Colors.orange
                          : Colors.white,
                    ),
                    Text(
                      "Perfil",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 10.0,
                        color: _homePage == 5
                            ? Colors.orange
                            : Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _homePage = 6;
                });
              },
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.smart_toy,
                      color: _homePage == 6 ? Colors.orange : Colors.white,
                    ),
                    Text(
                      "IA",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 10.0,
                        color: _homePage == 6 ? Colors.orange : Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),

    ];
  }

}

//classe para a tela de chat de IA
class TelaIA extends StatefulWidget {
  @override
  _TelaIAState createState() => _TelaIAState();
}

class _TelaIAState extends State<TelaIA> {
  List<ChatMessage> messages = [];
  TextEditingController messageController = TextEditingController();

  void sendMessage(String text) async {

    // Primeiro, adiciona a mensagem do usuário ao chat
    setState(() {
      messages.add(ChatMessage(message: text, isUser: true));
    });

    String mensagem = "Usuário: $text\nIA:";

    // Chama a API com a mensagem
    var response = await OpenAIService.chamarAPIOpenAI(mensagem);

    // Adiciona a resposta da IA ao chat
    setState(() {
      messages.add(ChatMessage(message: response, isUser: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chatbot Apetrus IA')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var message = messages[index];
                return Align(
                  alignment: message.isUser ? Alignment.topRight : Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: message.isUser ? Colors.blue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(message.message),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    sendMessage(messageController.text);
                    messageController.clear();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  String message;
  bool isUser;

  ChatMessage({required this.message, required this.isUser});
}
