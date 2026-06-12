package com.shopapp.data.remote.api

import com.shopapp.data.remote.dto.*
<<<<<<< HEAD
import retrofit2.Response
import retrofit2.http.*
import okhttp3.MultipartBody
interface UserApi {
    @GET("users/")
    suspend fun getUsers(
        @Query("search")    search:   String?  = null,
        @Query("is_staff")  isStaff:  Boolean? = null,
        @Query("is_active") isActive: Boolean? = null,
        @Query("page")      page:     Int?     = null,
=======
import okhttp3.MultipartBody
import retrofit2.Response
import retrofit2.http.*

interface UserApi {
    @GET("users/")
    suspend fun getUsers(
        @Query("search")    search:   String?,
        @Query("is_staff")  isStaff:  Boolean?,
        @Query("is_active") isActive: Boolean?,
        @Query("page")      page:     Int?,
>>>>>>> 4968d0b (avatar)
    ): Response<PaginatedDto<UserDto>>

    @GET("users/{id}/")
    suspend fun getUser(@Path("id") id: Int): Response<UserDto>

    @POST("users/")
    suspend fun createUser(@Body body: UserRequestDto): Response<UserDto>

    @PATCH("users/{id}/")
    suspend fun updateUser(
        @Path("id") id: Int,
        @Body body: UserRequestDto,
    ): Response<UserDto>

    @DELETE("users/{id}/")
    suspend fun deleteUser(@Path("id") id: Int): Response<Unit>

<<<<<<< HEAD
    @POST("users/{id}/toggle-active/")
=======
    @POST("users/{id}/toggle_active/")
>>>>>>> 4968d0b (avatar)
    suspend fun toggleActive(@Path("id") id: Int): Response<ToggleActiveResponseDto>

    @GET("users/profile/")
    suspend fun getProfile(): Response<UserDto>

<<<<<<< HEAD
    @GET("users/stats/")
    suspend fun getStats(): Response<UserStatsDto>

=======
    /**
     * Sube o reemplaza el avatar del usuario autenticado.
     * Backend: PATCH /api/users/profile/  multipart/form-data campo "avatar"
     */
>>>>>>> 4968d0b (avatar)
    @Multipart
    @PATCH("users/profile/")
    suspend fun uploadAvatar(
        @Part avatar: MultipartBody.Part,
    ): Response<UserDto>
<<<<<<< HEAD
=======

    @GET("users/stats/")
    suspend fun getStats(): Response<UserStatsDto>
>>>>>>> 4968d0b (avatar)
}