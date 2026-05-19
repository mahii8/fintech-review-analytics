
-- bank_reviews database schema
-- Author: Bamla | 10 Academy x Kifiya | Week 2

CREATE TABLE IF NOT EXISTS banks (
    bank_id     SERIAL PRIMARY KEY,
    bank_name   VARCHAR(100) NOT NULL UNIQUE,
    app_name    VARCHAR(200),
    app_id      VARCHAR(200),
    avg_rating  DECIMAL(3,2),
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS reviews (
    review_id        INTEGER PRIMARY KEY,
    bank_id          INTEGER REFERENCES banks(bank_id),
    review_text      TEXT,
    rating           INTEGER CHECK (rating BETWEEN 1 AND 5),
    review_date      DATE,
    sentiment_label  VARCHAR(20),
    sentiment_score  DECIMAL(6,4),
    identified_theme VARCHAR(100),
    source           VARCHAR(50) DEFAULT 'Google Play',
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
