CREATE TABLE tasks (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(1000),
    due_date TIMESTAMP,
    status VARCHAR(20) NOT NULL CHECK (status IN ('PENDING', 'COMPLETED')),
    parent_task_id BIGINT,
    FOREIGN KEY (parent_task_id) REFERENCES tasks(id)
);