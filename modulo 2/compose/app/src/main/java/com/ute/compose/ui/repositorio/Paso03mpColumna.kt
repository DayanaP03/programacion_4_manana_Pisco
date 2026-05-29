package com.ute.compose.ui.repositorio


import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

data class ReservaHotel(
    val id: Int,
    val cliente: String,
    val habitacion: String,
    val noches: Int,
    val favorito: Boolean
)

val reservasHotel = listOf(

    ReservaHotel(
        1,
        "Dayana",
        "Suite",
        3,
        true
    ),

    ReservaHotel(
        2,
        "Carlos",
        "Doble",
        2,
        false
    ),

    ReservaHotel(
        3,
        "Ana",
        "Simple",
        1,
        true
    )
)

@Composable
fun TarjetaReserva(
    reserva: ReservaHotel,
    onFavorito: () -> Unit = {}
) {

    ElevatedCard(
        modifier = Modifier.fillMaxWidth()
    ) {

        Column(
            modifier = Modifier.padding(16.dp)
        ) {

            Text(
                text = reserva.cliente,
                style = MaterialTheme.typography.titleMedium
            )

            Spacer(modifier = Modifier.height(4.dp))

            Text(
                text = "Habitación: ${reserva.habitacion}"
            )

            Text(
                text = "Noches: ${reserva.noches}"
            )

            Spacer(modifier = Modifier.height(8.dp))

            IconButton(
                onClick = onFavorito
            ) {

                Icon(
                    imageVector =
                        if (reserva.favorito)
                            Icons.Default.Favorite
                        else
                            Icons.Default.FavoriteBorder,

                    contentDescription = null,

                    tint =
                        if (reserva.favorito)
                            MaterialTheme.colorScheme.error
                        else
                            MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

@Composable
fun Paso03ColumnaScreen() {

    var reservas by remember {
        mutableStateOf(reservasHotel)
    }

    var busqueda by remember {
        mutableStateOf("")
    }

    var filtro by remember {
        mutableStateOf("Todos")
    }

    val reservasFiltradas = reservas
        .filter {

            when (filtro) {

                "Favoritos" -> it.favorito

                else -> true
            }
        }
        .filter {

            busqueda.isBlank() ||
                    it.cliente.contains(
                        busqueda,
                        ignoreCase = true
                    ) ||
                    it.habitacion.contains(
                        busqueda,
                        ignoreCase = true
                    )
        }

    Column(
        modifier = Modifier.fillMaxSize()
    ) {

        Text(
            text = "RESERVAS HOTEL",
            style = MaterialTheme.typography.titleLarge,
            modifier = Modifier.padding(16.dp)
        )

        OutlinedTextField(
            value = busqueda,

            onValueChange = {
                busqueda = it
            },

            placeholder = {
                Text("Buscar reserva")
            },

            leadingIcon = {
                Icon(
                    Icons.Default.Search,
                    contentDescription = null
                )
            },

            trailingIcon = {

                if (busqueda.isNotEmpty()) {

                    IconButton(
                        onClick = {
                            busqueda = ""
                        }
                    ) {

                        Icon(
                            Icons.Default.Clear,
                            contentDescription = null
                        )
                    }
                }
            },

            singleLine = true,

            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 16.dp)
        )

        Spacer(modifier = Modifier.height(8.dp))

        LazyRow(
            horizontalArrangement =
                Arrangement.spacedBy(8.dp),

            contentPadding =
                PaddingValues(horizontal = 16.dp)
        ) {

            items(
                listOf(
                    "Todos",
                    "Favoritos"
                )
            ) { opcion ->

                FilterChip(

                    selected = filtro == opcion,

                    onClick = {
                        filtro = opcion
                    },

                    label = {
                        Text(opcion)
                    }
                )
            }
        }

        Spacer(modifier = Modifier.height(8.dp))

        if (reservasFiltradas.isEmpty()) {

            Box(
                modifier = Modifier.fillMaxSize(),
                contentAlignment = Alignment.Center
            ) {

                Column(
                    horizontalAlignment =
                        Alignment.CenterHorizontally
                ) {

                    Icon(
                        Icons.Default.SearchOff,
                        contentDescription = null,
                        modifier = Modifier.size(56.dp)
                    )

                    Spacer(
                        modifier = Modifier.height(12.dp)
                    )

                    Text(
                        text = "Sin resultados"
                    )
                }
            }
        }

        else {

            LazyColumn(

                contentPadding =
                    PaddingValues(
                        horizontal = 16.dp,
                        vertical = 8.dp
                    ),

                verticalArrangement =
                    Arrangement.spacedBy(8.dp)
            ) {

                item {

                    Text(
                        text =
                            "${reservasFiltradas.size} reserva(s)"
                    )
                }

                items(
                    items = reservasFiltradas,
                    key = { it.id }
                ) { reserva ->

                    TarjetaReserva(

                        reserva = reserva,

                        onFavorito = {

                            reservas =
                                reservas.map {

                                    if (it.id == reserva.id) {

                                        it.copy(
                                            favorito =
                                                !it.favorito
                                        )
                                    }

                                    else {
                                        it
                                    }
                                }
                        }
                    )
                }

                item {
                    Spacer(
                        modifier = Modifier.height(16.dp)
                    )
                }
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun Paso03Preview() {

    MaterialTheme {

        Paso03ColumnaScreen()
    }
}