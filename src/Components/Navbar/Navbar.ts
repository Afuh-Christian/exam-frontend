import { StyleSheet } from "react-native";
import { Dimensions } from "react-native";

export const windowheight = Dimensions.get("window").height
export const windowwidth = Dimensions.get("window").width


const navStyles = StyleSheet.create({
    body: {
        height: 70, 
        width: "auto",
        backgroundColor: "white", 
        display: "flex", 
        flexDirection: "row", 
        alignItems: "center",
        justifyContent: "space-between", 
        paddingHorizontal: 20, 
        elevation: 4
 
        
    }, 
    child: {
        width: 40, 
        height: 40, 
        // backgroundColor: "red" ,
         justifyContent: "center"
        ,alignItems: "center"
    }, 
    childtitle: {
        display: "flex", 
        flexDirection: "row", 
        gap:7
    }, 
    kids: {
        width: 40, 
        height: 40, 
        justifyContent: "center"
        ,alignItems: "center"
    }, 
    kidTitle: {
        width: "auto",
        height: 40,
        justifyContent: "center", 
    },

    shadowProp: {
        shadowColor: 'black',
        shadowOffset: {width: -2, height: 40},
        shadowOpacity: 1,
        shadowRadius: 70,
    }
    


    , login: {
        height: "auto",
        width: "auto",
        backgroundColor: "white",
        position: "absolute",
        top: 71, right: 0,
        flexDirection: "column", 
        justifyContent: "center",
        alignItems: "center", 
        gap:20,
        paddingVertical: 20,
        paddingHorizontal: 20, 
        elevation: 4, 
    }, 
    navbarshow: {
        // width: windowwidth - 100 ,
        fontSize: "30",
        backgroundColor: "white", 
        elevation: 4, 
        position: "absolute", 
        top: 71, left: 0, 
        padding: 30, 
        gap: 20,
    }

})


export default navStyles
