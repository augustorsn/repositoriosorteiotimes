class Players {

  Players({required this.nome, required this.data,required this.mensalist});

  String nome;

  DateTime data;

  bool mensalist ;

  String returnTeam(List<Players> players) {
    String valores ='';

    for(Players val in players){
      valores += "${val.nome} ";
    }
    return valores;
  }

  @override
  String toString() {
    String valores ='';
    valores = " ${nome} ";
    return valores;
  }


}