-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `students`.* 
FROM `students` 
INNER JOIN `degrees` 
ON `students`.`degree_id` = `degrees`.`id`
 WHERE `degrees`.`name` 
 LIKE "corso di laurea in economia"; 

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di
-- Neuroscienze

SELECT `degrees`. * 
FROM `degrees`
 INNER JOIN `departments` 
 ON `degrees`.`department_id` = `departments`.`id` 
 WHERE `degrees`.`level`LIKE "magistrale" 
 AND `departments`.`name` LIKE "dipartimento di neuroscienze"; 
-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT  *
FROM `teachers`
INNER JOIN `course_teacher`
ON `course_teacher`.`course_id` 
WHERE `teachers`.`id`= 44
AND `course_teacher`.`teacher_id` = `teachers`.`id`;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
-- sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e
-- nome

 SELECT `students`. * ,`degrees`.*, `departments`.`name` 
 FROM `students` 
 INNER JOIN `degrees` 
 ON `students`.`degree_id`= `degrees`.`id` 
 INNER JOIN `departments` 
 ON `departments`.`id` = `degrees`.`department_id` 
 ORDER BY `students`.`name`;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT `degrees`.* , `courses`.`name`, `teachers`.`name` 
FROM `degrees` 
INNER JOIN `courses` 
ON `degrees`.`id` = `courses`.`degree_id` 
INNER JOIN`course_teacher` 
ON `courses`.`id` = `course_teacher`.`course_id` 
INNER JOIN `teachers` 
ON `teachers`.`id`= `course_teacher`.`teacher_id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di
-- Matematica (54)

SELECT  `teachers`.*, `departments`.`name`
FROM `departments`
INNER JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id` 
INNER JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `course_teacher`
ON `courses`.`id`  = `course_teacher`.`course_id`
INNER JOIN `teachers`
ON`teachers`. `id` = `course_teacher`.`teacher_id`
WHERE `departments`.`name` LIKE "dipartimento di matematica";

-- 7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti
-- per ogni esame, stampando anche il voto massimo. Successivamente,
-- filtrare i tentativi con voto minimo 18
