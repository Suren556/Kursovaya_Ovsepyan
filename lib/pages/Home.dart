import 'package:flutter/material.dart';
import'dart:math';
import 'package:my_mortgage/pages/Result.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int userStoimostNedv=0, userPervVznos=0, userSummaCredita=0;
  double obshStavka=0, egemesPlata=0, procentu=0, summaIpoteki=0, egemesStavka=0, userProcentStavka=0, userSrokCredita=0;

  final TextEditingController t1= TextEditingController();
  final TextEditingController t2= TextEditingController();
  final TextEditingController t3= TextEditingController();
  final TextEditingController t4= TextEditingController();
  final TextEditingController t5= TextEditingController();

  void doAddition(){
    setState(() {
      userStoimostNedv=int.parse(t1.text);
      userPervVznos=int.parse(t2.text);
      userSummaCredita=int.parse(t3.text);
      userProcentStavka=double.parse(t5.text);
      userSrokCredita=double.parse(t4.text);
      egemesStavka= userProcentStavka /12 /100;
      obshStavka=(1+egemesStavka);
      for (int i=1; i<12*userSrokCredita; i=i+1){
        obshStavka=obshStavka*(1+egemesStavka);
      }
      egemesPlata=userSummaCredita*egemesStavka*obshStavka/(obshStavka-1);
      procentu=egemesPlata*userSrokCredita*12-userSummaCredita;
      summaIpoteki=userSummaCredita+procentu;

      String egemesPlataStr=egemesPlata.toStringAsFixed(2);
      String procentuStr=procentu.toStringAsFixed(2);
      String summaIpotekiStr=summaIpoteki.toStringAsFixed(2);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=> Result(Raschet1: '$egemesPlataStr', Raschet2: '$procentuStr', Raschet3: '$summaIpotekiStr',)
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text('Ипотечный калькулятор', style: TextStyle(
            fontFamily: 'Arial'
        ),),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body:
      SingleChildScrollView(
        child: Center(
          child:
          Column(
              children: [
                Container(
                  child:
                  TextFormField(onChanged:(userStoimostNedv){
                    setState(() {
                      /*userStoimostNedv=StoimostNedv;*/
                    });
                  },decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Стоимость недвижимости',
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Arial',
                        color: Colors.black
                    ),
                    helperText: "Укажите стоимость предполагаемой недвижимости",
                  ),
                    keyboardType: TextInputType.number,
                    controller: t1,
                  ),
                  margin: EdgeInsets.all(10.0),
                ),
                Container(
                  child:
                  TextFormField(onChanged:(userPervVznos){
                    setState(() {
                      /*userPervVznos=PervVznos;*/
                    });

                  }, decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Первоначальный взнос',
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Arial',
                        color: Colors.black
                    ),
                    helperText: "Укажите первоначальный взнос",
                  ),
                    keyboardType: TextInputType.number,
                    controller: t2,
                  ),
                  margin: EdgeInsets.all(10.0),
                ),
                Container(
                  child:
                  TextFormField(onChanged:(userSummaCredita){
                    setState(() {
                      /*userSummaCredita=SummaCredita;*/
                    });

                  },decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Сумма кредита',
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Arial',
                        color: Colors.black
                    ),
                    helperText: "Укажите сумму кредита",
                  ),
                    keyboardType: TextInputType.number,
                    controller: t3,
                  ),
                  margin: EdgeInsets.all(10.0),
                ),
                Container(
                  child:
                  TextFormField(onChanged:(userSrokCredita){
                    setState(() {
                      /*userSrokCredita=SrokCredita;*/
                    });

                  },decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Срок кредита',
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Arial',
                        color: Colors.black
                    ),
                    helperText: "Укажите срок кредита",
                  ),
                    keyboardType: TextInputType.number,
                    controller: t4,
                  ),
                  margin: EdgeInsets.all(10.0),
                ),
                Container(
                  child:
                  TextFormField(onChanged:(userProcentStavka){
                    setState(() {
                      /*userProcentStavka=ProcentStavka;*/
                    });

                  },decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Процентная ставка',
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Arial',
                        color: Colors.black
                    ),
                    helperText: "Укажите процентную ставку",
                  ),
                    keyboardType: TextInputType.number,
                    controller: t5,
                  ),
                  margin: EdgeInsets.all(10.0),
                ),
              ]
          ),
        ),
      ),
      floatingActionButton: SizedBox(width: 80, height: 80,
          child: FloatingActionButton(
            backgroundColor: Colors.black45,
            onPressed:doAddition,
            child: Icon(Icons.add_chart, color: Colors.white, size: 25,),
          )
      ),
    );
  }
}
