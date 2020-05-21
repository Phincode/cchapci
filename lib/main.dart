import 'package:cchapci/pages/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  setorientation();
  runApp(MaterialApp(
    title: "CChap",
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}
Future setorientation() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
}
class HomeScreen extends StatefulWidget{

  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {


  Widget TopScreen = Column(
    children: <Widget>[

    ],
  );

  @override

  Widget build(BuildContext context) {

    return new Scaffold(
      body: new Stack(

        alignment: Alignment.bottomCenter,
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/font_image.jpeg"),
            fit: BoxFit.cover,
            color: Color(0x95643AEF),
            colorBlendMode: BlendMode.color,
          ),

          new Container(

            child: Column(
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 40,),
                      Image.asset("assets/logo_b.png", height: 100, width: 200,),
                      Text(
                        "Ne vous fatiguez plus!!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        "On se charge de vos courses...",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),


              ],
            ),

          ),


          Positioned(
            height: MediaQuery.of(context).size.width<400?MediaQuery.of(context).size.height/2:MediaQuery.of(context).size.height/2.5,
            width: MediaQuery.of(context).size.width,
            bottom: 0,
            child: ClipOval(
              clipper: OvalTopBorderClipper(),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF321D78), Color(0xFF643AEF)],
                    )
                ),

                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 110),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Course()));
                              },
                              child: Container(
                                height:MediaQuery.of(context).size.width<400?80:110,
                                width: MediaQuery.of(context).size.width<400?80:110,

                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white,
                                        width: 0.9,
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                child: Center(
                                  child: Icon(Icons.directions_run, size: 65, color: Colors.white,),
                                ),
                              ),
                            ),

                            SizedBox(height: 10,),
                            new Text(
                              "Course",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
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
                              },
                              child: Container(
                                height:MediaQuery.of(context).size.width<400?80:110 ,
                                width: MediaQuery.of(context).size.width<400?80:110,

                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white,
                                        width: 0.9,
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                child: Center(
                                  child: Icon(Icons.info, color: Colors.white, size: 65,),
                                ),
                              ),
                            ),

                            SizedBox(height: 10,),
                            new Text(
                              "Infos Utiles",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                showDialog(context: context, builder: (BuildContext context){
                                  return new AlertDialog(
                                    title: new Text("Conditions d'utilisation de CCHAP",textAlign: TextAlign.center,),
                                    backgroundColor: Color(0xFF321D78),
                                    content:  new Container(
                                      height:MediaQuery.of(context).size.width>400?MediaQuery.of(context).size.height/1.5:MediaQuery.of(context).size.height/1.5,
                                      child:   ListView(
                                        children: <Widget>[
                                          Text(
                                            "En utilisant cette application vous acceptez toutes les conditions qui suivent:cette application est la propriété de CCHAP. Toute reproduction ou copie partielle ou totale d\'une quelconque représentation graphique(images, logo, vidéo, etc.) présente dans l'application est un acte de fraude. Nous nous réservons le droit d'utiliser vos données dans le cadre strict de l'exercice de notre activité afin d'améliorer votre expérience utilisateurs et nos services. Toute autre utilisation du logiciel non expressément autorisée par l’éditeur, est interdite. En particulier, sont proscrits : la copie de tout ou partie du logiciel, l’ingénierie inverse, la décompilation, le désassemblage du logiciel, le déchiffrage ou la modification du code source. L’éditeur se réserve le droit exclusif de corriger les éventuelles erreurs affectant le logiciel et de déterminer les modalités particulières auxquelles seront soumises la reproduction permanente ou provisoire du logiciel, ainsi que la traduction, l’adaptation, l’arrangement ou toute autre modification du logiciel. En cas de problème concernant l'utilisation de l'application veuillez nous contacter au 22549896203.\n By using this application you accept all the following conditions: this application is the property of CCHAP. Any reproduction or partial or total copy of any graphic representation (images, logo, video, etc.) present in the application is an act of fraud. We reserve the right to use your data in the strict framework of the exercise of our activity in order to improve your user experience and our services. Any other use of the software not expressly authorized by the publisher, is prohibited. In particular, are prohibited: copying all or part of the software, reverse engineering, decompiling, disassembling the software, decrypting or modifying the source code. The publisher reserves the exclusive right to correct any errors affecting the software and to determine the specific conditions to which the permanent or provisional reproduction of the software will be subjected, as well as the translation, adaptation, arrangement or any other modification of the software. If you have any problems using the application please contact us at 22549896203.",
                                            textAlign: TextAlign.start,
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

                              },
                              child: Container(
                                height: MediaQuery.of(context).size.width<400?80:110,
                                width: MediaQuery.of(context).size.width<400?80:110,

                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white,
                                        width: 0.9,
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                child: Center(
                                  child: Icon(Icons.description, color: Colors.white, size: 65,),
                                ),
                              ),
                            ),

                            SizedBox(height: 10,),
                            new Text(
                              "Infos C'chap",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                              ),
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],


      ),
    );
  }
}
