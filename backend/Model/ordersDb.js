import { pool } from "../config/config.js";
// Create order and move cart items to the orders table
// const createOrder = async (user_id, cartItems, total_price, shipping_details) => {
//   try {
//     // Create the order in the orders table
//     const [orderResult] = await pool.query(
//       `INSERT INTO orders (user_id, total_price, status) VALUES (?, ?, 'Pending')`,
//       [user_id, total_price]
//     );
//     const order_id = orderResult.insertId;
//     // Insert cart items into the orders table directly
//     const orderItemQueries = cartItems.map(item =>
//       pool.query(
//         `INSERT INTO orders (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)`,
//         [order_id, item.product_id, item.quantity, item.price]
//       )
//     );
//     await Promise.all(orderItemQueries);
//     // Insert or update shipping details
//     await pool.query(
//       `INSERT INTO shipping (user_id, order_id, name, address, city, zipcode, country)
//        VALUES (?, ?, ?, ?, ?, ?, ?)
//        ON DUPLICATE KEY UPDATE name=VALUES(name), address=VALUES(address), city=VALUES(city), zipcode=VALUES(zipcode), country=VALUES(country)`,
//       [user_id, order_id, shipping_details.name, shipping_details.address, shipping_details.city, shipping_details.zipcode, shipping_details.country]
//     );
//     return { success: true, order_id };
//   } catch (error) {
//     throw error;
//   }
// };
//testing
const createOrder = async (user_id, cartItems, total_price, shipping_details) => {
  try {
    // Step 1: Insert into `orders` table
    const [orderResult] = await pool.query(
      `INSERT INTO orders (user_id, total_price, status) VALUES (?, ?, 'Pending')`,
      [user_id, total_price]
    );
    const order_id = orderResult.insertId;
    // Step 2: Move items from `cart` to `orders`
    const orderItemQueries = cartItems.map(item =>
      pool.query(
        `INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)`,
        [order_id, item.product_id, item.quantity, item.price]
      )
    );
    await Promise.all(orderItemQueries);
    // Step 3: Insert shipping details
    await pool.query(
      `INSERT INTO shipping (user_id, name, address, city, zipcode, country)
       VALUES (?, ?, ?, ?, ?, ?)
       ON DUPLICATE KEY UPDATE name=VALUES(name), address=VALUES(address), city=VALUES(city), zipcode=VALUES(zipcode), country=VALUES(country)`,
      [user_id, shipping_details.name, shipping_details.address, shipping_details.city, shipping_details.zipcode, shipping_details.country]
    );
    // Step 4: Remove items from the cart
    await pool.query(`DELETE FROM cart WHERE user_id = ?`, [user_id]);
    return { success: true, order_id };
  } catch (error) {
    console.error("Error creating order:", error);
    throw error;
  }
};
// Fetch user and order details for the checkout page
const getUserCheckoutDetails = async (user_id) => {
  try {
    const [userDetails] = await pool.query(
        `SELECT users.user_id, users.address AS user_address, users.name, users.email,
                shipping.address AS shipping_address, shipping.city, shipping.zipcode, shipping.country
         FROM users
         LEFT JOIN shipping ON users.user_id = shipping.user_id
         WHERE users.user_id = ?`,
        [user_id]
    );
    // Get cart items for the user
    const [cartItems] = await pool.query(
        `SELECT c.product_id, c.quantity, p.price, p.image_url,
                (c.quantity * p.price) AS total_price
         FROM cart c
         JOIN products p ON c.product_id = p.product_id
         WHERE c.user_id = ?`,
        [user_id]
      );
    return { userDetails: userDetails[0], cartItems };
  } catch (error) {
    throw error;
  }
};
// console.log("Fetched cartItems: ", cartItems);
export { createOrder, getUserCheckoutDetails };
// Get all orders with their items
export const adminGetOrders = async () => {
  try {
    const [orders] = await pool.query(`
      SELECT
        o.order_id,
        o.user_id,
        o.total_price,
        o.status,
        o.tracking_number,
        o.carrier,
        o.created_at,
        u.name AS user_name,
        u.email AS user_email
      FROM orders o
      LEFT JOIN users u ON o.user_id = u.user_id
      ORDER BY o.created_at DESC;
    `);
    // Fetch items for each order
    for (let order of orders) {
      const [items] = await pool.query(`
        SELECT
          order_items.product_id,
          order_items.quantity,
          order_items.price,
          p.name AS product_name,
          p.image_url
        FROM order_items
        JOIN products p ON order_items.product_id = p.product_id
        WHERE order_items.order_id = ?;
      `, [order.order_id]);
      order.items = items;
    }
    return orders;
  } catch (error) {
    console.error(error);
    throw error;
  }
};
// Update order tracking details
export const AdminUpdateOrderTracking = async (orderId, trackingNumber, carrier, status) => {
  try {
    const query = `
      UPDATE orders
      SET tracking_number = ?, carrier = ?, status = ?
      WHERE order_id = ?;
    `;
    const [result] = await pool.query(query, [trackingNumber, carrier, status, orderId]);
    return result.affectedRows > 0;
  } catch (error) {
    console.error(error);
    throw error;
  }
};






