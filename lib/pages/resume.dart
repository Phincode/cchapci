import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class resume extends StatefulWidget{
  List<String>data;

  resume(this.data);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _resume(this.data);
  }
  
}

class _resume extends State<resume>{

  final nom=TextEditingController();
  final numero=TextEditingController();
  final localisation=TextEditingController();
  final description=TextEditingController();
  bool isloading=false;


  List<String>data;
  _resume(this.data);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final buton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Color(0xFF321D78),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15.0, 20, 15),
        onPressed: () async {
          setState(() {
            isloading=true;
          });
          await http.post("https://api.cchap.ci/course",body: {
            'nom':data[0],
            'numero':data[1],
            'course_descr':data[3],
            'transport':data[5],
            'localisation':data[2],
            'montant_tt':data[4]
          }).then((response){
            if(response.statusCode==200){
              setState(() {
                isloading=false;
              });
              alerte();
            }else{
              setState(() {
                isloading=false;
              });
              Toast.show("Erreur du serveur Veillez réessayer...",context,backgroundColor: Colors.red);
            }
          }).catchError((e){
            setState(() {
              isloading=false;
            });
            Toast.show(e.toString(), context);
          });


        },

        child: Text(
          "Valider",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),



      ),
    );




    return new Scaffold(
      
     body: ListView(
             padding: EdgeInsets.all(5),
             children: <Widget>[
               SizedBox(height:20),
               new Wrap(
                 children: <Widget>[
                   new Row(
                     children: <Widget>[
                       new IconButton(icon: Icon(Icons.arrow_back_ios,size: 40.0,color: Color(0xFF321D78),),
                           onPressed: (){
                             Navigator.pop(context);
                           }),
                       SizedBox(width:MediaQuery.of(context).size.width/5),
                       new Center(
                         child: new Text("COURSE",textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF321D78),fontWeight: FontWeight.bold,),textScaleFactor: 2.0,),
                       )

                     ],
                   ),
                 ],
               ),
               SizedBox(height: 20,),
               new Card(
                   elevation: 8.0,
                   margin: EdgeInsets.all(20.0),
                   child: Container(
                     padding: EdgeInsets.all(10.0),
                     child: new Stack(
                       alignment: Alignment.topCenter,
                       children: <Widget>[
                         /*
                         new Container(
                           height: MediaQuery.of(context).size.height,
                           child: new Image.asset("assets/logo.png",alignment: Alignment.topCenter,repeat: ImageRepeat.repeat,),
                         ),
                         */
                         new Column(
                           children: <Widget>[
                             new Text("RESUME DE LA COURSE",style: TextStyle(color: Color(0xFF321D78),fontSize: 20.0,fontWeight: FontWeight.bold),),
                             SizedBox(height: 10,),
                             Row(
                               children: <Widget>[
                                 Text(
                                   "Votre nom:",
                                   textScaleFactor: 1.3,
                                   style: TextStyle(
                                     color: Color(0xFF321D78),
                                     fontSize: 15,
                                   ),
                                 ),
                                 Text(
                                   data[0],
                                   textScaleFactor: 1.3,
                                   softWrap: true,
                                   style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 15,
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(height: 14,) ,
                             Row(
                               children: <Widget>[
                                 Text(
                                   "Téléphone:",
                                   textScaleFactor: 1.3,
                                   style: TextStyle(
                                     color: Color(0xFF321D78),
                                     fontSize: 15,
                                   ),
                                 ),
                                 Text(
                                   data[1],
                                   textScaleFactor: 1.2,
                                   softWrap: true,
                                   style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 15,
                                   ),
                                 ),
                               ],

                             ),

                             SizedBox(height: 14,) ,
                             Row(
                               children: <Widget>[
                                    Text(
                                     "Localisation:",
                                     textScaleFactor: 1.3,
                                     style: TextStyle(
                                       color: Color(0xFF321D78),
                                       fontSize: 15,
                                     ),
                                   ),

                                 Text(
                                   data[2],
                                   textScaleFactor: 1.2,
                                   softWrap: true,
                                   style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 15,
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(height: 14,),
                             Row(
                               children: <Widget>[
                                 Text(
                                     "Description de la course:",
                                     textScaleFactor: 1.3,
                                     style: TextStyle(
                                       color: Color(0xFF321D78),
                                       fontSize: 15,
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
                               child: Text(
                                 data[3],
                                 style: TextStyle(color: Colors.black),
                               ),
                             ),
                             SizedBox(height: 10,),
                             Wrap(
                               children: <Widget>[

                                 Text(
                                   "Moyen de transport:",
                                   textScaleFactor: 1.3,

                                   style: TextStyle(
                                     color: Color(0xFF321D78),
                                     fontSize: 15,
                                   ),
                                 ),
                                 Text(
                                   data[5],
                                   textScaleFactor: 1.2,
                                   softWrap: true,
                                   style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 15,
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(height: 10,),
                             Wrap(
                               children: <Widget>[
                                 Text(
                                   "Prix estimé:",
                                   textScaleFactor: 1.3,
                                   style: TextStyle(
                                     color: Color(0xFF321D78),
                                     fontSize: 15,
                                   ),
                                 ),
                                 Text(
                                   data[4],
                                   softWrap: true,
                                   textScaleFactor: 1.3,
                                   style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 15,
                                   ),
                                 ),
                               ],
                             ),

                             SizedBox(height: 20,),
                             new Row(
                               children: <Widget>[
                                 new IconButton(icon: Icon(Icons.arrow_back_ios,size: 20.0,color: Color(0xFF321D78),),
                                     onPressed: (){
                                       Navigator.pop(context);
                                     }),

                                 new Text("Annuler",textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF321D78),fontWeight: FontWeight.bold,),textScaleFactor: 1.2,),

                               ],
                             ),


                           ],
                         )
                       ],
                     ),
                   )
               ),
               SizedBox(height: 20,),
               Stack(
                 alignment: Alignment.center,
                 children: <Widget>[
                   Container(
                     width:MediaQuery.of(context).size.width,
                     child:buton,
                   ),
                   isloading?CircularProgressIndicator():new Text("")

                 ],
               ),

             ],
           ),
    );
  }

  void alerte(){
    showDialog(context: context, builder: (BuildContext context){
      return new AlertDialog(
        backgroundColor: Color(0xFF321D78),
        content:  new Container(
          height:MediaQuery.of(context).size.width>400?MediaQuery.of(context).size.height/1.5:MediaQuery.of(context).size.height/1.5,
          child:   Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "COURSE TRANSMISE AVEC SUCCES",textScaleFactor: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,

                ),
              ),
              SizedBox(height: 15.0,),
              Text(
                " vous serez contacté par notre service client au"+" "+data[1]+" "+"pour la confirmation.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 25.0,),
              RaisedButton(onPressed: (){
                Navigator.pop(context);
                Navigator.of(context).pop();
                Navigator.of(context).pop();

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