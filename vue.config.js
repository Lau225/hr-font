module.exports={
    devServer:{
        proxy:'http://localhost:3000'
    },
    configureWebpack:{
        devtool:'source-map'
    }
}