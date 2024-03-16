import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:store_pro/product_store/model/app_state_model.dart';
import 'package:store_pro/themes/styles.dart';
import 'package:intl/intl.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {

  String? name;
  String? email;
  String? mobile;
  String? address;
  DateTime? dateTime = DateTime.now();
  final formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Name',
        prefixIcon: Icon(
          Ionicons.person_outline
        )
      ),
      validator: (String? value) {
        if(value!.isEmpty) {
          return'Name is Required';
        }
        return null;
      },
      onSaved: (String? value) {
        name = value;
      },
      onChanged: (value) => setState(() {
        name = value;
      }),
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
        prefixIcon: Icon(
          Ionicons.mail_outline
        )
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String? value) {
        if(value!.isEmpty) {
          return'Email is Required';
        }
        if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
          return 'Please enter a valid email address';
        }
        return null;
      },
      onSaved: (String? value) {
        email = value;
      },
      onChanged: (value) => setState(() {
        email = value;
      }),
    );
  }

  Widget _buildMobile() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Mobile',
        prefixIcon: Icon(Ionicons.call_outline)
      ),
      keyboardType: TextInputType.phone,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Mobile is Required';
        }
        return null;
      },
      onSaved: (String? value) {
        mobile = value;
      },
      onChanged: (value) => setState(() {
        mobile = value;
      }),
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Address',
        prefixIcon: Icon(
          Ionicons.location_outline
        )
      ),
      keyboardType: TextInputType.streetAddress,
      validator: (String? value) {
        if(value!.isEmpty){
          return 'Address is Required';
        }
        return null;
      },
      onSaved: (String? value) {
        email = value;
      },
      onChanged: (value) => setState(() {
        email = value;
      }),
    );
  }

  Widget _buildTimePicker(){
    // return TextFormField(
    //   decoration: const InputDecoration(
    //     labelText: 'Time',
    //     border: OutlineInputBorder(),
    //     prefixIcon: Icon(
    //       Ionicons.time_outline,
    //     )
    //   ),
    //   keyboardType: TextInputType.datetime,
    //   validator: (String? value) {
    //     if (value!.isEmpty) {
    //       return 'Time is Required';
    //     }
    //     return null;
    //   },
    //   onSaved: (String? value){
    //     address = value;
    //   },
    //   onChanged: (value) => setState(() {
    //     address = value;
    //   }),
    // );
    return InkWell(
      onTap: () async{
        final newTime = await showDatePicker(
          context: context,
          initialDate: dateTime!, 
          firstDate: DateTime(2000), 
          lastDate: DateTime(2025),
        );
        if (newTime != null) {
          dateTime = newTime;
        }
      },
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Row(
                children: [
                  Icon(
                    Ionicons.time_outline,
                    size: 28,
                  ),
                  SizedBox(width: 6,),
                  Text(
                    'Delivery Time',
                    style: Styles.deliveryTimeLable,
                  ),
                ],
              ),
              Text(
                DateFormat.yMMMd().add_jm().format(dateTime!),
                style: Styles.deliveryTimeLable,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer<AppStateModel>(
        builder: (context, value, child) {
          return ListView(
            children: [
              ExpansionTile(title: Text("Address Details"),
              children:[
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: _buildName(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: _buildEmail(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: _buildMobile(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: _buildAddress(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: _buildTimePicker(),
                      ),
                    ],
                  ),
                ),
              ])
            ],
          );
        },
      ),
    );
  }
}