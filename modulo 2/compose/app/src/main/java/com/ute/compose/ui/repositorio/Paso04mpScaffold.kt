package com.ute.compose.ui.repositorio



import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

data class Reserva(
    val id: Int,
    val cliente: String,
    val habitacion: String,
    val favorito: Boolean
)

val reservasDeHotel = listOf(

    Reserva(
        1,
        "Dayana",
        "Suite",
        true
    ),

    Reserva(
        2,
        "Carlos",
        "Doble",
        false
    ),

    Reserva(
        3,
        "Ana",
        "Simple",
        true
    )
)

@Composable
fun TarjetaReserva(
    reserva: Reserva,
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
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )

            Spacer(modifier = Modifier.height(4.dp))

            Text(
                text = "Habitación: ${reserva.habitacion}"
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

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun Paso04ScaffoldScreen() {

    var reservas by remember {
        mutableStateOf(reservasDeHotel)
    }

    var busqueda by remember {
        mutableStateOf("")
    }

    var filtro by remember {
        mutableStateOf("Todos")
    }

    var mostrarFab by remember {
        mutableStateOf(false)
    }

    val reservasFiltradas = reservas
        .filter {

            if (filtro == "Favoritos")
                it.favorito
            else
                true
        }

        .filter {

            busqueda.isBlank() ||

                    it.cliente.contains(
                        busqueda,
                        ignoreCase = true
                    )
        }

    Scaffold(

        topBar = {

            TopAppBar(

                title = {

                    Text(
                        text =
                            "Reservas (${reservas.size})",

                        fontWeight = FontWeight.Bold
                    )
                },

                actions = {

                    IconButton(

                        onClick = {

                            filtro =

                                if (filtro == "Favoritos")
                                    "Todos"
                                else
                                    "Favoritos"
                        }
                    ) {

                        Icon(

                            imageVector =

                                if (filtro == "Favoritos")
                                    Icons.Default.Favorite
                                else
                                    Icons.Default.FavoriteBorder,

                            contentDescription = null,

                            tint =

                                if (filtro == "Favoritos")
                                    MaterialTheme.colorScheme.error
                                else
                                    MaterialTheme.colorScheme.onSurface
                        )
                    }
                },

                colors = TopAppBarDefaults.topAppBarColors(

                    containerColor =
                        MaterialTheme.colorScheme.primaryContainer,

                    titleContentColor =
                        MaterialTheme.colorScheme.onPrimaryContainer
                )
            )
        },

        floatingActionButton = {

            FloatingActionButton(

                onClick = {
                    mostrarFab = true
                }
            ) {

                Icon(
                    Icons.Default.Add,
                    contentDescription = null
                )
            }
        }

    ) { paddingValues ->

        Column(

            modifier = Modifier
                .padding(paddingValues)
                .fillMaxSize()
        ) {

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
                    .padding(
                        horizontal = 16.dp,
                        vertical = 8.dp
                    )
            )

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

            Spacer(
                modifier = Modifier.height(4.dp)
            )

            LazyColumn(

                contentPadding = PaddingValues(
                    horizontal = 16.dp,
                    vertical = 8.dp
                ),

                verticalArrangement =
                    Arrangement.spacedBy(8.dp)
            ) {

                item {

                    Text(
                        text =
                            "${reservasFiltradas.size} resultado(s)"
                    )
                }

                items(
                    reservasFiltradas,
                    key = { it.id }
                ) { reserva ->

                    TarjetaReserva(

                        reserva = reserva,

                        onFavorito = {

                            reservas =
                                reservas.map {

                                    if (it.id == reserva.id)

                                        it.copy(
                                            favorito =
                                                !it.favorito
                                        )

                                    else
                                        it
                                }
                        }
                    )
                }

                item {

                    Spacer(
                        modifier = Modifier.height(80.dp)
                    )
                }
            }
        }
    }

    if (mostrarFab) {

        AlertDialog(

            onDismissRequest = {
                mostrarFab = false
            },

            title = {
                Text("Nueva Reserva")
            },

            text = {
                Text(
                    "Aquí se agregará una nueva reserva."
                )
            },

            confirmButton = {

                TextButton(

                    onClick = {
                        mostrarFab = false
                    }
                ) {

                    Text("OK")
                }
            }
        )
    }
}

@Preview(showBackground = true)
@Composable
fun Paso04Preview() {

    MaterialTheme {

        Paso04ScaffoldScreen()
    }
}