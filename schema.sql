-- USERS TABLE: Stores user information
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- LOTTERIES TABLE: Stores details about the lottery
CREATE TABLE lotteries (
    lottery_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    draw_date TIMESTAMP NOT NULL,
    ticket_price NUMERIC(10, 2) NOT NULL,
    total_prize NUMERIC(10, 2) DEFAULT 0,
    status VARCHAR(20) DEFAULT 'open', -- 'open', 'closed', 'completed'
    created_at TIMESTAMP DEFAULT NOW()
);

-- TICKETS TABLE: Stores the tickets purchased by users
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    lottery_id INT REFERENCES lotteries(lottery_id) ON DELETE CASCADE,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    ticket_number VARCHAR(20) NOT NULL, -- Could be randomly generated
    purchased_at TIMESTAMP DEFAULT NOW()
);

-- WINNERS TABLE: Stores winners and their prize details
CREATE TABLE winners (
    winner_id SERIAL PRIMARY KEY,
    lottery_id INT REFERENCES lotteries(lottery_id) ON DELETE CASCADE,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    ticket_id INT REFERENCES tickets(ticket_id) ON DELETE CASCADE,
    prize_amount NUMERIC(10, 2) NOT NULL,
    claimed BOOLEAN DEFAULT FALSE,
    claimed_at TIMESTAMP
);

-- TRANSACTIONS TABLE: Tracks payments for tickets and payouts for winners
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    lottery_id INT REFERENCES lotteries(lottery_id) ON DELETE CASCADE,
    amount NUMERIC(10, 2) NOT NULL,
    transaction_type VARCHAR(20) NOT NULL, -- 'purchase', 'payout'
    transaction_date TIMESTAMP DEFAULT NOW()
);
