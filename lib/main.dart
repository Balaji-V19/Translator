import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_dialog/flutter_progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController title,description,tags;
  var currenteyeval='Afrikaans';
  var added = [];
  String currentText = "";
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  var inde=0;
  var code=['af', 'ak', 'sq', 'am', 'ar', 'an', 'hy', 'as', 'av', 'ae', 'ay', 'az', 'ba', 'bm', 'eu', 'be', 'bn', 'bh', 'bi', 'bo', 'bs', 'br', 'bg', 'my', 'ca', 'cs', 'ch', 'ce', 'zh', 'cu', 'cv', 'kw', 'co', 'cr', 'cy', 'da', 'de', 'dv', 'nl', 'dz', 'el', 'en', 'eo', 'et', 'ee', 'fo', 'fa', 'fj', 'fi', 'fr', 'fy', 'ff', 'ka', 'gd', 'ga', 'gl', 'gv', 'el', 'gn', 'gu', 'ht', 'ha', 'he', 'hz', 'hi', 'ho', 'hr', 'hu', 'ig', 'is', 'io', 'ii', 'iu', 'ie', 'ia', 'id', 'ik', 'it', 'jv', 'ja', 'kl', 'kn', 'ks', 'kr', 'kk', 'km', 'ki', 'rw', 'ky', 'kv', 'kg', 'ko', 'kj', 'ku', 'lo', 'la', 'lv', 'li', 'ln', 'lt', 'lb', 'lu', 'lg', 'mk', 'mh', 'ml', 'mi', 'mr', 'ms', 'mg', 'mt', 'mn', 'na', 'nv', 'nr', 'ng', 'ne', 'nn', 'nb', 'no', 'ny', 'oc', 'oj', 'or', 'om', 'os', 'pa', 'pi', 'pl', 'pt', 'ps', 'qu', 'rm', 'ro', 'rn', 'ru', 'sg', 'sa', 'si', 'sk', 'sl', 'se', 'sm', 'sn', 'sd', 'so', 'st', 'es', 'sc', 'sr', 'ss', 'su', 'sw', 'sv', 'ty', 'ta', 'tt', 'te', 'tg', 'tl', 'th', 'ti', 'to', 'tn', 'ts', 'tk', 'tr', 'tw', 'ug', 'uk', 'ur', 'uz', 've', 'vi', 'vo', 'wa', 'wo', 'xh', 'yi', 'yo', 'za'];
  var name=['Afrikaans', 'Akan', 'Albanian', 'Amharic', 'Arabic', 'Aragonese', 'Armenian', 'Assamese', 'Avaric', 'Avestan', 'Aymara', 'Azerbaijani', 'Bashkir', 'Bambara', 'Basque', 'Belarusian', 'Bengali', 'Bihari languages', 'Bislama', 'Tibetan', 'Bosnian', 'Breton', 'Bulgarian', 'Burmese', 'Catalan', 'Czech', 'Chamorro', 'Chechen', 'Chinese', 'Church Slavic', 'Chuvash', 'Cornish', 'Corsican', 'Cree', 'Welsh', 'Danish', 'German', 'Divehi', 'Dutch', 'Dzongkha', 'Greek', 'English', 'Esperanto', 'Estonian', 'Ewe', 'Faroese', 'Persian', 'Fijian', 'Finnish', 'French', 'Western Frisian', 'Fulah', 'Georgian', 'Gaelic', 'Irish', 'Galician', 'Manx', 'Greek, Modern', 'Guarani', 'Gujarati', 'Haitian', 'Hausa', 'Hebrew', 'Herero', 'Hindi', 'Hiri Motu', 'Croatian', 'Hungarian', 'Igbo', 'Icelandic', 'Ido', 'Sichuan Yi', 'Inuktitut', 'Interlingue', 'Interlingua ', 'Indonesian', 'Inupiaq', 'Italian', 'Javanese', 'Japanese', 'Kalaallisut', 'Kannada', 'Kashmiri', 'Kanuri', 'Kazakh', 'Central Khmer', 'Kikuyu', 'Kinyarwanda', 'Kirghiz', 'Komi', 'Kongo', 'Korean', 'Kuanyama', 'Kurdish', 'Lao', 'Latin', 'Latvian', 'Limburgan', 'Lingala', 'Lithuanian', 'Luxembourgish', 'Luba-Katanga', 'Ganda', 'Macedonian', 'Marshallese', 'Malayalam', 'Maori', 'Marathi', 'Malay', 'Malagasy', 'Maltese', 'Mongolian', 'Nauru', 'Navajo', 'Ndebele', 'Ndonga', 'Nepali', 'Norwegian Nynorsk', 'Bokmål', 'Norwegian', 'Chichewa', 'Occitan ', 'Ojibwa', 'Oriya', 'Oromo', 'Ossetian', 'Panjabi', 'Pali', 'Polish', 'Portuguese', 'Pushto', 'Quechua', 'Romansh', 'Romanian', 'Rundi', 'Russian', 'Sango', 'Sanskrit', 'Sinhala', 'Slovak', 'Slovenian', 'Northern Sami', 'Samoan', 'Shona', 'Sindhi', 'Somali', 'Sotho', 'Spanish', 'Sardinian', 'Serbian', 'Swati', 'Sundanese', 'Swahili', 'Swedish', 'Tahitian', 'Tamil', 'Tatar', 'Telugu', 'Tajik', 'Tagalog', 'Thai', 'Tigrinya', 'Tonga ', 'Tswana', 'Tsonga', 'Turkmen', 'Turkish', 'Twi', 'Uighur', 'Ukrainian', 'Urdu', 'Uzbek', 'Venda', 'Vietnamese', 'Volapük', 'Walloon', 'Wolof', 'Xhosa', 'Yiddish', 'Yoruba', 'Zhuang'];
  var translator=GoogleTranslator();
  _MyAppState() {
    textField = SimpleAutoCompleteTextField(
      key: key,
      decoration: new InputDecoration(hintText: 'Search here',hintStyle:TextStyle(color: Color(0xff27A102)) ),
      style: TextStyle(color: Color(0xff27A102)),
      suggestions: name,
      textChanged: (text) {
        setState(() {
          inde=name.indexOf(text);
          print('here is the code ${code[inde]}');
          currentText = text;
          added.clear();
        });
      },
      textSubmitted: (text) {
        setState(() {
          print('here is the press for no 1 $text');
          added.clear();
          inde=name.indexOf(text);
          print('here is the code ${code[inde]}');
          currentText = text;
          added.add(text);
        });
      },
      clearOnSubmit: true,
    );
  }


  @override
  void initState() {
    title=TextEditingController(text: "");
    description=TextEditingController(text: "");
    tags=TextEditingController(text: "");
    super.initState();
  }

  SimpleAutoCompleteTextField textField;
  bool showWhichErrorText = false;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    Column autocompletetext = new Column(
        children: [
            new ListTile(
               title: textField,
            )
          ]
      );

    autocompletetext.children.addAll(added.map((item) {
      return new ListTile(title: new Text(item,style: TextStyle(color: Color(0xff27A102)),));
    }));
    return LayoutBuilder(
      builder: (context,widgetsize){
        if(widgetsize.maxWidth>1200){
          return Scaffold(
            body: Container(
              width: width,
              height: height,
              color: Colors.black,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: width*0.5,
                        height: height,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: height*0.1,),
                              Text('Translator',style: TextStyle(
                                  fontSize: 33.0,color: Color(0xff27A102),fontWeight:
                              FontWeight.bold,decoration: TextDecoration.none
                              ),),
                              SizedBox(height: 40.0,),
                              Container(
                                width: width*0.3,
                                child: Column(
                                  children: [
                                    autocompletetext,
                                    SizedBox(height: 30.0,),
                                    TextField(
                                      controller: title,
                                      decoration: InputDecoration(
                                          labelText: 'Title',
                                          filled: true,
                                          fillColor: Color(0xff707070)
                                      ),
                                    ),
                                    SizedBox(height: 30.0,),
                                    TextField(
                                      controller: tags,
                                      decoration: InputDecoration(
                                          labelText: 'Tags',
                                          filled: true,
                                          fillColor: Color(0xff707070)
                                      ),
                                    ),
                                    SizedBox(height: 30.0,),
                                    TextField(
                                      controller: description,
                                      maxLines: 3,
                                      decoration: InputDecoration(
                                          labelText: 'Description',
                                          filled: true,
                                          fillColor: Color(0xff707070)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40.0,),
                              RaisedButton(
                                color:Color(0xff27A102),
                                onPressed: ()async{
                                  //showProgressDialog(context: context,loadingText: 'Loading...');
                                  var de,tg,tt1,dd1,tg1;
                                  var s=true;
                                  var tit=await title.text.translate(to: code[inde]).catchError((err){
                                    //dismissProgressDialog();
                                    setState(() {
                                      s=false;
                                    });
                                  }).then((value){
                                    setState(() {
                                      tt1=value;
                                    });
                                  });
                                  de=await description.text.translate(to: code[inde]).catchError((err){
                                      //dismissProgressDialog();
                                    setState(() {
                                      s=false;
                                    });
                                  }).then((value) {
                                    setState(() {
                                      dd1=value;
                                    });
                                  });
                                  tg=await tags.text.translate(to: code[inde]).catchError((err){
                                        //dismissProgressDialog();
                                    setState(() {
                                      s=false;
                                    });
                                  }).then((value) {
                                    setState(() {
                                      tg1=value;
                                    });
                                  });
                                  if(tt1!=null && dd1!=null && tg1!=null && s) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                        Secondpage(tt1, dd1, tg1)));
                                  }
                                  else{
                                    Alert(
                                      context: context,
                                      title: 'Something is wrong',
                                      type: AlertType.error,
                                    ).show();
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text('Submit',style: TextStyle(
                                      fontSize: 24.0,color:Colors.white,fontWeight:
                                  FontWeight.bold,decoration: TextDecoration.none
                                  ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: width*0.45,
                        height: height,
                        child: Image.asset('assets/homepageimg.png',fit: BoxFit.fill,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }else if(widgetsize.maxWidth<1200 && widgetsize.maxWidth>800){
          return  Scaffold(
            body: Container(
              width: width,
              height: height,
              color: Colors.black,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: width*0.5,
                        height: height,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: height*0.1,),
                              Text('Translator',style: TextStyle(
                                  fontSize: 33.0,color: Color(0xff27A102),fontWeight:
                              FontWeight.bold,decoration: TextDecoration.none
                              ),),
                              SizedBox(height: 40.0,),
                              Container(
                                width: width*0.3,
                                child: Column(
                                  children: [
                                    autocompletetext,
                                    SizedBox(height: 30.0,),
                                    TextField(
                                      controller: title,
                                      decoration: InputDecoration(
                                          labelText: 'Title',
                                          filled: true,
                                          fillColor: Color(0xff707070)
                                      ),
                                    ),
                                    SizedBox(height: 30.0,),
                                    TextField(
                                      controller: tags,
                                      decoration: InputDecoration(
                                          labelText: 'Tags',
                                          filled: true,
                                          fillColor: Color(0xff707070)
                                      ),
                                    ),
                                    SizedBox(height: 30.0,),
                                    TextField(
                                      controller: description,
                                      maxLines: 3,
                                      decoration: InputDecoration(
                                          labelText: 'Description',
                                          filled: true,
                                          fillColor: Color(0xff707070)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40.0,),
                              RaisedButton(
                                color:Color(0xff27A102),
                                onPressed: ()async{
                                  //showProgressDialog(context: context,loadingText: 'Loading...');
                                  var de,tg,tt1,dd1,tg1;
                                  var s=true;
                                  var tit=await title.text.translate(to: code[inde]).catchError((err){
                                    //dismissProgressDialog();
                                    setState(() {
                                      s=false;
                                    });
                                  }).then((value){
                                    setState(() {
                                      tt1=value;
                                    });
                                  });
                                  de=await description.text.translate(to: code[inde]).catchError((err){
                                    //dismissProgressDialog();
                                    setState(() {
                                      s=false;
                                    });
                                  }).then((value) {
                                    setState(() {
                                      dd1=value;
                                    });
                                  });
                                  tg=await tags.text.translate(to: code[inde]).catchError((err){
                                    //dismissProgressDialog();
                                    setState(() {
                                      s=false;
                                    });
                                  }).then((value) {
                                    setState(() {
                                      tg1=value;
                                    });
                                  });
                                  if(tt1!=null && dd1!=null && tg1!=null && s) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                        Secondpage(tt1, dd1, tg1)));
                                  }
                                  else{
                                    Alert(
                                      context: context,
                                      title: 'Something is wrong',
                                      type: AlertType.error,
                                    ).show();
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text('Submit',style: TextStyle(
                                      fontSize: 24.0,color:Colors.white,fontWeight:
                                  FontWeight.bold,decoration: TextDecoration.none
                                  ),),
                                ),
                              ),
                              SizedBox(height: 70.0,),


                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: width*0.45,
                        height: height,
                        child: Image.asset('assets/homepageimg.png',fit: BoxFit.fill,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }else{
          return  Scaffold(
            body: Container(
              width: width,
              height: height,
              color: Colors.black,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: width,
                      //height: height*0.45,
                      child: Image.asset('assets/homepageimg.png',fit: BoxFit.fill,),
                    ),
                    Container(
                      width: width*0.9,
                      child: Column(
                        children: [
                          SizedBox(height: height*0.1,),
                          Text('Translator',style: TextStyle(
                              fontSize: 27.0,color: Color(0xff27A102),fontWeight:
                          FontWeight.bold,decoration: TextDecoration.none
                          ),),
                          SizedBox(height: 40.0,),
                          autocompletetext,
                          SizedBox(height: 30.0,),
                          TextField(
                            controller: title,
                            decoration: InputDecoration(
                                labelText: 'Title',
                                filled: true,
                                fillColor: Color(0xff707070)
                            ),
                          ),
                          SizedBox(height: 30.0,),
                          TextField(
                            controller: tags,
                            decoration: InputDecoration(
                                labelText: 'Tags',
                                filled: true,
                                fillColor: Color(0xff707070)
                            ),
                          ),
                          SizedBox(height: 30.0,),
                          TextField(
                            controller: description,
                            maxLines: 3,
                            decoration: InputDecoration(
                                labelText: 'Description',
                                filled: true,
                                fillColor: Color(0xff707070)
                            ),
                          ),
                          SizedBox(height: 40.0,),
                          RaisedButton(
                            color:Color(0xff27A102),
                            onPressed: ()async{
                              //showProgressDialog(context: context,loadingText: 'Loading...');
                              var de,tg,tt1,dd1,tg1;
                              var s=true;
                              var tit=await title.text.translate(to: code[inde]).catchError((err){
                                //dismissProgressDialog();
                                setState(() {
                                  s=false;
                                });
                              }).then((value){
                                setState(() {
                                  tt1=value;
                                });
                              });
                              de=await description.text.translate(to: code[inde]).catchError((err){
                                //dismissProgressDialog();
                                setState(() {
                                  s=false;
                                });
                              }).then((value) {
                                setState(() {
                                  dd1=value;
                                });
                              });
                              tg=await tags.text.translate(to: code[inde]).catchError((err){
                                //dismissProgressDialog();
                                setState(() {
                                  s=false;
                                });
                              }).then((value) {
                                setState(() {
                                  tg1=value;
                                });
                              });
                              if(tt1!=null && dd1!=null && tg1!=null && s) {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                    Secondpage(tt1, dd1, tg1)));
                              }
                              else{
                                Alert(
                                  context: context,
                                  title: 'Something is wrong',
                                  type: AlertType.error,
                                ).show();
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Submit',style: TextStyle(
                                  fontSize: 24.0,color:Colors.white,fontWeight:
                              FontWeight.bold,decoration: TextDecoration.none
                              ),),
                            ),
                          ),
                          SizedBox(height: height*0.1,),


                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        }
      },

    );
  }
}


class Secondpage extends StatefulWidget {
  var title,des,tag;
  Secondpage(this.title,this.des,this.tag);
  @override
  _SecondpageState createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  final key = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      key: key,
      body: LayoutBuilder(
        builder: (context,widsize){
          if(widsize.maxWidth>1200){
            return Container(
              width: width,
              height: height,
              color: Colors.black,
              child: Row(
                children: [
                  Container(
                    width: width*0.45,
                    height: height,
                    child: Image.asset('assets/resultpageimg.png',fit: BoxFit.fill,),
                  ),
                  Container(
                    width: width*0.5,
                    height: height,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: height*0.1,),
                          Text('Translator Results',style: TextStyle(
                              fontSize: 33.0,color: Color(0xff27A102),fontWeight:
                          FontWeight.bold,decoration: TextDecoration.none
                          ),),
                          SizedBox(height: 40.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Title',style: TextStyle(
                                  fontSize: 21.0,color: Color(0xff27A102),fontWeight:
                              FontWeight.bold,decoration: TextDecoration.none
                              ),),
                              GestureDetector(
                                onLongPress: () {
                                  Clipboard.setData(new ClipboardData(text: widget.title));
                                  key.currentState.showSnackBar(
                                      new SnackBar(content: new Text("Copied to Clipboard"),));
                                },
                                child: Container(
                                  width: width*0.35,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(widget.title,style: TextStyle(
                                        fontSize: 18.0,color: Colors.white,fontWeight:
                                    FontWeight.normal,decoration: TextDecoration.none
                                    ),),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 40.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Tags',style: TextStyle(
                                  fontSize: 21.0,color: Color(0xff27A102),fontWeight:
                              FontWeight.bold,decoration: TextDecoration.none
                              ),),
                              GestureDetector(
                                onLongPress: () {
                                  Clipboard.setData(new ClipboardData(text: widget.tag));
                                  key.currentState.showSnackBar(
                                      new SnackBar(content: new Text("Copied to Clipboard"),));
                                },
                                child: Container(
                                  width: width*0.35,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(widget.tag,style: TextStyle(
                                        fontSize: 18.0,color: Colors.white,fontWeight:
                                    FontWeight.normal,decoration: TextDecoration.none
                                    ),),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 40.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Description',style: TextStyle(
                                  fontSize: 21.0,color: Color(0xff27A102),fontWeight:
                              FontWeight.bold,decoration: TextDecoration.none
                              ),),
                              GestureDetector(
                                onLongPress: () {
                                  Clipboard.setData(new ClipboardData(text: widget.des));
                                  key.currentState.showSnackBar(
                                      new SnackBar(content: new Text("Copied to Clipboard"),));
                                },
                                child: Container(
                                  width: width*0.35,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(widget.des,style: TextStyle(
                                        fontSize: 18.0,color: Colors.white,fontWeight:
                                    FontWeight.normal,decoration: TextDecoration.none
                                    ),),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 40.0,),
                          RaisedButton(
                            color: Color(0xff27A102),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child:Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('<--Back',style: TextStyle(
                                  fontSize: 24.0,color:Colors.white,fontWeight:
                              FontWeight.bold,decoration: TextDecoration.none
                              ),),
                            ),),
                          SizedBox(height: height*0.1,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }else if(widsize.maxWidth<1200 && widsize.maxWidth>800){
            return Container(
              width: width,
              height: height,
              color: Colors.black,
              child: Row(
                children: [
                  Container(
                    width: width*0.45,
                    height: height,
                    child: Image.asset('assets/resultpageimg.png',fit: BoxFit.fill,),
                  ),
                  Container(
                    width: width*0.5,
                    height: height,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: height*0.1,),
                          Text('Translator Results',style: TextStyle(
                              fontSize: 33.0,color: Color(0xff27A102),fontWeight:
                          FontWeight.bold,decoration: TextDecoration.none
                          ),),
                          SizedBox(height: 40.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Title : ',style: TextStyle(
                                  fontSize: 21.0,color: Color(0xff27A102),fontWeight:
                              FontWeight.bold,decoration: TextDecoration.none
                              ),),
                              GestureDetector(
                                onLongPress: () {
                                  Clipboard.setData(new ClipboardData(text: widget.title));
                                  key.currentState.showSnackBar(
                                      new SnackBar(content: new Text("Copied to Clipboard"),));
                                },
                                child: Container(
                                  width: width*0.35,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(widget.title,style: TextStyle(
                                        fontSize: 18.0,color: Colors.white,fontWeight:
                                    FontWeight.normal,decoration: TextDecoration.none
                                    ),),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 40.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Tags : ',style: TextStyle(
                                  fontSize: 21.0,color: Color(0xff27A102),fontWeight:
                              FontWeight.bold,decoration: TextDecoration.none
                              ),),
                              GestureDetector(
                                onLongPress: () {
                                  Clipboard.setData(new ClipboardData(text: widget.tag));
                                  key.currentState.showSnackBar(
                                      new SnackBar(content: new Text("Copied to Clipboard"),));
                                },
                                child: Container(
                                  width: width*0.35,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(widget.tag,style: TextStyle(
                                        fontSize: 18.0,color: Colors.white,fontWeight:
                                    FontWeight.normal,decoration: TextDecoration.none
                                    ),),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 40.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Description',style: TextStyle(
                                  fontSize: 21.0,color: Color(0xff27A102),fontWeight:
                              FontWeight.bold,decoration: TextDecoration.none
                              ),),
                              GestureDetector(
                                onLongPress: () {
                                  Clipboard.setData(new ClipboardData(text: widget.des));
                                  key.currentState.showSnackBar(
                                      new SnackBar(content: new Text("Copied to Clipboard"),));
                                },
                                child: Container(
                                  width: width*0.35,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(widget.des,style: TextStyle(
                                        fontSize: 18.0,color: Colors.white,fontWeight:
                                    FontWeight.normal,decoration: TextDecoration.none
                                    ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40.0,),
                          RaisedButton(
                            color: Color(0xff27A102),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child:Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('<--Back',style: TextStyle(
                                  fontSize: 24.0,color:Colors.white,fontWeight:
                              FontWeight.bold,decoration: TextDecoration.none
                              ),),
                            ),),
                          SizedBox(height: height*0.1,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }else{
            return Container(
              width: width,
              height: height,
              color: Colors.black,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: width,
                      child: Image.asset('assets/resultpageimg.png',fit: BoxFit.fill,),
                    ),
                    Container(
                      width: width*0.9,
                      child: Column(
                        children: [
                          SizedBox(height: height*0.1,),
                          Text('Translator Results',style: TextStyle(
                              fontSize: 33.0,color: Color(0xff27A102),fontWeight:
                          FontWeight.bold,decoration: TextDecoration.none
                          ),),
                          SizedBox(height: 40.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Title :',style: TextStyle(
                                  fontSize: 21.0,color: Color(0xff27A102),fontWeight:
                              FontWeight.bold,decoration: TextDecoration.none
                              ),),
                              GestureDetector(
                                onLongPress: () {
                                  Clipboard.setData(new ClipboardData(text: widget.title));
                                  key.currentState.showSnackBar(
                                      new SnackBar(content: new Text("Copied to Clipboard"),));
                                },
                                child: Container(
                                  width: width*0.45,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(widget.title,style: TextStyle(
                                        fontSize: 18.0,color: Colors.white,fontWeight:
                                    FontWeight.normal,decoration: TextDecoration.none
                                    ),),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 40.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Tags :',style: TextStyle(
                                  fontSize: 21.0,color: Color(0xff27A102),fontWeight:
                              FontWeight.bold,decoration: TextDecoration.none
                              ),),
                              GestureDetector(
                                onLongPress: () {
                                  Clipboard.setData(new ClipboardData(text: widget.tag));
                                  key.currentState.showSnackBar(
                                      new SnackBar(content: new Text("Copied to Clipboard"),));
                                },
                                child: Container(
                                  width: width*0.45,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(widget.tag,style: TextStyle(
                                        fontSize: 18.0,color: Colors.white,fontWeight:
                                    FontWeight.normal,decoration: TextDecoration.none
                                    ),),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 40.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Description :',style: TextStyle(
                                  fontSize: 21.0,color: Color(0xff27A102),fontWeight:
                              FontWeight.bold,decoration: TextDecoration.none
                              ),),
                              GestureDetector(
                                onLongPress: () {
                                  Clipboard.setData(new ClipboardData(text: widget.des));
                                  key.currentState.showSnackBar(
                                      new SnackBar(content: new Text("Copied to Clipboard"),));
                                },
                                child: Container(
                                  width: width*0.5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(widget.des,style: TextStyle(
                                        fontSize: 18.0,color: Colors.white,fontWeight:
                                    FontWeight.normal,decoration: TextDecoration.none
                                    ),),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 40.0,),
                          RaisedButton(
                            color: Color(0xff27A102),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child:Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('<--Back',style: TextStyle(
                                  fontSize: 24.0,color:Colors.white,fontWeight:
                              FontWeight.bold,decoration: TextDecoration.none
                              ),),
                          ),),
                          SizedBox(height: height*0.1,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      )
    );
  }
}
