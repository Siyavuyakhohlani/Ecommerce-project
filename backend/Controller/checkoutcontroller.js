import Checkout from '../Model/checkoutModel.js';
class CheckoutController {
  static async getCheckoutDetails(req, res) {
    const { user_id } = req.params;
    try {
      const checkoutDetails = await Checkout.getCheckoutDetails(user_id);
      if (!checkoutDetails) {
        return res.status(404).json({ success: false, message: 'Checkout details not found' });
      }
      return res.status(200).json(checkoutDetails);
    } catch (error) {
      console.error(error);
      return res.status(500).json({ success: false, message: 'Server error' });
    }
  }
  static async saveShippingDetails(req, res) {
    const { user_id } = req.params;
    const shippingDetails = req.body;
    try {
      const result = await Checkout.saveShippingDetails(user_id, shippingDetails);
      if (result.affectedRows > 0) {
        return res.status(200).json({ success: true, message: 'Shipping details saved!' });
      } else {
        return res.status(400).json({ success: false, message: 'Failed to save shipping details' });
      }
    } catch (error) {
      console.error(error);
      return res.status(500).json({ success: false, message: 'Server error' });
    }
  }
}
export default CheckoutController;