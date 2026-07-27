// app/components/Paso2.tsx
import React from 'react'
import { Alert, Image, Pressable, StyleSheet, Text, View } from 'react-native'

export function Paso2mp() {
  return (
    <View style={styles.contenedor}>
      <Image
        source={{ uri: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=200&auto=format&fit=crop&q=80' }}
        style={styles.logo}
      />
      <Text style={styles.titulo}>Reserva de Hotel</Text>

      <Pressable
        style={({ pressed }) => [
          styles.boton,
          pressed && styles.botonPresionado,
        ]}
        onPress={() => Alert.alert('Reservando', 'Confirmando tu habitación de lujo...')}
      >
        <Text style={styles.textoBoton}>Confirmar Reserva</Text>
      </Pressable>
    </View>
  )
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    gap: 16,
    backgroundColor: '#0a0a0a',
    padding: 24,
  },
  logo: {
    width: 80,
    height: 80,
    borderRadius: 40,
    borderWidth: 1,
    borderColor: '#ff007f',
  },
  titulo: {
    fontSize: 20,
    fontWeight: '600',
    color: '#ffffff',
  },
  boton: {
    backgroundColor: '#ff007f',
    paddingVertical: 12,
    paddingHorizontal: 24,
    borderRadius: 8,
  },
  botonPresionado: {
    backgroundColor: '#c50063',
  },
  textoBoton: {
    color: '#ffffff',
    fontWeight: '600',
    fontSize: 16,
  },
})