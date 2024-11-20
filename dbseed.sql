-- SEED USERS
INSERT INTO users (username, email, password_hash)
VALUES
    ('john_doe', 'john.doe@example.com', 'hashed_password_123'),
    ('jane_smith', 'jane.smith@example.com', 'hashed_password_456'),
    ('alice_wonder', 'alice.wonder@example.com', 'hashed_password_789');

-- SEED LOTTERIES
INSERT INTO lotteries (name, draw_date, ticket_price, total_prize, status)
VALUES
    ('Weekly Jackpot', '2024-12-01 20:00:00', 10.00, 5000.00, 'open'),
    ('Holiday Bonanza', '2024-12-25 18:00:00', 20.00, 20000.00, 'open'),
    ('New Year Special', '2025-01-01 22:00:00', 50.00, 50000.00, 'open');

-- SEED TICKETS
INSERT INTO tickets (lottery_id, user_id, ticket_number, purchased_at)
VALUES
    (1, 1, 'A12345', '2024-11-20 10:00:00'),
    (1, 2, 'B67890', '2024-11-20 11:00:00'),
    (1, 3, 'C11223', '2024-11-20 12:00:00'),
    (2, 1, 'D33445', '2024-11-21 15:00:00'),
    (2, 2, 'E55667', '2024-11-21 16:00:00'),
    (3, 3, 'F77889', '2024-11-22 18:00:00');

-- SEED WINNERS
INSERT INTO winners (lottery_id, user_id, ticket_id, prize_amount, claimed, claimed_at)
VALUES
    (1, 2, 2, 2500.00, FALSE, NULL);

-- SEED TRANSACTIONS
INSERT INTO transactions (user_id, lottery_id, amount, transaction_type, transaction_date)
VALUES
    (1, 1, 10.00, 'purchase', '2024-11-20 10:00:00'),
    (2, 1, 10.00, 'purchase', '2024-11-20 11:00:00'),
    (3, 1, 10.00, 'purchase', '2024-11-20 12:00:00'),
    (1, 2, 20.00, 'purchase', '2024-11-21 15:00:00'),
    (2, 2, 20.00, 'purchase', '2024-11-21 16:00:00'),
    (3, 3, 50.00, 'purchase', '2024-11-22 18:00:00'),
    (2, 1, 2500.00, 'payout', '2024-12-02 10:00:00'); -- Example payout transaction
