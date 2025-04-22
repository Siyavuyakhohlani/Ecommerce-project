import { getOrderItems, getOrderItemById, insertOrderItems, deleteOrderItems, updateOrderItems } from "../Model/orderItemsDb.js";
const getOrderItemsCon = async (req, res) => {
    try{
        res.status(200).json({order_items: await getOrderItems()});
    }catch (err) {
        res.status(500).json ({error: err.message})
    }
};
const getOrderItemByIdCon = async (req, res) => {
  try {
    const { order_item_id } = req.params;  // Assuming order_id comes from URL params
    const order_item = await getOrderItemById(order_item_id);
    if (order_item.length === 0) {
      return res.status(404).json({ message: 'Order item not found' });
    }
    res.status(200).json(order_item);
  } catch (err) {
    res.status(500).json({ error: err.message});
  }
};
const insertOrderItemsCon = async (req,res) => {
    try{
      let  {order_id, product_id, quantity, price} = req.body;
      console.log(req.body);
      const order_items = await insertOrderItems(order_id, product_id, quantity, price);
      res.status(200).json({order_items});
    }catch(err){
      res.status(500).json({error: err.message})
    }
  };
  const deleteOrderItemsCon = async (req,res) => {
    try{
      let {order_item_id} = req.params;
      console.log(req.params);
      const order_items = await deleteOrderItems (order_item_id);
      res.status(200).json({order_items})
    }catch(err){
      res.status(500).json({error: err.massage});
    }
  };
  const updateOrderItemsCon = async (req, res) => {
    try{
      let {order_item_id} = req.params;
      let {order_id, product_id, quantity, price} = req.body
      console.log(req.params)
      const order_items = await updateOrderItems (order_id, product_id, quantity, price, order_item_id);
      res.status(500).json({order_items});
    }catch(err){
      res.status(500).json({message: err.message});
    }
  }
export {getOrderItemsCon, getOrderItemByIdCon, insertOrderItemsCon, deleteOrderItemsCon, updateOrderItemsCon}






