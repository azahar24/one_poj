import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _guest = [
    'Who do you remember from school?',
    'What are your favorite coluer',
    ' Who would you want to play you in a movie of your life?',
    'If you could choose to do anything for a day, what would it be?',
    'What really makes you angry?',
    'What is your biggest complaint about your job?',
  ];

  int questioninx =0;

 void nextQu (){
    setState((){
      questioninx++;
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 55,
                    width: 60,
                    child: Image.asset('assets/logo/logo.png'),
                  ),

                  TextButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Colors.blueGrey,
                          width: 3
                        )
                      ),
                      onPressed: (){},
                      child: Text('Record their answer',style: TextStyle(
                        color: Colors.blueGrey,
                        //height: 15,
                        fontWeight: FontWeight.w500

                      ),)),
                ],
              ),
            ),
            SizedBox(height: 40,),
            Container(
              height: 50,
              child: Text('Grow closer to your loved ones\n by asking them this question.',style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 17
              ),),
            ),
            SizedBox(height: 10,),
            Container(
              child: Center(
                child: Text(_guest[questioninx],style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,

                ),maxLines: 2,textAlign: TextAlign.center,),
              ),
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: (){
                    FlutterClipboard.copy(_guest[questioninx]).then(( value ) => Get.snackbar('Coped', '',snackPosition: SnackPosition.BOTTOM));
                  },
                  //splashColor: Colors.black,
                  child: Container(
                    //margin: EdgeInsets.all(5),
                    height: 45,
                    width: 185,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(15)
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.copy_outlined,color: Colors.white,),
                          Text('Copy this question',style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w800
                          ),),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    nextQu();
                  },
                  //splashColor: Colors.black,
                  child: Container(

                    //margin: EdgeInsets.all(5),
                    height: 45,
                    width: 185,
                    decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.blueGrey,width: 2),

                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.double_arrow,color: Colors.blueGrey,),
                            Text('Try another one',style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 17,
                              fontWeight: FontWeight.w800
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
