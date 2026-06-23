package com.ute.techdash.ui.permisos

import android.net.Uri
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.PickVisualMediaRequest
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.ute.techdash.ui.multimedia.PantallaCamara
import com.ute.techdash.ui.multimedia.ReproductorVideo
import com.ute.techdash.ui.multimedia.VisorImagen
import com.ute.techdash.utils.PermisosHelper

// Usamos nombres únicos para evitar errores de "Redeclaration" con la carpeta ui/multimedia
sealed class MediaItemPermiso {
    data class Imagen(val uri: Uri) : MediaItemPermiso()
    data class Video(val uri: Uri)  : MediaItemPermiso()
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PantallaMultimediaPermisos() {
    val context = LocalContext.current

    var mostrarCamara   by remember { mutableStateOf(false) }
    var mediaSeleccionado by remember { mutableStateOf<MediaItemPermiso?>(null) }
    var galeriaItems    by remember { mutableStateOf<List<MediaItemPermiso>>(emptyList()) }

    var permisoCamara by remember {
        mutableStateOf(PermisosHelper.tienePermiso(context, android.Manifest.permission.CAMERA))
    }
    
    val launcherPermisoCamara = rememberLauncherForActivityResult(
        ActivityResultContracts.RequestPermission()
    ) { permisoCamara = it }

    val launcherImagen = rememberLauncherForActivityResult(
        ActivityResultContracts.PickMultipleVisualMedia(maxItems = 10)
    ) { uris ->
        galeriaItems = galeriaItems + uris.map { MediaItemPermiso.Imagen(it) }
    }

    val launcherVideo = rememberLauncherForActivityResult(
        ActivityResultContracts.PickVisualMedia()
    ) { uri ->
        uri?.let { galeriaItems = galeriaItems + MediaItemPermiso.Video(it) }
    }

    if (mostrarCamara) {
        // Resolvemos ambigüedad llamando a la versión específica de multimedia
        PantallaCamara(
            onFotoTomada = { uri: Uri ->
                galeriaItems = galeriaItems + MediaItemPermiso.Imagen(uri)
                mediaSeleccionado = MediaItemPermiso.Imagen(uri)
                mostrarCamara = false
            },
            onCerrar = { mostrarCamara = false }
        )
        return
    }

    Scaffold(
        topBar = {
            TopAppBar(title = { Text("Multimedia y Permisos", fontWeight = FontWeight.Bold) })
        }
    ) { padding ->
        Column(modifier = Modifier.padding(padding).fillMaxSize()) {
            Row(Modifier.fillMaxWidth().padding(16.dp), horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                Button(
                    onClick = { 
                        if (permisoCamara) mostrarCamara = true 
                        else launcherPermisoCamara.launch(android.Manifest.permission.CAMERA) 
                    },
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.CameraAlt, null)
                    Spacer(Modifier.width(4.dp))
                    Text("Cámara")
                }
                
                OutlinedButton(
                    onClick = { launcherImagen.launch(PickVisualMediaRequest(ActivityResultContracts.PickVisualMedia.ImageOnly)) },
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.PhotoLibrary, null)
                    Spacer(Modifier.width(4.dp))
                    Text("Galería")
                }

                OutlinedButton(
                    onClick = { launcherVideo.launch(PickVisualMediaRequest(ActivityResultContracts.PickVisualMedia.VideoOnly)) },
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.VideoLibrary, null)
                    Spacer(Modifier.width(4.dp))
                    Text("Video")
                }
            }

            AnimatedVisibility(visible = mediaSeleccionado != null) {
                Box(modifier = Modifier.fillMaxWidth().height(260.dp).padding(horizontal = 16.dp).clip(RoundedCornerShape(16.dp))) {
                    when (val item = mediaSeleccionado) {
                        is MediaItemPermiso.Imagen -> {
                            VisorImagen(uri = item.uri, modifier = Modifier.fillMaxSize())
                        }
                        is MediaItemPermiso.Video -> {
                            ReproductorVideo(uri = item.uri, modifier = Modifier.fillMaxSize())
                        }
                        null -> {}
                    }
                    IconButton(
                        onClick = { mediaSeleccionado = null },
                        modifier = Modifier.align(Alignment.TopEnd).padding(4.dp).size(36.dp).clip(CircleShape).background(Color.Black.copy(alpha = 0.5f))
                    ) {
                        Icon(Icons.Default.Close, "Cerrar", tint = Color.White)
                    }
                }
            }

            LazyVerticalGrid(
                columns = GridCells.Fixed(3),
                modifier = Modifier.fillMaxSize(),
                contentPadding = PaddingValues(16.dp),
                horizontalArrangement = Arrangement.spacedBy(4.dp),
                verticalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                items(galeriaItems) { item ->
                    Box(modifier = Modifier.aspectRatio(1f).clip(RoundedCornerShape(8.dp)).clickable { mediaSeleccionado = item }) {
                        when (item) {
                            is MediaItemPermiso.Imagen -> AsyncImage(model = item.uri, contentDescription = null, contentScale = ContentScale.Crop, modifier = Modifier.fillMaxSize())
                            is MediaItemPermiso.Video -> Box(Modifier.fillMaxSize().background(Color.Black), contentAlignment = Alignment.Center) {
                                Icon(Icons.Default.PlayCircle, null, tint = Color.White, modifier = Modifier.size(40.dp))
                            }
                        }
                    }
                }
            }
        }
    }
}
