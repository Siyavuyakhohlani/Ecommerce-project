import { getCart, addToCart, deleteItem, dropCart, getCartTotal, updateCartItem  } from "../Model/cartModel.js";


const getCartCon = async (req, res) => {
  const user_id = req.params.user_id;
  res.json(await getCart(user_id));
};


const addToCartCon = async (req, res) => {
  console.log("Received Data:", req.body); // Debugging

  const { user_id, product_id, quantity, size } = req.body;

  if (!user_id || isNaN(user_id)) {
    return res.status(400).json({ error: "Invalid user_id" });
  }

  try {
    const result = await addToCart(user_id, product_id, quantity, size);
    res.json(result);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

const deleteItemCon = async (req, res) => {
    const cart_id = req.params.cart_id;
    if (!cart_id || isNaN(cart_id)) {
      return res.status(400).json({ error: "Invalid or missing cart_id" });
    }
    await deleteItem(cart_id);
    res.json({ message: "Item deleted successfully." });
  };

const dropCartCon = async (req, res) => {
  await dropCart(req.params.user_id);
  res.json({ message: "Cart dropped successfully." });
};

// Get Cart Total Controller
const getCartTotalCon = async (req, res) => {
    const user_id = req.params.user_id;
    const total = await getCartTotal(user_id);
    res.json({ total });
  };

  // Update Quantity on the cartView
const updateCartItemCon = async (req, res) => {
  try {
      let { cart_id, quantity } = req.body;
      // Validate input
      if (!cart_id || isNaN(cart_id)) {
          return res.status(400).json({ error: "Invalid cart_id" });
      }
      if (!quantity || isNaN(quantity)) {
          return res.status(400).json({ error: "Invalid quantity" });
      }
      await updateCartItem(cart_id, quantity);
      res.json({ message: "Cart item updated successfully." });
  } catch (error) {
      console.error("Database Error:", error.message);
      res.status(500).json({ error: error.message });
  }
};

export { getCartCon, addToCartCon, deleteItemCon, dropCartCon, getCartTotalCon, updateCartItemCon };






