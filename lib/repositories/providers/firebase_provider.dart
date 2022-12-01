import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:products_crud/repositories/models/models.dart';

class FirebaseProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // get all products
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('products').get();

      final List<ProductModel> products = snapshot.docs.map((doc) {
        return ProductModel(
          id: doc.id,
          title: doc.data()['name'],
          category: doc.data()['category'],
          description: doc.data()['description'],
          price: doc.data()['price'],
          image: doc.data()['image'],
          rating: ProductModelRating(
            rate: 0,
            count: 0,
          ),
        );
      }).toList();

      return products;
    } catch (e) {
      rethrow;
    }
  }

  // get product by id
  Future<ProductModel> getProductById(String productId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('products').doc(productId).get();

      final ProductModel product = ProductModel(
        id: snapshot.id,
        title: snapshot.data()!['name'],
        category: snapshot.data()!['category'],
        description: snapshot.data()!['description'],
        price: snapshot.data()!['price'],
        image: snapshot.data()!['image'],
        rating: ProductModelRating(
          rate: 0,
          count: 0,
        ),
      );

      return product;
    } catch (e) {
      rethrow;
    }
  }

  // add product
  Future<void> addProduct(ProductModel product) async {
    try {
      await _firestore.collection('products').doc().set({
        'name': product.title,
        'category': product.category,
        'description': product.description,
        'price': product.price,
        'image': product.image,
      });
    } catch (e) {
      rethrow;
    }
  }

  // update product
  Future<void> updateProduct(ProductModel product) async {
    try {
      await _firestore.collection('products').doc(product.id).update({
        'name': product.title,
        'category': product.category,
        'description': product.description,
        'price': product.price,
        'image': product.image,
      });
    } catch (e) {
      rethrow;
    }
  }

  // delete product
  Future<void> deleteProduct(String productId) async {
    try {
      await _firestore.collection('products').doc(productId).delete();
    } catch (e) {
      rethrow;
    }
  }

  // upload image
  Future<String> uploadImage(File image) async {
    try {
      final String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}';
      final Reference ref = _storage.ref().child(fileName);
      final UploadTask uploadTask = ref.putFile(image);
      final TaskSnapshot snapshot = await uploadTask;
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      rethrow;
    }
  }
}
