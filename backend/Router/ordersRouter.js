import express from 'express';
import {
  createOrderCon,
  getUserCheckoutDetailsCon,
  adminGetAllOrdersCon,
  adminUpdateOrderTrackingInfoCon
} from '../Controller/ordersCon.js';
const router = express.Router();
// Route to create an order
router.post('/', createOrderCon);
// Route to get all orders (Admin only)
router.get("/", adminGetAllOrdersCon);
// Route to update order tracking info (Admin only)
router.patch('/:order_id', adminUpdateOrderTrackingInfoCon);
// Route to get user checkout details
router.get('/:user_id', getUserCheckoutDetailsCon);
export default router;