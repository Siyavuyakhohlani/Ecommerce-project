import express from 'express';
import CheckoutController from '../Controller/checkoutcontroller.js';
const router = express.Router();
router.get('/checkout/:user_id', CheckoutController.getCheckoutDetails);
router.post('/checkout/:user_id/shipping', CheckoutController.saveShippingDetails);
export default router;