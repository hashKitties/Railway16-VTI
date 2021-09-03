-- Excercise 1:
DROP TRIGGER IF EXISTS t_check_module_input;

DELIMITER //
CREATE TRIGGER t_check_module_input 
BEFORE INSERT ON project_module
FOR EACH ROW
BEGIN
	IF DATEDIFF(project_module.ProjectModuleDate, projects.ProjectStartDate) < 0
		OR DATEDIFF(project_module.ProjectModuleCompletedOn, projects.ProjectCompletedOn) > 0
    THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Date is not valid';
	END IF;
END//

DELIMITER ;

-- Excercise 2:
USE extra_assignment1;
CREATE OR REPLACE VIEW ET_Trainee AS
    SELECT 
        TraineeID, FullName
    FROM
        trainee
    WHERE 	(ET_IQ + ET_Gmath) >= 20 
		AND ET_IQ >= 8
        AND ET_Gmath >= 8
        AND ET_English >= 18;