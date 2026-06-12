package com.shopapp.domain.model

data class AuthTokens(
    val access: String,
    val refresh: String,
)

data class LoggedUser(
    val id: Int,
    val username: String,
    val email: String,
    val isStaff: Boolean,
<<<<<<< HEAD
=======
    val avatarUrl: String? = null,
>>>>>>> 4968d0b (avatar)
)