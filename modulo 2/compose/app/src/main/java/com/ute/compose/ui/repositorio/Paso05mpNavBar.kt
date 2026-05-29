package com.ute.compose.ui.repositorio

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

data class ReservaHotel1(
    val id: Int,
    val cliente: String,
    val habitacion: String,
    val favorito: Boolean
)

val reservasHotel1 = listOf(

    ReservaHotel1(
        1,
        "Dayana",
        "Suite",
        favorito = true
    ),

    ReservaHotel1(
        2,
        "Carlos",
        "Doble",
        false
    ),

    ReservaHotel1(
        3,
        "Ana",
        "Simple",
        true,

    )
)

data class DestinoNav(

    val ruta: String,
    val etiqueta: String,
    val iconoActivo: ImageVector,
    val iconoInactivo: ImageVector
)

@Composable
fun TarjetaReserva1(
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
fun Paso05mpNavBarScreen() {

    var destinoActual by remember {
        mutableStateOf("reservas")
    }

    var reservas by remember {
        mutableStateOf(reservasHotel)
    }

    val destinos = listOf(

        DestinoNav(
            "reservas",
            "Reservas",
            Icons.Filled.Hotel,
            Icons.Outlined.Hotel
        ),

        DestinoNav(
            "favoritos",
            "Favoritos",
            Icons.Filled.Favorite,
            Icons.Outlined.FavoriteBorder
        ),

        DestinoNav(
            "perfil",
            "Perfil",
            Icons.Filled.AccountCircle,
            Icons.Outlined.AccountCircle
        )
    )

    Scaffold(

        topBar = {

            TopAppBar(

                title = {

                    Text(
                        text = "Hotel",
                        fontWeight = FontWeight.Bold
                    )
                },

                colors =
                    TopAppBarDefaults.topAppBarColors(

                        containerColor =
                            MaterialTheme.colorScheme.primaryContainer,

                        titleContentColor =
                            MaterialTheme.colorScheme.onPrimaryContainer
                    )
            )
        },

        bottomBar = {

            NavigationBar {

                destinos.forEach { destino ->

                    val seleccionado =
                        destinoActual == destino.ruta

                    NavigationBarItem(

                        selected = seleccionado,

                        onClick = {
                            destinoActual = destino.ruta
                        },

                        icon = {

                            Icon(

                                imageVector =

                                    if (seleccionado)
                                        destino.iconoActivo
                                    else
                                        destino.iconoInactivo,

                                contentDescription =
                                    destino.etiqueta
                            )
                        },

                        label = {
                            Text(destino.etiqueta)
                        }
                    )
                }
            }
        },

        floatingActionButton = {

            if (destinoActual == "reservas") {

                FloatingActionButton(

                    onClick = {}
                ) {

                    Icon(
                        Icons.Default.Add,
                        contentDescription = null
                    )
                }
            }
        }

    ) { paddingValues ->

        when (destinoActual) {

            "reservas" -> {

                PantallaReservasContent(

                    reservas = reservas,

                    onFavorito = { id ->

                        reservas =
                            reservas.map {

                                if (it.id == id)

                                    it.copy(
                                        favorito =
                                            !it.favorito
                                    )

                                else
                                    it
                            }
                    },

                    modifier =
                        Modifier.padding(paddingValues)
                )
            }

            "favoritos" -> {

                PantallaFavoritosContent(

                    favoritos =
                        reservas.filter {
                            it.favorito
                        },

                    modifier =
                        Modifier.padding(paddingValues)
                )
            }

            "perfil" -> {

                PantallaPerfilContent(

                    modifier =
                        Modifier.padding(paddingValues)
                )
            }
        }
    }
}

@Composable
fun PantallaReservasContent(

    reservas: List<ReservaHotel>,

    onFavorito: (Int) -> Unit,

    modifier: Modifier = Modifier
) {

    LazyColumn(

        modifier = modifier,

        contentPadding =
            PaddingValues(16.dp),

        verticalArrangement =
            Arrangement.spacedBy(8.dp)
    ) {

        items(

            reservas,
            key = { it.id }

        ) { reserva ->

            TarjetaReserva(

                reserva = reserva,

                onFavorito = {
                    onFavorito(reserva.id)
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

@Composable
fun PantallaFavoritosContent(

    favoritos: List<ReservaHotel>,

    modifier: Modifier = Modifier
) {

    if (favoritos.isEmpty()) {

        Box(

            modifier = modifier.fillMaxSize(),

            contentAlignment = Alignment.Center
        ) {

            Column(

                horizontalAlignment =
                    Alignment.CenterHorizontally
            ) {

                Icon(
                    Icons.Default.FavoriteBorder,
                    contentDescription = null,
                    modifier = Modifier.size(56.dp)
                )

                Spacer(
                    modifier = Modifier.height(12.dp)
                )

                Text(
                    text = "Sin favoritos"
                )
            }
        }
    }

    else {

        LazyColumn(

            modifier = modifier,

            contentPadding =
                PaddingValues(16.dp),

            verticalArrangement =
                Arrangement.spacedBy(8.dp)
        ) {

            items(

                favoritos,
                key = { it.id }

            ) { reserva ->

                TarjetaReserva(
                    reserva = reserva
                )
            }
        }
    }
}

@Composable
fun PantallaPerfilContent(
    modifier: Modifier = Modifier
) {

    Box(

        modifier = modifier.fillMaxSize(),

        contentAlignment = Alignment.Center
    ) {

        Column(

            horizontalAlignment =
                Alignment.CenterHorizontally
        ) {

            Icon(
                Icons.Default.AccountCircle,
                contentDescription = null,
                modifier = Modifier.size(80.dp)
            )

            Spacer(
                modifier = Modifier.height(12.dp)
            )

            Text(
                text = "Mi Perfil",
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold
            )

            Text(
                text = "Sistema de Reservas Hotel"
            )
        }
    }
}

@Preview(showBackground = true)
@Composable
fun Paso05Preview() {

    MaterialTheme {

        Paso05mpNavBarScreen()
    }
}