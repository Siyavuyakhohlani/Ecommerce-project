import express from "express";
import { requestReset, resetPassword } from "../Controller/resetController.js";

const router = express.Router();

// Routes for password reset
router.post("/request-reset", requestReset); // Handles request to send reset email
router.post("/reset-password", resetPassword); // Handles the actual password reset

export default router;
