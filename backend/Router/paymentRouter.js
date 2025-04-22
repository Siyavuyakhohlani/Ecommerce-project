import express from 'express';

import PaymentController from '../Controller/paymentController.js';
const router = express.Router();
router.post('/checkout/:user_id/payment', PaymentController.createPayment);
export default router;








