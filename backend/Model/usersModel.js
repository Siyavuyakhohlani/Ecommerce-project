import { pool } from "../config/config.js"

const getUsers = async () => {
    let [data, rows] = await pool.query("SELECT * FROM users");
    return data;
};

const getSingleUser = async (user_id) => {
    let [data] = await pool.query("SELECT * FROM Users WHERE user_id = ?", [user_id]);
    return data;
};

const insertedUser = async (name, email, password, phone, address) => {
    await pool.query("INSERT INTO Users (name, email, password, phone, address) VALUES (?, ?, ?, ?, ?)", [name, email, password, phone, address]);
    return "User inserted successfully!";
};

const updateUser = async (user_id, data) => {
    let updateFields = [];
    let updateValues = [];
  
    // Check which fields are provided and prepare for the update query
    if (data.email) {
      updateFields.push("email = ?");
      updateValues.push(data.email);
    }
    if (data.name) {
      updateFields.push("name = ?");
      updateValues.push(data.name);
    }
    if (data.password) {
      updateFields.push("password = ?");
      updateValues.push(data.password);
    }
    if (data.phone) {
      updateFields.push("phone = ?");
      updateValues.push(data.phone);
    }
  
    // Push the user ID as the last value for the WHERE clause
    updateValues.push(user_id);
  
    // Construct the SQL query for updating the user
    const query = `UPDATE Users SET ${updateFields.join(", ")} WHERE user_id = ?`;
  
    // Execute the query and return a success message
    await pool.query(query, updateValues);
    return "User updated successfully!";
};

const deleteUser = async (user_id) => {
    // Step 1: Delete from order_items
    await pool.query(
        "DELETE FROM order_items WHERE order_id IN (SELECT order_id FROM orders WHERE user_id = ?)", 
        [user_id]
    );

    // Step 2: Delete from payments
    await pool.query(
        "DELETE FROM payments WHERE order_id IN (SELECT order_id FROM orders WHERE user_id = ?)", 
        [user_id]
    );

    // Step 3: Delete from orders
    await pool.query(
        "DELETE FROM orders WHERE user_id = ?", 
        [user_id]
    );

    // Step 4: Delete the user
    await pool.query(
        "DELETE FROM Users WHERE user_id = ?", 
        [user_id]
    );

    return "User and related data successfully deleted";
};



export {getUsers, getSingleUser, insertedUser, updateUser, deleteUser}
