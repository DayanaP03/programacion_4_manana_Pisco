package com.shopapp.domain.repository

<<<<<<< HEAD
import com.shopapp.domain.model.Product
import com.shopapp.domain.model.ProductFilters
import com.shopapp.domain.model.ProductPayload
import android.net.Uri
=======
import android.net.Uri
import com.shopapp.domain.model.Product
import com.shopapp.domain.model.ProductFilters
import com.shopapp.domain.model.ProductPayload
>>>>>>> 4968d0b (avatar)

interface ProductRepository {
    suspend fun getProducts(filters: ProductFilters): Result<Pair<List<Product>, Int>>
    suspend fun getProduct(id: Int): Result<Product>
    suspend fun createProduct(payload: ProductPayload): Result<Product>
    suspend fun updateProduct(id: Int, payload: ProductPayload): Result<Product>
    suspend fun deleteProduct(id: Int): Result<Unit>
    suspend fun restock(id: Int, quantity: Int): Result<Int>
    suspend fun getStats(): Result<Map<String, Any>>

<<<<<<< HEAD
=======
    /** Sube una imagen para el producto indicado. Devuelve la URL absoluta resultante. */
>>>>>>> 4968d0b (avatar)
    suspend fun uploadProductImage(id: Int, uri: Uri): Result<String>
}