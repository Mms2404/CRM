import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crm_app/features/customers/domain/customer.dart';
import 'package:crm_app/features/customers/domain/order.dart';

class AppFirestoreService {
  final _db = FirebaseFirestore.instance;

  /// -------------------- CUSTOMERS --------------------

  // Add Customer
  Future<void> addCustomer(Customer customer) async {
    final docRef = _db.collection("customers").doc(); // generate Firestore ID
    customer.id = docRef.id; // assign Firestore ID
    await docRef.set({
      "id": customer.id,
      "name": customer.name,
      "email": customer.email,
      "phone": customer.phone,
      "company": customer.company,
      "created_at": Timestamp.now(),
    });
  }

  // Get Customers (Stream as List<Customer>)
  Stream<List<Customer>> getCustomers() {
    return _db.collection("customers").snapshots().map(
          (snapshot) =>
              snapshot.docs.map((doc) => Customer.fromDoc(doc)).toList(),
        );
  }

  // Update Customer
  Future<void> updateCustomer(Customer customer) async {
    await _db.collection("customers").doc(customer.id).update({
      "name": customer.name,
      "email": customer.email,
      "phone": customer.phone,
      "company": customer.company,
      // do NOT update id or created_at
    });
  }

  // Delete Customer
  Future<void> deleteCustomer(String id) async {
    await _db.collection("customers").doc(id).delete();
  }

  /// -------------------- ORDERS --------------------

  // Add Order for a Customer
  Future<void> addOrder(String customerId, AppOrder order) async {
    final docRef = _db.collection("orders").doc(); // generate order ID

    final customerRef = _db.collection("customers").doc(customerId);

    await docRef.set({
      "id": docRef.id,
      "customer_id": customerRef, // PK–FK as DocumentReference
      "order_title": order.orderTitle,
      "order_amount": order.orderAmount,
      "order_date": Timestamp.fromDate(order.orderDate),
    });
  }

  // Get Orders for a Customer
  // Needs composite indexing
 //Composite index: Needed when combining multiple conditions, especially with where + orderBy, or multiple where clauses.
  Stream<List<AppOrder>> getOrdersForCustomer(String customerId) {
    final customerRef = _db.collection("customers").doc(customerId);

    return _db
        .collection("orders")
        .where("customer_id", isEqualTo: customerRef) // 🔹 match ref
        .orderBy("order_date", descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => AppOrder.fromDoc(doc)).toList(),
        );
  }

  // Delete an Order
  Future<void> deleteOrder(String orderId) async {
    await _db.collection("orders").doc(orderId).delete();
  }
}
