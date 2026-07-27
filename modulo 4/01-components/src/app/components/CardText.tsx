import { ReactNode } from 'react'
import { StyleSheet, Text, View } from 'react-native'

interface CardProps {
  children: ReactNode       // cualquier JSX válido
  titulo: string
  subtitulo?: string
}

export function Card({ titulo, subtitulo, children }: CardProps) {
  return (
    <View style={stylesCard.card}>
      <Text style={stylesCard.cardTitulo}>{titulo}</Text>
      {subtitulo ? <Text style={stylesCard.cardSubtitulo}>{subtitulo}</Text> : null}
      {children}
    </View>
  )
}

const stylesCard = StyleSheet.create({
  card: {
    backgroundColor: '#ffffff',
    borderRadius: 12,
    padding: 16,
    shadowColor: '#000',
    shadowOpacity: 0.07,
    shadowRadius: 6,
    shadowOffset: { width: 0, height: 2 },
    elevation: 3,
    marginBottom: 16,
  },
  cardCabecera: {
    backgroundColor: '#1565c0',
    paddingHorizontal: 16,
    paddingVertical: 12,
    gap: 2,
  },
  cardTitulo: {
    fontSize: 16,
    fontWeight: '700',
    color: '#1a237e',
  },
  cardSubtitulo: {
    fontSize: 12,
    color: '#546e7a',
  },
  cardCuerpo: {
    padding: 12,
    gap: 8,
  },
})