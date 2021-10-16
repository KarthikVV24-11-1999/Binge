import 'package:binge/decks.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Bingecoins extends StatefulWidget {
  const Bingecoins({Key key}) : super(key: key);


  @override
  _BingecoinsState createState() => _BingecoinsState();
}

class _BingecoinsState extends State<Bingecoins> {

  Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();

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
          builder: (context) => Decks(),
        ));
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
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF77db9b), width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                  hintText: "Amount to Pay"
              ),
            ),
            SizedBox(height: 12,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color(0xFF77db9b)),
              child: Text("Purchase Coins", style: TextStyle(
                  color: Colors.white
              ),),
              onPressed: (){
                openCheckout();
              },
            )
          ],
        ),
      ),
    );
  }
}
