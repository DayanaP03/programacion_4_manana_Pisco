package com.shopapp.data.repository

<<<<<<< HEAD
=======
import android.content.Context
import android.net.Uri
>>>>>>> 4968d0b (avatar)
import com.shopapp.data.remote.api.ProductApi
import com.shopapp.data.remote.dto.RestockRequestDto
import com.shopapp.data.remote.dto.toDomain
import com.shopapp.data.remote.dto.toRequest
<<<<<<< HEAD
=======
import com.shopapp.data.util.toMultipart
>>>>>>> 4968d0b (avatar)
import com.shopapp.domain.model.Product
import com.shopapp.domain.model.ProductFilters
import com.shopapp.domain.model.ProductPayload
import com.shopapp.domain.repository.ProductRepository
<<<<<<< HEAD
import javax.inject.Inject
import javax.inject.Singleton

import android.content.Context
import android.net.Uri


import dagger.hilt.android.qualifiers.ApplicationContext
import okhttp3.MediaType.Companion.toMediaTypeOrNull
import okhttp3.MultipartBody
import okhttp3.RequestBody.Companion.toRequestBody

=======
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
>>>>>>> 4968d0b (avatar)
class ProductRepositoryImpl @Inject constructor(
    private val api: ProductApi,
    @ApplicationContext private val context: Context,
) : ProductRepository {

    override suspend fun getProducts(filters: ProductFilters): Result<Pair<List<Product>, Int>> =
        runCatching {
            val params = buildMap<String, String> {
<<<<<<< HEAD
                filters.search?.let { put("search", it) }
                filters.category?.let { put("category", it.toString()) }
=======
                filters.search?.let   { put("search",    it) }
                filters.category?.let { put("category",  it.toString()) }
>>>>>>> 4968d0b (avatar)
                filters.priceMin?.let { put("price_min", it.toString()) }
                filters.priceMax?.let { put("price_max", it.toString()) }
                filters.stockMin?.let { put("stock_min", it.toString()) }
                filters.isActive?.let { put("is_active", it.toString()) }
<<<<<<< HEAD
                filters.ordering?.let { put("ordering", it) }
                put("page", filters.page.toString())
=======
                filters.ordering?.let { put("ordering",  it) }
                put("page",      filters.page.toString())
>>>>>>> 4968d0b (avatar)
                put("page_size", filters.pageSize.toString())
            }
            val response = api.getProducts(params)
            if (response.isSuccessful) {
                val body = response.body()!!
                Pair(body.results.map { it.toDomain() }, body.count)
            } else error("Error ${response.code()}")
        }

    override suspend fun getProduct(id: Int): Result<Product> = runCatching {
        val response = api.getProduct(id)
        if (response.isSuccessful) response.body()!!.toDomain()
        else error("Error ${response.code()}")
    }

    override suspend fun createProduct(payload: ProductPayload): Result<Product> = runCatching {
        val response = api.createProduct(payload.toRequest())
        if (response.isSuccessful) response.body()!!.toDomain()
        else error("Error ${response.code()}: ${response.errorBody()?.string()}")
    }

    override suspend fun updateProduct(id: Int, payload: ProductPayload): Result<Product> =
        runCatching {
            val response = api.updateProduct(id, payload.toRequest())
            if (response.isSuccessful) response.body()!!.toDomain()
            else error("Error ${response.code()}: ${response.errorBody()?.string()}")
        }

    override suspend fun deleteProduct(id: Int): Result<Unit> = runCatching {
        val response = api.deleteProduct(id)
        if (!response.isSuccessful) error("Error ${response.code()}")
    }

    override suspend fun restock(id: Int, quantity: Int): Result<Int> = runCatching {
        val response = api.restock(id, RestockRequestDto(quantity))
        if (response.isSuccessful) response.body()!!.newStock
        else error("Error ${response.code()}")
    }

<<<<<<< HEAD

=======
>>>>>>> 4968d0b (avatar)
    override suspend fun getStats(): Result<Map<String, Any>> = runCatching {
        val response = api.getStats()
        if (response.isSuccessful) {
            val s = response.body()!!
            mapOf(
<<<<<<< HEAD
                "total_active" to s.totalActive,
                "total_inactive" to s.totalInactive,
                "avg_price" to (s.avgPrice ?: 0.0),
                "total_stock" to (s.totalStock ?: 0),
                "out_of_stock" to s.outOfStock,
=======
                "total_active"   to s.totalActive,
                "total_inactive" to s.totalInactive,
                "avg_price"      to (s.avgPrice ?: 0.0),
                "total_stock"    to (s.totalStock ?: 0),
                "out_of_stock"   to s.outOfStock,
>>>>>>> 4968d0b (avatar)
            )
        } else error("Error ${response.code()}")
    }

    override suspend fun uploadProductImage(id: Int, uri: Uri): Result<String> =
        runCatching {
<<<<<<< HEAD

            val part = uri.toMultipart(context, fieldName = "image")
=======
            val part     = uri.toMultipart(context, fieldName = "image")
>>>>>>> 4968d0b (avatar)
            val response = api.uploadProductImage(id, part)
            if (response.isSuccessful) {
                response.body()?.imageUrl ?: error("El servidor no devolvió una URL de imagen")
            } else {
                error(response.errorBody()?.string() ?: "Error ${response.code()}")
            }
        }
<<<<<<< HEAD

}
    internal fun Uri.toMultipart(context: Context, fieldName: String): MultipartBody.Part {
        val resolver = context.contentResolver
        val mimeType = resolver.getType(this) ?: "image/jpeg"
        val bytes = resolver.openInputStream(this)?.readBytes()
            ?: error("No se pudo leer el archivo seleccionado")
        val requestBody = bytes.toRequestBody(mimeType.toMediaTypeOrNull())
        val fileName = "upload.${mimeType.substringAfterLast('/')}"
        return MultipartBody.Part.createFormData(fieldName, fileName, requestBody)
    }
=======
}
>>>>>>> 4968d0b (avatar)
