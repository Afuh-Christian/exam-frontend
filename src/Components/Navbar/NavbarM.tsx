import React , {useState} from 'react'
import { Alert, Animated, Image, SafeAreaView, Text, TouchableOpacity, View } from 'react-native'
import navStyles, { windowwidth } from './Navbar'
import Feather from '@expo/vector-icons/Feather'
import FontAwesome5 from '@expo/vector-icons/FontAwesome5'
import AntDesign from '@expo/vector-icons/AntDesign'
import Ionicons from '@expo/vector-icons/Ionicons'


type Move = {
  move: Animated.Value, 
  show: Boolean
}


function NavbarM() {

  const [loginmove, setLoginmove] = useState<Move>({
    move: new Animated.Value(150), 
    show: false
  })
  function showHideLogin(): void{
    if (!loginmove.show) { 
      Animated.timing(loginmove.move, {
        toValue: 0, 
        duration: 300,
        useNativeDriver: true
      }).start()
    } else {
      Animated.timing(loginmove.move, {
        toValue: 150, 
        duration: 300,
        useNativeDriver: true
      }).start()
    }
    setLoginmove((prev) => ({
      ...prev, 
      show: !prev.show
    }))
  }



  const [navbar, setNavbar] = useState<Move>({
    move: new Animated.Value(-windowwidth), 
    show: false
  })
  function showHideNavbar(): void{
    if (!navbar.show) { 
      Animated.timing(navbar.move, {
        toValue: 0, 
        duration: 300,
        useNativeDriver: true
      }).start()
    } else {
      Animated.timing(navbar.move, {
        toValue: -windowwidth, 
        duration: 300,
        useNativeDriver: true
      }).start()
    }
    setNavbar((prev) => ({
      ...prev, 
      show: !prev.show
    }))
  }





  return (
    <SafeAreaView>
    <SafeAreaView style={{ ...navStyles.body, ...navStyles.shadowProp }}>
      <TouchableOpacity onPress={showHideNavbar}>
        <View style={navStyles.child}>
            { !navbar.show && <Feather name='menu' size={32}/> || <AntDesign name='close' size={31}/>}
        </View>
        </TouchableOpacity>
      <View style={{  ...navStyles.childtitle }}>
        <View style={navStyles.kids}>

        <Image source={require('../../../assets/books/book1.png')}
            style={
            {width:25}
          }
          />

        </View>
        <View style={navStyles.kidTitle}><Text style={{ fontSize: 20,  fontWeight:"600"}}>Exam</Text></View>
        <View style={navStyles.kids}>
        <Image source={require('../../../assets/books/book2.png')}
            style={
              {width:25}
          }
          />
        </View>
      </View>
      <TouchableOpacity
      onPress={showHideLogin}
      >
      <View style={navStyles.child}>
        <FontAwesome5 name="user-circle" size={30}/>
        </View>
        </TouchableOpacity>
      </SafeAreaView>
      <Animated.View style={{
      ...navStyles.login, 
       transform: [{translateX:loginmove.move}]
      }}>
        
        <Text>Logout</Text>
        <Text>Edit Account</Text>

      </Animated.View> 

      <Animated.View
        style={{
          ...navStyles.navbarshow, 
          transform : [{translateX:navbar.move}]
          // zIndex: 
      }}
      >
        <View><Text>Home</Text></View>
        <View><Text>About</Text></View>
        <View><Text>Help</Text></View>
        <View><Text>Account Settings</Text></View>
        <View><Text>Admin DashBoard</Text></View>
       
       
        {loginmove.show &&
          <View
            style={{
              flexDirection: "row", 
              gap: 20,
              alignItems:'center'
          }}
          >
            <Text>Light</Text>
            <View><Ionicons name='sunny' size={15}/></View>
          </View>
          ||
          <View
          style={{
            flexDirection: "row", 
            gap: 20,
            alignItems:'center'
        }}
        >
          <Text>Dark</Text>
          <View><Ionicons name='moon-sharp' size={14}/></View>
        </View>
        }




      </Animated.View>
      </SafeAreaView>
  )
}

export default NavbarM