import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ServiceDetails extends StatefulWidget {

  String? id;
  String? name;
  String? description;
  int? minQty;
  int? maxQty;
  int? price;
  int? serviceId;

  ServiceDetails({Key? key,
    this.id,
    this.name,
    this.description,
    this.minQty,
    this.maxQty,
    this.price,
    this.serviceId}) : super(key: key);

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState(
      id,name,description,minQty,maxQty,price,serviceId
  );
}

class _ServiceDetailsState extends State<ServiceDetails> {

  String? id;
  String? name;
  String? description;
  int? minQty;
  int? maxQty;
  int? price;
  int? serviceId;

  _ServiceDetailsState(this.id, this.name, this.description,
      this.minQty, this.maxQty, this.price, this.serviceId);

  late TextEditingController textFieldController = TextEditingController();
  bool? isApply;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(name!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            serviceDescription(),
            choiceServicePrice(),
            minOrder(),
            maxOrder(),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.green
            ),
            onPressed: (){
              isApply = true;
              // writeApplyPrice(textFieldController.text);
              Navigator.of(context).pop();
            },
            child: const Text(
              'ثبت',style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            )),
      ),
    );
  }

  Html serviceDescription() {
    return Html(
      data: description,
      style: {
        '#': Style(
          fontSize: const FontSize(18),
          textAlign: TextAlign.justify,
          maxLines: 10,
          padding: const EdgeInsets.all(5),
          textOverflow: TextOverflow.ellipsis,
          direction: TextDirection.rtl,
        ),
      },
    );
  }

  Padding choiceServicePrice() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text('(هر ۶۰ دقیقه)'),
          const SizedBox(width: 10,),
          const Text('ریال'),
          const SizedBox(width: 10,),
          SizedBox(
            width: 100,
            height: 40,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter(RegExp('[0-9۰-۹.]'), allow: true)
              ],
              onChanged: (content){
              },
              controller: textFieldController,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey)
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey)
                ),
              ),
            ),
          ),
          const SizedBox(width: 20,),
          const Text('هزینه خدمات :',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontWeight: FontWeight.w700
              ),
              textAlign: TextAlign.right),
        ],
      ),
    );
  }

  Padding minOrder() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(minQty.toString().toPersianDigit(),
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.w700
              ),
              textAlign: TextAlign.right),
          const SizedBox(width: 10,),
          const Text('حذاقل تعداد قابل سفارش :',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w700
              ),
              textAlign: TextAlign.right),
        ],
      ),
    );
  }

  Padding maxOrder() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(maxQty.toString().toPersianDigit(),
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.w700
              ),
              textAlign: TextAlign.right),
          const SizedBox(width: 10,),
          const Text('حذاکثر تعداد قابل سفارش :',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w700
              ),
              textAlign: TextAlign.right),
        ],
      ),
    );
  }
}
