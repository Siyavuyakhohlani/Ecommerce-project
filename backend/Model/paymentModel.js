import { pool } from '../config/config.js';
import bcrypt from 'bcryptjs';
import moment from 'moment';
class Payment {
  static async createPayment(user_id, amount, method, card_number, card_expiry, card_cvc) {
    try {
      // Validate card details
      const cardNumberRegex = /^[0-9]{16}$/;
      const expiryDateRegex = /^(0[1-9]|1[0-2])\/([0-9]{2})$/;
      const cvcRegex = /^[0-9]{3}$/;
      if (!cardNumberRegex.test(card_number)) {
        return { success: false, message: "Card number must be 16 digits." };
      }
      if (!expiryDateRegex.test(card_expiry)) {
        return { success: false, message: "Invalid expiry date format. Use MM/YY." };
      }
      if (!cvcRegex.test(card_cvc)) {
        return { success: false, message: "CVC must be 3 digits." };
      }
      // Check if the expiry date is valid
      const expiryMonthYear = card_expiry.split('/');
      const expiryDate = moment(`20${expiryMonthYear[1]}-${expiryMonthYear[0]}-01`, 'YYYY-MM-DD');
      if (expiryDate.isBefore(moment(), 'month')) {
        return { success: false, message: "Card has expired." };
      }
      // Encrypt card details before saving to the database
      const saltRounds = 12;
      const encryptedCardNumber = await bcrypt.hash(card_number, saltRounds);
      const encryptedCardExpiry = await bcrypt.hash(card_expiry, saltRounds);
      const encryptedCardCvc = await bcrypt.hash(card_cvc, saltRounds);
      const [result] = await pool.query(
        `INSERT INTO payment (user_id, amount, method, card_number, card_expiry, card_cvc, status) VALUES (?, ?, ?, ?, ?, ?, 'Pending')`,
        [user_id, amount, method, encryptedCardNumber, encryptedCardExpiry, encryptedCardCvc]
      );
      return { success: true, payment_id: result.insertId, message: "Payment successful!" };
    } catch (error) {
      console.error(error);
      return { success: false, message: error.message };
    }
  }
}
export default Payment;






