import 'package:crm_app/core/constants/appColors.dart';
import 'package:crm_app/core/routes/app_routes.dart';
import 'package:crm_app/features/customers/firestore_service.dart';
import 'package:crm_app/features/view-only/widgets/viewDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewonlyScreen extends StatelessWidget {
  ViewonlyScreen({super.key });

  @override
  Widget build(BuildContext context) {
    final firestoreService = context.read<AppFirestoreService>();
    return Scaffold(
      backgroundColor: Appcolors.day,
      appBar: AppBar(
        backgroundColor: Appcolors.milkyGreen,
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, AppRoutes.signIn);
          }, 
          icon: Icon(Icons.arrow_back_ios_new_sharp)),
          title: Text("ALL CUSTOMERS"),
      ),
      body: StreamBuilder(
        stream: firestoreService.getCustomers(), 
        builder: (context , snapshot){

          if(snapshot.hasError){
            print(snapshot.error);
            return Center(
              child: Text("ERROR FETCHING CUSTOMERS"),
            );
          }

          if (!snapshot.hasData){
            return Center(child: CircularProgressIndicator(color: Appcolors.night,),);
          }

          final customers = snapshot.data!;
          if(customers.isEmpty){
            return Center(
              child: Text("NO CUSTOMERS YET !"),
            );
          }

          return ListView.builder(
            itemCount: customers.length,
            itemBuilder: (context , index){
              final customer = customers[index];
              return Card(
                color: Appcolors.day,
                elevation: 3,
                child: ListTile(
                  title: Text(customer.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(),
                      Text("Email      : ${customer.email}"),
                      Text("Phone No.  : ${customer.phone}" , style: TextStyle(color: Appcolors.milkyGreen),),
                      Text("Created on : ${customer.createdAt.toLocal().toString().split(" ")[0]}")
                    ],
                  ),
                  onTap: (){
                    showDialog(
                      context: context, 
                      builder: (_) => ViewDialog(customer: customer));
                  },
                ),
              );
            });
        })

    );
  }
}