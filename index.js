import express from "express";
import router from "./routes.js";
import dotenv from "dotenv";
import cors from "cors"
import pool from "./database.js";

dotenv.config();

console.log(await pool.query('SELECT * FROM USERS'));


const app = express();
app.use(cors());
app.use(express.json());



const port = process.env.PORT;

console.log(process.env.PORT );

app.use("/",router)
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});



