import { pool } from "../config/config.js"

const getCategories = async () => {
    let [data, rows] = await pool.query("SELECT * FROM product_categories");
    return data;
};

const getSingleCategory = async (id) => {
    let [data] = await pool.query("SELECT * FROM product_categories WHERE category_id = ?", [id]);
    return data;
};

const insertCategory = async (category_name) => {
    await pool.query("INSERT INTO product_categories (category_name) VALUES (?)", [category_name]);
    return "Category inserted successfully!";
};

const updateCategory = async (id, data) => {
    const { category_name } = data;
    let updateFields = [];
    let updateValues = [];
  
    if (category_name) {
      updateFields.push("category_name = ?");
      updateValues.push(category_name);
    }
  
    updateValues.push(id);
  
    const query = `UPDATE product_categories SET ${updateFields.join(", ")} WHERE category_id = ?`;
    await pool.query(query, updateValues);
    return "Category updated successfully!";
};

const deleteCategory = async (id) => {
    await pool.query("DELETE FROM product_categories WHERE category_id = ?", [id]);
    return "Category successfully deleted";
};

export {getCategories, getSingleCategory, insertCategory, updateCategory, deleteCategory}
