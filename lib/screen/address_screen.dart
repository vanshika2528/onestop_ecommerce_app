import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _pinCodeController = TextEditingController();
  final _addressController = TextEditingController();
  final _localityController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  bool _isDefault = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Default is 56.0
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff000428), Color(0xff004e92)],
              stops: [0, 1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            title: Text(
              'Add Address',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent, // Make it transparent to show the gradient
            elevation: 0, // Remove shadow
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Contact Details
              Container(
              color: Colors.grey[200],
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              child: Text(
                'CONTACT DETAILS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
               SizedBox(height: 15),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), 
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
               SizedBox(height: 15),
              TextFormField(
                controller: _mobileController,
                decoration: InputDecoration(
                  labelText: 'Mobile No',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), 
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              // Address
                Container(
              color: Colors.grey[200],
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              child: Text(
                'ADDRESS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
               SizedBox(height: 15),
              TextFormField(
                controller: _pinCodeController,
                decoration: InputDecoration(
                  labelText: 'Pin Code',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), 
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your pin code';
                  }
                  return null;
                },
              ),
               SizedBox(height: 15),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address (House No, Building, Street, Area)',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), 
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _localityController,
                decoration: InputDecoration(
                  labelText: 'Locality / Town',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), 
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your locality or town';
                  }
                  return null;
                },
              ),
               SizedBox(height: 15),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'City / District',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), 
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your city or district';
                  }
                  return null;
                },
              ),
               SizedBox(height: 15),
              TextFormField(
                controller: _stateController,
                decoration: InputDecoration(
                  labelText: 'State',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), 
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your state';
                  }
                  return null;
                },
              ),
               SizedBox(height: 15),

              CheckboxListTile(
                title: Text('Make this my default address'),
                value: _isDefault,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isDefault = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
               SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process data and navigate to the next screen
                    Get.offNamed('payment');
                  }
                },
                child: Text(
                  'ADD ADDRESS',
                  style: TextStyle(
                    color: Color.fromARGB(255, 3, 3, 3),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.black),
                  backgroundColor: Color.fromARGB(255, 255, 255, 255), // Change the button color
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
