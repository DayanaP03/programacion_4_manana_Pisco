package com.shopapp.domain.repository
<<<<<<< HEAD
import com.shopapp.domain.model.User
import com.shopapp.domain.model.UserPayload
import android.net.Uri
=======

import android.net.Uri
import com.shopapp.domain.model.User
import com.shopapp.domain.model.UserPayload

>>>>>>> 4968d0b (avatar)
interface UserRepository {
    suspend fun getUsers(
        search:   String?  = null,
        isStaff:  Boolean? = null,
        isActive: Boolean? = null,
        page:     Int?     = null,
    ): Result<Pair<List<User>, Int>>
    suspend fun getUser(id: Int): Result<User>
    suspend fun createUser(payload: UserPayload): Result<User>
    suspend fun updateUser(id: Int, payload: UserPayload): Result<User>
    suspend fun deleteUser(id: Int): Result<Unit>
    suspend fun toggleActive(id: Int): Result<Boolean>
    suspend fun getStats(): Result<Map<String, Int>>

<<<<<<< HEAD
=======
    /** Obtiene el perfil del usuario autenticado. */
    suspend fun getProfile(): Result<User>

    /** Sube o reemplaza el avatar. Devuelve la URL absoluta resultante. */
>>>>>>> 4968d0b (avatar)
    suspend fun uploadAvatar(uri: Uri): Result<String>
}