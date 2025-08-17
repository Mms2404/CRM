import 'package:crm_app/core/constants/appButtonStyles.dart';
import 'package:crm_app/core/constants/appColors.dart';
import 'package:crm_app/features/customers/domain/customer.dart';
import 'package:crm_app/features/customers/domain/order.dart';
import 'package:crm_app/features/customers/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewDialog extends StatelessWidget {
  final Customer customer;
  const ViewDialog({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    final firestoreService = context.read<AppFirestoreService>();

    return AlertDialog(
      title: Text("Customer Details"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${customer.name}"),
            Text("Email: ${customer.email}"),
            Text("Phone: ${customer.phone}"),
            Text("Company: ${customer.company}"),
            Text("Created At: ${customer.createdAt.toLocal().toString().split(" ")[0]}"),
            const SizedBox(height: 20),

            // Orders Section
            Text("Orders", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            StreamBuilder<List<AppOrder>>(
              stream: firestoreService.getOrdersForCustomer(customer.id),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Error fetching orders");
                }
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(color: Appcolors.milkyGreen),
                  );
                }
                final orders = snapshot.data!;
                if (orders.isEmpty) {
                  return Text("No orders placed yet.");
                }
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      return ListTile(
                        title: Text(order.orderTitle),
                        subtitle: Text("Amount: ₹${order.orderAmount}"),
                        trailing: Text(order.orderDate.toLocal().toString().split(" ")[0]),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          style: AppButtonStyles.commonButton,
          onPressed: () => Navigator.pop(context),
          child: Text("CLOSE"),
        ),
      ],
    );
  }
}
