-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT  YEAR(`enrolment_date`) AS `anno_di_iscrizione`, COUNT(*) AS `numero_studenti`
FROM `students` 
GROUP BY YEAR(`enrolment_date`); 

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(id) AS `numero_docenti`, `office_address` AS `stesso_indirizzo`
 FROM `teachers`
  GROUP BY `office_address`; 

-- 3. Calcolare la media dei voti di ogni appello d'esame

SELECT AVG(`vote`) AS `media_voto`,`exam_id`
 FROM `exam_student`
  GROUP BY `exam_id`; 

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(*) AS `numero_corsi`,`department_id` AS `dipartimento` 
FROM `degrees`
 GROUP BY `department_id`; 



--   4 con INNER JOIN 
SELECT COUNT(*) AS `numero_corsi`,`department_id` AS `dipartimento` 
FROM `degrees` 
INNER JOIN `departments` 
ON `department_id`= `departments`.`id` 
GROUP BY `department_id`; 