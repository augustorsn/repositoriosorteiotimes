import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sorteiotimes/models/players.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.player, required this.onDelete});

  final Players player;
  final Function(Players) onDelete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        actionPane: const SlidableDrawerActionPane(),
        secondaryActions:  [
          IconSlideAction(
            color: Colors.red,
            icon: Icons.delete,
            caption: 'Deletar',
            onTap: () {
              onDelete(player);
            },
          ),

        ],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey,
          ),

          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Row(
                  children: <Widget>[

                    Icon(
                      Icons.person_3_rounded,
                      color: player.mensalist ? Colors.green : Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      player.nome,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
