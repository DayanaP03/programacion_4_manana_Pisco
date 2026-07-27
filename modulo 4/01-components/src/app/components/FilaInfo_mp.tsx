import React from 'react'
import { StyleSheet, Text, View } from 'react-native'

interface FilaInfoProps {
  etiqueta: string
  valor: string
}

export function FilaInfomp({ etiqueta, valor }: FilaInfoProps) {
  return (
    <View style={estilos2.fila}>
      <Text style={estilos2.etiqueta}>{etiqueta}</Text>
      <Text style={estilos2.valor}>{valor}</Text>
    </View>
  )
}

export default FilaInfomp

const estilos2 = StyleSheet.create({
  fila: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingVertical: 4,
  },
  etiqueta: {
    fontSize: 13,
    color: '#9e9e9e',
    fontWeight: '500',
  },
  valor: {
    fontSize: 13,
    color: '#ffffff',
    fontFamily: 'monospace',
  },
})