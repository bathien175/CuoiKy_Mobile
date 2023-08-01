import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homelyn/components/c_elevated_button.dart';
import 'package:homelyn/config/constants.dart';

class RoomAndGuests extends StatefulWidget {
  const RoomAndGuests({super.key});

  @override
  State<RoomAndGuests> createState() => _RoomAndGuestsState();
}

class _RoomAndGuestsState extends State<RoomAndGuests> {
  int total1=0;
   int total2=0;
    int total3=0;
  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: REdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      child: ListView(
        children: [
          Divider(
              color: Theme.of(context).dividerColor,
              thickness: 6,
              height: 6.h,
              endIndent: 120.w,
              indent: 120.w,
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                                'Room and Guests',
                                // ignore: deprecated_member_use
                                style: Theme.of(context).textTheme.headline2,
                                
                              ),
                             InkWell(
                      onTap: () {
            Navigator.pop(context);
          },
                            child: Icon(
                                  Icons.close,
                                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                                 
                                ),
                          ), 
              ],
            ),
             SizedBox(
              height: 30.h,
            ),
            ListTile(
              contentPadding: REdgeInsets.all(0),
              title:  Text(
                                'Room',
                                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                  fontWeight: FontWeight.w500
                                ),
                                
                              ),
                            subtitle: Text(
                                'Minimum contains 4 people',
                                style: Theme.of(context).textTheme.bodyMedium
                                
                              ), 
                              trailing: SizedBox(
                                width: 80.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                       onTap: (){
                                        total1 > 0 ? total1-- : total1;
                                        setState(() {
                                           
                                        });
                                       },
                                      child: Container(
                                        padding: REdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context).brightness== Brightness.light?
                                          const Color(0xFFE7E7E7) : const Color(0xFF636777)
                                        ),
                                        child:  Icon(
                                      Icons.remove,
                                      color: Theme.of(context).appBarTheme.iconTheme!.color,
                                                                       size: 13,
                                                                      ),
                                      ),
                                    ),
                                    Text(
                                total1.toString(),
                                style: Theme.of(context).textTheme.titleMedium
                                
                              ),
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                           total1++;
                                        });
                                       
                                      },
                                      child: Container(
                                        padding: REdgeInsets.all(5),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:  kBlueColor
                                        ),
                                        child:  const Icon(
                                      Icons.add,
                                      color: kWhiteColor,
                                                                       size: 13,
                                                                      ),
                                      ),
                                    )
                                  ],
                                ),
                              ), 
            ),
            const Divider(),
             ListTile(
              contentPadding: REdgeInsets.all(0),
              title:  Text(
                                'Adults',
                                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                  fontWeight: FontWeight.w500
                                ),
                                
                              ),
                            subtitle: Text(
                                'Age 15+',
                                style: Theme.of(context).textTheme.bodyMedium
                                
                              ), 
                              trailing: SizedBox(
                                width: 80.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                       onTap: (){
                                        total2 > 0 ? total2-- : total2;
                                        setState(() {
                                           
                                        });
                                       },
                                      child: Container(
                                        padding: REdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context).brightness== Brightness.light?
                                          const Color(0xFFE7E7E7) : const Color(0xFF636777)
                                        ),
                                        child:  Icon(
                                      Icons.remove,
                                      color: Theme.of(context).appBarTheme.iconTheme!.color,
                                                                       size: 13,
                                                                      ),
                                      ),
                                    ),
                                    Text(
                                total2.toString(),
                                style: Theme.of(context).textTheme.titleMedium
                                
                              ),
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                           total2++;
                                        });
                                       
                                      },
                                      child: Container(
                                        padding: REdgeInsets.all(5),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:  kBlueColor
                                        ),
                                        child:  const Icon(
                                      Icons.add,
                                      color: kWhiteColor,
                                                                       size: 13,
                                                                      ),
                                      ),
                                    )
                                  ],
                                ),
                              ), 
            ),
            const Divider(),
             ListTile(
              contentPadding: REdgeInsets.all(0),
              title:  Text(
                                'Childern',
                                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                  fontWeight: FontWeight.w500
                                ),
                                
                              ),
                            subtitle: Text(
                                'Age 2 - 12',
                                style: Theme.of(context).textTheme.bodyMedium
                                
                              ), 
                              trailing: SizedBox(
                                width: 80.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                       onTap: (){
                                        total3 > 0 ? total3-- : total3;
                                        setState(() {
                                           
                                        });
                                       },
                                      child: Container(
                                        padding: REdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context).brightness== Brightness.light?
                                          const Color(0xFFE7E7E7) : const Color(0xFF636777)
                                        ),
                                        child:  Icon(
                                      Icons.remove,
                                      color: Theme.of(context).appBarTheme.iconTheme!.color,
                                                                       size: 13,
                                                                      ),
                                      ),
                                    ),
                                    Text(
                                total3.toString(),
                                style: Theme.of(context).textTheme.titleMedium
                                
                              ),
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                           total3++;
                                        });
                                       
                                      },
                                      child: Container(
                                        padding: REdgeInsets.all(5),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kBlueColor
                                        ),
                                        child:  const Icon(
                                      Icons.add,
                                      color: kWhiteColor,
                                                                       size: 13,
                                                                      ),
                                      ),
                                    )
                                  ],
                                ),
                              ), 
            ),
            SizedBox(
              height: 40.h,
            ),
            CElevatedButton(
              child: const Text('Save'),
             onPressed: (){}
             ),
            SizedBox(
              height: 40.h,
            ),
        ],
      ),
    );
  }
}