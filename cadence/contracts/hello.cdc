pub contract Hello{
    //模拟器部署不能有事件
    // pub event IsuedGreeting(greeting:String)
    pub fun sayHi(to name:String):String{
        let greeting = "hi,".concat(name)
        // emit IsuedGreeting(greeting:greeting)
        return greeting
    }
}