import { Router } from "express";

const router = Router();

router.get("/yo", (req, res) => {
    res.send("Hello World!");
});




export default router;