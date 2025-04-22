import Payment from '../Model/paymentModel.js'
class PaymentController {
  static async createPayment(req, res) {
    const { user_id, amount, method, card_number, card_expiry, card_cvc } = req.body;
    try {
      const result = await Payment.createPayment(user_id, amount, method, card_number, card_expiry, card_cvc);
      if (result.success) {
        return res.status(200).json({ success: true, message: result.message });
      } else {
        return res.status(400).json({ success: false, message: result.message });
      }
    } catch (error) {
      console.error(error);
      return res.status(500).json({ success: false, message: 'Server error' });
    }
  }
}
export default PaymentController;