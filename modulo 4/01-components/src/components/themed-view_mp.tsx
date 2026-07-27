import { View, type ViewProps } from 'react-native';

import { ThemeColor } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';
import React from 'react';

export type ThemedViewProps = ViewProps & {
  lightColor?: string;
  darkColor?: string;
  type?: ThemeColor;
};

export function ThemedView({ style, lightColor, darkColor, type, ...otherProps }: ThemedViewProps) {
  const theme = useTheme();

  return (
    <View 
      style={[
        { 
          backgroundColor: theme[type ?? 'background'],
          // Reforzando el aspecto estético oscuro con bordes y sombras sutiles opcionales
        }, 
        style
      ]} 
      {...otherProps} 
    />
  );
}