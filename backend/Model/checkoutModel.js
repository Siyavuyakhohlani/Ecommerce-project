import { pool } from '../config/config.js';
class Checkout {
  static async getCheckoutDetails(user_id) {
    try {
      // Fetch the user details
      const [userDetails] = await pool.query(`SELECT * FROM users WHERE id = ?`, [user_id]);
      // Fetch the cart items for the user
      const [cartItems] = await pool.query(`SELECT * FROM cart_items WHERE user_id = ?`, [user_id]);
      return { userDetails, cartItems };
    } catch (error) {
      console.error(error);
      return { success: false, message: error.message };
    }
  }
  static async saveShippingDetails(user_id, shippingDetails) {
    try {
        const { name, address, city, zipcode, country } = shippingDetails;
        const [result] = await pool.query(
            `INSERT INTO shipping (user_id, name, address, city, zipcode, country)
             VALUES (?, ?, ?, ?, ?, ?)
             ON DUPLICATE KEY UPDATE
             name = VALUES(name),
             address = VALUES(address),
             city = VALUES(city),
             zipcode = VALUES(zipcode),
             country = VALUES(country)`,
            [user_id, name, address, city, zipcode, country]
        );
        return result;
    } catch (error) {
        console.error(error);
        return { success: false, message: error.message };
    }
}
}
export default Checkout;