import 'package:flutter/material.dart';
import 'package:destini_app/storybrain.dart';

void main()
{
  runApp(Destini());
}

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {

  StoryBrain storyBrain = new StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover
          )
        ),
       padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child:SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                  child: TextButton( onPressed: () {},child:Center(
                child: Text(storyBrain.getStory(),style: TextStyle(fontSize: 25,color: Colors.white),),
              ),)),
              Expanded(
                  flex: 2,
                  child: TextButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                    onPressed: () {
                      setState(() {
                      storyBrain.nextStory(1);
                    });},child: Text(storyBrain.choice1(),style: TextStyle(fontSize: 20,color: Colors.white),),)),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                  flex: 2,
                child: Visibility(
                    visible: storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
                    onPressed: () {setState(() {
                      storyBrain.nextStory(2);
                    });},child: Text(storyBrain.choice2(),style: TextStyle(fontSize: 20,color: Colors.white),),)),
              )],
          ),
        ) ,
      ),
    );
  }
}

