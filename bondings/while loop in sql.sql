DELIMITER $$
CREATE  PROCEDURE while_loop_example()
BEGIN
    DECLARE i INT;
    SET i=1;                   -- Initialize the counter
	WHILE i <= 20 DO           -- Loop until i reaches 10 (i.e., similar to a FOR loop)
        SELECT i;              -- Perform an action (in this case, output the value of i)
        SET i = i + 1;         -- Increment the counter
    END WHILE;
END $$
DELIMITER ;

call while_loop_example();
drop procedure while_loop_example;
drop procedure while_loop_example;