import { pool } from "../config/config.js";

// Find user by email
export const findUserByEmail = async (email) => {
  const [rows] = await pool.query("SELECT id FROM users WHERE email = ?", [email]);
  return rows.length > 0 ? rows[0] : null;
};

// Update reset token and expiry for user
export const updateResetToken = async (email, resetToken, resetExpiry) => {
  await pool.query(
    "UPDATE users SET reset_token = ?, reset_expiry = ? WHERE email = ?",
    [resetToken, resetExpiry, email]
  );
};

// Find user by reset token
export const findUserByToken = async (email, token) => {
  const [rows] = await pool.query(
    "SELECT reset_expiry FROM users WHERE email = ? AND reset_token = ? AND reset_expiry > NOW()",
    [email, token]
  );
  return rows.length > 0 ? rows[0] : null;
};

// Update password and clear reset token
export const updatePassword = async (email, hashedPassword) => {
  await pool.query(
    "UPDATE users SET password = ?, reset_token = NULL, reset_expiry = NULL WHERE email = ?",
    [hashedPassword, email]
  );
};
