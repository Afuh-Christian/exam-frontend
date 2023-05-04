import React from 'react'
import type { RootState } from '../DataStore/app/store'
import { useSelector, useDispatch } from 'react-redux'
import { decrement, increment } from '../DataStore/counter/counterReducer'
import { Button, StyleSheet, Text, View } from 'react-native';

export function Counter() {
  const count = useSelector((state: RootState) => state.counter.value)
  
    
    const dispatch = useDispatch()

  return (
      <View>

      <View>
              <Button
                  title='Increment'
                  onPress=  {() => dispatch(increment())}
              />
              <Button
                  title='Decrement'
                  onPress=  {() => dispatch(increment())}
              />

              <Text>{count}</Text>
      </View>
    </View>
  )
}