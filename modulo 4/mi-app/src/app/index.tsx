// app/index.tsx
import { StyleSheet, View } from 'react-native'
import { Paso3mp } from './paso3_mp'

export default function IndexScreen() {
  return (
    <View style={styles.screen}>
      <Paso3mp />
    </View>
  )
}

const styles = StyleSheet.create({
  screen: {
    flex: 1,
    backgroundColor: '#0a0a0a',
  },
})