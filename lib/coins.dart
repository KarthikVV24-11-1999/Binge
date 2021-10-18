import 'package:binge/home.dart';
import 'package:binge/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Bingecoins extends StatefulWidget {
  const Bingecoins({Key key}) : super(key: key);


  @override
  _BingecoinsState createState() => _BingecoinsState();
}

class _BingecoinsState extends State<Bingecoins> {

  final DateTime timestamp = DateTime.now();
  Razorpay razorpay;
  String email ='';
  int coins;
  TextEditingController textEditingController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  
  @override
  void initState() {
    super.initState();
    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout(){
    var options = {
      "key" : "rzp_test_jJpBvtaRGZFQSe",
      "amount" : num.parse(textEditingController.text)*100,
      "name" : "BINGE!",
      "description" : "Bingecoin Purchase",
      "prefill" : {
        "contact" : "6969696969",
        "email" : "test@gmail.com"
      },
      "external" : {
        "wallets" : ["paytm"]
      }
    };

    try{
      razorpay.open(options);
    }catch(e){
      print(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {

    // Do something when payment succeeds
    print("Payment success");
    Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Home(),
        ));
    FirebaseFirestore.instance.collection('users').doc(currentUser.id).update({
      "amount": coins + num.parse(textEditingController.text),
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Payment error");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    print("External Wallet");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
            child: Container(
              color: Color(0xFF07fdab),
              height: 2.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("BingeCoins", textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontFamily: 'Bangers', fontSize: 30),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child:
        StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').doc(currentUser.id).snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return new Text("Loading");
              }
              var userDocument = snapshot.data;
              coins = userDocument["amount"];
              email = userDocument["email"];
              return Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    Text("Total Coins : ${coins.toString()}", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator: RequiredValidator(
                          errorText: "This Field Is Required."
                      ),
                      controller: textEditingController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF77db9b), width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFF77db9b), width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          hintText: "Amount to Pay",
                        hintStyle: TextStyle(color: Colors.white,),
                      ),
                    ),
                    SizedBox(height: 12,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF77db9b)),
                      child: Text("Purchase BingeCoins", style: TextStyle(
                          color: Colors.white
                      ),),
                      onPressed: (){
                        if (_formKey.currentState != null && _formKey.currentState.validate()){
                          openCheckout();
                        }

                      },
                    )
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
