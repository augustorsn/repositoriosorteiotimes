import 'dart:math';

import 'package:flutter/material.dart';


import '../models/players.dart';
import '../widgets/todo_list_item.dart';


class TodoListPage extends StatefulWidget {
  TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController playerName = TextEditingController();

  List<Players> playersSaved = [];
  List<Players> raffle = [];
  List<Players> raffleMensalist = [];
  List<Players> raffleGuest = [];
  List<Players> playersTeamOne = [];
  List<Players> playersTeamTwo = [];
  List<Players> playersTeamThree = [];
  List<Players> playersTeamFour = [];


  Players? deletedPlayer;
  int? positionDeletedPlayer;
  bool sorteado = false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/fundo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(

            padding: const EdgeInsets.symmetric(horizontal: 20, vertical:30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              verticalDirection: VerticalDirection.down,

              children: [
                Row(
                  children: [
                    Title(
                      color: Colors.white,
                      child: Text(
                        'Sorteio de Times',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Title(
                      color: Colors.white,
                      child: Text(
                        'Adicionar Jogador',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: playerName,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Arial',
                        ),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: 'Pedrinha Beba...',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Arial',
                          ),
                          errorText: null,
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.text,
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 2),
                    ElevatedButton(
                      onPressed: () {
                        addPlayer(true);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.green)),
                      child: Text(
                        'M',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 2),
                    ElevatedButton(
                      onPressed: () {
                        addPlayer(false);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.blueAccent)),
                      child: Text(
                        'C',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 2),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          createRaffle();
                          sorteado = true;
                        });

                      },
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.orange)),
                      child: Text(
                        'S',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 2),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          raffle = [];
                          raffleMensalist = [];
                          raffleGuest = [];
                          playersSaved = [];
                        });

                      },
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.red)),
                      child: Text(
                        'X',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 2),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          raffle = [];
                          raffleMensalist = [];
                          raffleGuest = [];
                          sorteado = false;
                        });

                      },
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.deepOrangeAccent)),
                      child: Text(
                        'X',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 2),
                  ],
                ),

                Row(
                  children: [
                    if(sorteado && playersTeamOne.length >=1)
                    Title(
                      color: Colors.white,
                      child: Text(
                        'Time 1 ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    if(sorteado && playersTeamOne.length >=1)
                      Title(
                        color: Colors.white,
                        child: Text(
                          playersTeamOne.toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                  ],
                ),

                Row(
                  children: [
                    if(sorteado && playersTeamTwo.length >=1)
                    Title(
                      color: Colors.white,
                      child: Text(
                        'Time 2 ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    if(sorteado && playersTeamTwo.length >=1)
                      Title(
                        color: Colors.white,
                        child: Text(
                          playersTeamTwo.toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                  ],
                ),


                Row(
                  children: [
                    if(sorteado && playersTeamThree.length >=1)
                      Title(
                        color: Colors.white,
                        child: Text(
                          'Time 3 ',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                  ],
                ),

                Row(
                  children: [
                    if(sorteado && playersTeamThree.length >=1)
                      Title(
                        color: Colors.white,
                        child: Text(
                          playersTeamThree.toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                  ],
                ),

                Row(
                  children: [
                    if(sorteado && playersTeamFour.length >=1)
                      Title(
                        color: Colors.white,
                        child: Text(
                          'Time 4 ',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                  ],
                ),

                Row(
                  children: [
                    if(sorteado && playersTeamFour.length >=1)
                      Title(
                        color: Colors.white,
                        child: Text(
                          playersTeamFour.toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                  ],
                ),





                SizedBox(height: 20),
                Row(
               children: [
                 Title(
                   color: Colors.white,
                   child: Text(
                     'Jogadores Confirmados ${playersSaved.length}',
                     textAlign: TextAlign.start,
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 24,
                     ),
                   ),
                 ),
               ],
             ),
                Flexible(
                  flex: 10,
               child: ListView(
                 shrinkWrap: true,

                 children: [
                   for (Players player in playersSaved)
                     TodoListItem(
                       player: player,
                       onDelete: onDelete,
                     ),
                 ],
               ),
             ),



              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDelete(Players player) {
    deletedPlayer = player;
    positionDeletedPlayer = playersSaved.indexOf(player);
    setState(() {
      playersSaved.remove(player);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 5),
      content: Text('${player.nome} removido da lista de confirmados'),
      action: SnackBarAction(
        label: 'Desfazer',
        onPressed: () {
          setState(() {
            playersSaved.insert(positionDeletedPlayer!, deletedPlayer!);
          });
        },
      ),
    ));
  }

  void sendMessageToast(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 5),
      content: Text('${message}'),
    ));
  }

  addPlayer(bool mensalist){
    String name = playerName.text;
    if(name.isEmpty){
      sendMessageToast('Não pode nome vazio');
      return;
    }

    if(playersSaved.length >19){
      sendMessageToast('Não pode add mais jogadores');
      return;
    }
    setState(() {
      Players newPlayer =
      Players(nome: name, data: DateTime.now(),mensalist: mensalist);
      playersSaved.add(newPlayer);
    });
    playerName.clear();
  }

  createRaffle(){
    setState(() {
      if(playersSaved.length <10){
        sendMessageToast('Menos de 10 jogadores na lista');
        return;
      }
      raffle = [...playersSaved];
      addRafflePriority();
      int tempRaffleMensalist = raffleMensalist.length -1;
      int tempraffleGuest = raffleGuest.length-1;

      for(int i = 0; i <= tempRaffleMensalist; i++){
        int MAX = raffleMensalist.length - 1;
        int rafflePosition = MAX;
        if(!(MAX == 0)){
          rafflePosition = new Random().nextInt(MAX);
        }

        if(playersTeamOne.length < 5){
          playersTeamOne.add(raffleMensalist[rafflePosition]);
          raffleMensalist.removeAt(rafflePosition);
          continue;
        }
        if(playersTeamTwo.length < 5){
          playersTeamTwo.add(raffleMensalist[rafflePosition]);
          raffleMensalist.removeAt(rafflePosition);
          continue;
        }
        if(playersTeamThree.length < 5){
          playersTeamThree.add(raffleMensalist[rafflePosition]);
          raffleMensalist.removeAt(rafflePosition);
          continue;
        }
        if(playersTeamFour.length < 5){
          playersTeamFour.add(raffleMensalist[rafflePosition]);
          raffleMensalist.removeAt(rafflePosition);
          continue;
        }
      }

      for(int i = 0; i <= tempraffleGuest; i++){
        int MAX = raffleGuest.length - 1;
        int rafflePosition = MAX;
        if(!(MAX == 0)){
          rafflePosition = new Random().nextInt(MAX);
        }

        if(playersTeamOne.length < 5){
          playersTeamOne.add(raffleGuest[rafflePosition]);
          raffleGuest.removeAt(rafflePosition);
          continue;
        }
        if(playersTeamTwo.length < 5){
          playersTeamTwo.add(raffleGuest[rafflePosition]);
          raffleGuest.removeAt(rafflePosition);
          continue;
        }
        if(playersTeamThree.length < 5){
          playersTeamThree.add(raffleGuest[rafflePosition]);
          raffleGuest.removeAt(rafflePosition);
          continue;
        }
        if(playersTeamFour.length < 5){
          playersTeamFour.add(raffleGuest[rafflePosition]);
          raffleGuest.removeAt(rafflePosition);
          continue;
        }
      }
    });



  }

  addRafflePriority(){
    raffleGuest = [];
    raffleMensalist = [];
    playersTeamOne = [];
    playersTeamTwo = [];
    playersTeamThree = [];
    playersTeamFour = [];

    for(Players p in raffle){
      if(p.mensalist){
        raffleMensalist.add(p);
      }
      if(!p.mensalist){
        raffleGuest.add(p);
      }
    }
  }

}
