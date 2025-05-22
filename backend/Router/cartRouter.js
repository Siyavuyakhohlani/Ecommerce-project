// routes/cartRouter.js
import express from "express";
import {
    getCartCon,
    addToCartCon,
    updateCartItemCon,
    deleteItemCon,
    dropCartCon,
    getCartTotalCon
  } from "../Controller/cartController.js";  // Ensure the correct path and file name here
  
const router = express.Router();

router.get("/:user_id", getCartCon);
router.post("/", addToCartCon);
router.patch("/", updateCartItemCon);  // Use PATCH for updating size and quantity
router.delete("/:cart_id", deleteItemCon);
router.delete("/drop/:user_id", dropCartCon);
router.get("/total/:user_id", getCartTotalCon);

export default router;
