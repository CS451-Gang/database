USE gta;

INSERT INTO courses (id, course_name) VALUES
    ('CS101', 'Problem Solving and Programming I'),
    ('CS101L', 'Problem Solving & Programming I Lab'),
    ('CS191', 'Discrete Structures I'),
    ('CS201', 'Problem Solving and Programming II'),
    ('CS201L', 'Problem Solving & Programming II Lab'),
    ('CS291', 'Discrete Structures II');


INSERT INTO faculty (id, full_name, email) VALUES
    (1, 'John Smith', 'john.smith@umsystem.edu'),
    (2, 'Jane Doe', 'jane.doe@umsystem.edu'),
    (3, 'Brian Hare', 'brian.hare@umsystem.edu');


INSERT INTO positions (faculty_id, course_id, position_type) VALUES
    (1, 'CS101', 'Grader'),
    (1, 'CS101L', 'Lab Instructor'),
    (1, 'CS191', 'Grader'),
    (2, 'CS201', 'Grader'),
    (2, 'CS201L', 'Lab Instructor'),
    (3, 'CS291', 'Grader');
    