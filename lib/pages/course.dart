import 'package:cchapci/pages/resume.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class Course extends StatefulWidget {

  _CourseState createState() => new _CourseState();
}

class _CourseState extends State<Course> {

  int groupValue ;
  final nom=TextEditingController();
  final numero=TextEditingController();
  final localisation=TextEditingController();
  final description=TextEditingController();
  var wallet;
  var vehicule;


@override
void initState() {
    // TODO: implement initState
    super.initState();
    if (SchedulerBinding.instance.schedulerPhase == SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) => popup());
    }
  }


  @override

  Widget build(BuildContext context) {

    final buton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Color(0xFF321D78),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15.0, 20, 15),
          onPressed: (){
            print("ok");

            if(nom.value.text.isNotEmpty && numero.value.text.isNotEmpty && localisation.value.text.isNotEmpty && description.value.text.isNotEmpty && groupValue!=null && wallet!=null && vehicule!=null){

              List<String>data=[
                nom.value.text,numero.value.text,localisation.value.text,description.value.text,wallet,vehicule
              ];
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                return new resume(data);
              }));

            }else{
                Toast.show("Veillez remplir correctement le formulaire",context,backgroundColor: Colors.red);
            }




      },

        child: Text(
          "CONTINUER",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),



      ),
    );
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xFF321D78),
        ),
        elevation: 0.1,
        title: Center(
          child: Text(
              "COURSE",
              style: TextStyle(
                color: Color(0xFF321D78)
              ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Container(

                  child: Image.asset("assets/logo.png", height: 75, width: 150,),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Text(
                    "Veuillez remplir ces champs pour votre course",
                    style: TextStyle(
                      color: Color(0xFF321D78),
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(16, 25, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.person, color: Color(0xFF321D78), size: 35,),
                    SizedBox(width: 10,),
                    Text(
                      "Votre nom",
                      style: TextStyle(
                        color: Color(0xFF321D78),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                new TextFormField(
                  controller: nom,
                  maxLength: 15,

                ),
                 SizedBox(height: 14,) ,
                Row(
                  children: <Widget>[
                    Icon(Icons.phone, color: Color(0xFF321D78), size: 35,),
                    SizedBox(width: 10,),
                    Text(
                      "Votre numéro de téléphone",
                      style: TextStyle(
                        color: Color(0xFF321D78),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                new TextFormField(
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: numero,
                  maxLength: 12,
                ),

                SizedBox(height: 14,) ,

                Row(
                  children: <Widget>[
                    Icon(Icons.place, color: Color(0xFF321D78), size: 35,),
                    SizedBox(width: 10,),
                    Text(
                      "Où êtes-vous situé ?",
                      style: TextStyle(
                        color: Color(0xFF321D78),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                new TextFormField(
                  controller: localisation,
                  maxLength: 15,
                ),
                SizedBox(height: 14,) ,

                Row(
                  children: <Widget>[
                    Icon(Icons.description, color: Color(0xFF321D78), size: 35,),
                    SizedBox(width: 10,),
                    Text(
                      "Description de votre course",
                      style: TextStyle(
                        color: Color(0xFF321D78),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(top: 14),
                  padding: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height/4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFf2f2f2)
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    controller: description,
                    maxLines: 10,
                    maxLength: 1000,
                  ),
                ),

                SizedBox(height: 30,) ,

                Center(
                  child: Text(
                    "comment peut on transporter la charge(bagage) de votre course?",
                    style: TextStyle(
                        color: Color(0xFF321D78),
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold
                    ),

                  ),
                ),

                SizedBox(height: 14,) ,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        new Radio(value: 0, groupValue: groupValue, onChanged: (int e) => something(e), activeColor: Color(0xFF321D78),),
                        SizedBox(height: 2,),
                        Text(
                          "Moto",
                          style: TextStyle(
                            color: Color(0xFF321D78),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        new Radio(value: 1, groupValue: groupValue, onChanged: (int e) => something(e), activeColor: Color(0xFF321D78),),
                        SizedBox(height: 2,),
                        Text(
                          "Véhicule",
                          style: TextStyle(
                            color: Color(0xFF321D78),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        new Radio(value: 2, groupValue: groupValue, onChanged: (int e) => something(e), activeColor: Color(0xFF321D78),),
                        SizedBox(height: 2,),
                        Text(
                          "Fourgonnette",
                          style: TextStyle(
                            color: Color(0xFF321D78),
                          ),
                        )
                      ],
                    ),
                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        new Radio(value: 3, groupValue: groupValue, onChanged: (int e) => something(e), activeColor: Color(0xFF321D78),),
                        SizedBox(height: 2,),
                        Text(
                          "Gros camion",
                          style: TextStyle(
                            color: Color(0xFF321D78),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        new Radio(value: 4, groupValue: groupValue, onChanged: (int e) => something(e), activeColor: Color(0xFF321D78),),
                        SizedBox(height: 2,),
                        Text(
                          "Vélo",
                          style: TextStyle(
                            color: Color(0xFF321D78),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        new Radio(value: 5, groupValue: groupValue, onChanged: (int e) => something(e), activeColor: Color(0xFF321D78),),
                        SizedBox(height: 2,),
                        Text(
                          "pas de bagage",
                          style: TextStyle(
                            color: Color(0xFF321D78),
                          ),
                        )
                      ],
                    ),

                  ],
                ),

              ],
            ),
          ),

          Container(
              padding: const EdgeInsets.fromLTRB(16, 25, 16, 8),
              child: buton
          )
        ],
      ),
    );
  }


  void something(int e){
    setState(() {
      if(e ==0){
        groupValue = 0;
        wallet="3000 FCFA";
        vehicule="Moto";
      } else if(e == 1){
        groupValue = 1;
        wallet="5000 FCFA";
        vehicule="Véhicule";
      }else if(e == 2){
        groupValue = 2;
        wallet="5000 FCFA";
        vehicule="Fourgonnette";
      }else if(e == 3){
        groupValue = 3;
        wallet="veillez nous contacter";
        vehicule="Gros camion";
      }else if(e == 4){
        groupValue = 4;
        wallet="2200 FCFA";
        vehicule="Vélo";
      }else if(e ==5){
        groupValue = 5;
        wallet="2200 FCFA";
        vehicule="Aucun";
      }
    });
  }

  void popup(){
    showDialog(context: context, builder: (BuildContext context){
      return new AlertDialog(
        title: new Text("Bon à savoir...",textAlign: TextAlign.center,),
        backgroundColor: Color(0xFF321D78),
        content:  new Container(
          height:MediaQuery.of(context).size.width>400?MediaQuery.of(context).size.height/1.5:MediaQuery.of(context).size.height/1.5,
          child:   Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                " 1. Pour les courses hors d'Abidjan veuillez nous contacter directement.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,

                ),
              ),
              SizedBox(height: 15.0,),

              Center(
                child: IconButton(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () async {
                      await launch('tel:22549896203');
                    }
                ),
              ),

              SizedBox(height: 15.0,),
              Text(
                " 2. Choisissez le type de véhicule adéquat pour votre course en fonction de la charge(bagage) éventuelle à transporter.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 25.0,),
              RaisedButton(onPressed: (){
                Navigator.pop(context);

              },  child: Icon(Icons.check,color: Colors.blue,size: 80,),color: Colors.white,elevation: 2.0,
                shape: CircleBorder(side: BorderSide(style: BorderStyle.none)),


              )



            ],
          ),
        ),

      );
    });
  }
}