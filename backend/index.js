import express from "express"
import {config} from "dotenv"
config()
import cors from "cors"
import ordersRouter from "./Router/ordersRouter.js"
import orderItemRouter from "./Router/orderItemRouter.js"
import paymentRouter from "./Router/paymentRouter.js"
import authRouter from "./Router/authRouter.js"
import usersRouter from "./Router/usersRouter.js"
import productsCategoriesRouter from "./Router/productsCategoriesRouter.js"
import checkoutRoutes from './Router/checkoutRouter.js';
//Products and cart router
import productsRouter from "./Router/productsRouter.js"
import cartRouter from "./Router/cartRouter.js";
import { forgotPassword } from "./Controller/authCon.js"
import resetRouter from "./Router/resetRouter.js";
//creating app
const app =express()
app.use(cors())
app.use(express.json())//to allow data to be added to the Json()file
//to access the env config file
//For admin
app.use('/api', paymentRouter);
app.use("/api/checkout", ordersRouter) //orders router
app.use("/order_items", orderItemRouter)
app.use("/api/auth", authRouter);
app.use("/users", usersRouter)
app.use("/productcategories", productsCategoriesRouter)
app.use("/products", productsRouter)
app.use("/cart", cartRouter);
app.use('/api', checkoutRoutes);// Cart routes
app.post("/forgot-password", forgotPassword);
app.use("/api", resetRouter);
app.use('/api/auth', authRouter);
//creating a port
const PORT = 5050
app.listen(PORT, ()=>{
    console.log("http://localhost:"+PORT)
    console.log("I am running:👍...")
})






