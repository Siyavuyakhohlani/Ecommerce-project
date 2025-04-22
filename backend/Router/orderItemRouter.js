import express from "express"
import { getOrderItemsCon, getOrderItemByIdCon, insertOrderItemsCon, deleteOrderItemsCon, updateOrderItemsCon } from "../Controller/orderItemCon.js"
const router = express.Router()
router.get("/", getOrderItemsCon)
router.get("/:order_item_id", getOrderItemByIdCon)
router.post("/", insertOrderItemsCon)
router.delete("/:order_item_id", deleteOrderItemsCon)
router.put("/:order_item_id", updateOrderItemsCon)
export default router







