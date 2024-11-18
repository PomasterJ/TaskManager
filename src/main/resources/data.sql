INSERT INTO tasks (name, description, due_date, status, parent_task_id)
VALUES
    ('Main Task 1', 'This is the main task without subtasks', '2024-12-01T10:00:00+00:00', 'PENDING', NULL);

INSERT INTO tasks (name, description, due_date, status, parent_task_id)
VALUES
    ('Main Task 2', 'This is the main task with pending subtasks', '2024-12-02T10:00:00+00:00', 'PENDING', NULL);

INSERT INTO tasks (name, description, due_date, status, parent_task_id)
VALUES
    ('Subtask 1 for Main Task 2', 'First subtask', '2024-12-02T12:00:00+00:00', 'PENDING', 2);

INSERT INTO tasks (name, description, due_date, status, parent_task_id)
VALUES
    ('Subtask 2 for Main Task 2', 'Second subtask', '2024-12-02T14:00:00+00:00', 'PENDING', 2);

INSERT INTO tasks (name, description, due_date, status, parent_task_id)
VALUES
    ('Main Task 3', 'This is the main task with completed subtasks', '2024-12-03T10:00:00+00:00', 'COMPLETED', NULL);

INSERT INTO tasks (name, description, due_date, status, parent_task_id)
VALUES
    ('Subtask 1 for Main Task 3', 'First completed subtask', '2024-12-03T12:00:00+00:00', 'COMPLETED', 5);

INSERT INTO tasks (name, description, due_date, status, parent_task_id)
VALUES
    ('Subtask 2 for Main Task 3', 'Second completed subtask', '2024-12-03T14:00:00+00:00', 'COMPLETED', 5);

INSERT INTO tasks (name, description, due_date, status, parent_task_id)
VALUES
    ('Main Task 4', 'This is the main task with partially completed subtasks', '2024-12-04T10:00:00+00:00', 'PENDING', NULL);

INSERT INTO tasks (name, description, due_date, status, parent_task_id)
VALUES
    ('Subtask 1 for Main Task 4', 'First subtask completed', '2024-12-04T12:00:00+00:00', 'COMPLETED', 8);

INSERT INTO tasks (name, description, due_date, status, parent_task_id)
VALUES
    ('Subtask 2 for Main Task 4', 'Second subtask pending', '2024-12-04T14:00:00+00:00', 'PENDING', 8);

INSERT INTO tasks (name, description, due_date, status, parent_task_id)
VALUES
    ('Main Task 5', 'This is the main task with nested subtasks', '2024-12-05T10:00:00+00:00', 'PENDING', NULL);

INSERT INTO tasks (name, description, due_date, status, parent_task_id)
VALUES
    ('Subtask 1 for Main Task 5', 'First subtask', '2024-12-05T12:00:00+00:00', 'PENDING', 11);

INSERT INTO tasks (name, description, due_date, status, parent_task_id)
VALUES
    ('Subtask 2 for Main Task 5', 'Second subtask', '2024-12-05T14:00:00+00:00', 'PENDING', 11);

INSERT INTO tasks (name, description, due_date, status, parent_task_id)
VALUES
    ('Subtask 1 for Subtask 1 for Main Task 5', 'First subtask of Subtask 1', '2024-12-05T16:00:00+00:00', 'PENDING', 12);

INSERT INTO tasks (name, description, due_date, status, parent_task_id)
VALUES
    ('Subtask 1 for Subtask 2 for Main Task 5', 'First subtask of Subtask 2', '2024-12-05T18:00:00+00:00', 'PENDING', 13);
