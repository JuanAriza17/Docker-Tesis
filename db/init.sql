CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL
);

INSERT INTO users (username) VALUES ('admin'), ('user'), ('test');