USE HOSPITAL;

SELECT * FROM PATIENTS;
SELECT * FROM ADMISSIONS;
SELECT * FROM PHYSICIANS;
SELECT * FROM NURSING_UNITS;

-- 50
WITH temp_table AS (
SELECT p.first_name, DAY(a.discharge_date) AS day, MONTH(a.discharge_date) AS month, p.gender AS patient_gender, a.room, a.bed, nu.beds  
FROM PATIENTS p
INNER JOIN ADMISSIONS a ON a.patient_id = p.patient_id
INNER JOIN PHYSICIANS ph ON ph.physician_id = a.attending_physician_id
INNER JOIN NURSING_UNITS nu ON nu.nursing_unit_id = a.nursing_unit_id
WHERE SUBSTRING(PH.speciality, LEN(PH.speciality) - 3, 4) = 'gist'
)
SELECT CASE
    WHEN patient_gender = 'M' THEN 'Male'
    ELSE 'Female'
END AS gender, day, month, 
CONCAT('The patient ', UPPER(first_name),' was in the room: ', room, ' in the bed ', bed, ', so there are ', beds - bed,' beds availables') AS nu_state
FROM temp_table;

--49
SELECT ph.first_name, DATEDIFF(DAY, a.admission_date, a.discharge_date) patient_days_interned
FROM PHYSICIANS ph
INNER JOIN ADMISSIONS a ON a.attending_physician_id = ph.physician_id;

--47
WITH temp_table AS (
SELECT ph.*, COUNT(DISTINCT p.patient_id) distinct_patients
FROM PHYSICIANS ph
INNER JOIN ADMISSIONS a ON a.attending_physician_id = ph.physician_id
INNER JOIN PATIENTS p ON p.patient_id = a.patient_id
GROUP BY ph.physician_id, ph.first_name, ph.last_name, ph.speciality
)
SELECT *, CASE
    WHEN distinct_patients = 0 THEN 'You need to review your prices'
    WHEN distinct_patients <= 2 THEN 'Keep like that'
    ELSE 'Wow you’re an amazing physician'
END AS advice 
FROM temp_table;

--46
WITH temp_table AS (
SELECT DISTINCT p.patient_id, p.first_name, p.last_name, ABS(p.weight - (p.height - 100)) AS difference_val
FROM PATIENTS p
INNER JOIN ADMISSIONS a ON a.patient_id = p.patient_id
INNER JOIN PHYSICIANS ph ON ph.physician_id = a.attending_physician_id
INNER JOIN NURSING_UNITS nu ON nu.nursing_unit_id = a.nursing_unit_id
WHERE nu.beds = 10 AND YEAR(a.admission_date) = 2018 AND ISNUMERIC(SUBSTRING(nu.nursing_unit_id,1,1)) = 1
)
SELECT first_name, last_name, CASE
    WHEN difference_val < 5 THEN 'You are in a good shape'
    WHEN difference_val BETWEEN 6 AND 15 THEN 'You need to check your feeding'
    ELSE 'You need to see a nutricionist'
END AS patient_state, difference_val
FROM temp_table;

--45
SELECT allergies, COUNT(allergies) count_of_patients
FROM PATIENTS
GROUP BY allergies

--44
SELECT p.first_name, p.last_name, COUNT(DISTINCT p.patient_id) interned_times
FROM PATIENTS p
INNER JOIN ADMISSIONS a ON a.patient_id = p.patient_id
INNER JOIN PHYSICIANS ph ON ph.physician_id = a.attending_physician_id
INNER JOIN NURSING_UNITS nu ON nu.nursing_unit_id = a.nursing_unit_id
WHERE p.gender = 'F' AND CHARINDEX(' ', p.last_name) > 0 AND LEN(ph.speciality) > 15 AND DAY(EOMONTH(a.admission_date)) = 31
GROUP BY p.first_name, p.last_name, p.patient_id;

--43
SELECT *
FROM PATIENTS p
INNER JOIN ADMISSIONS a ON a.patient_id = p.patient_id
INNER JOIN PHYSICIANS ph ON ph.physician_id = a.attending_physician_id
INNER JOIN NURSING_UNITS nu ON nu.nursing_unit_id = a.nursing_unit_id;

--41
SELECT p.*, a.*, ph.*, nu.*
FROM PATIENTS p
INNER JOIN (SELECT p.patient_id, COUNT(p.patient_id) AS interned_times 
            FROM PATIENTS p 
            INNER JOIN ADMISSIONS a ON a.patient_id = p.patient_id 
            GROUP BY p.patient_id 
            HAVING COUNT(p.patient_id) > 1) temp ON temp.patient_id = p.patient_id 
INNER JOIN ADMISSIONS a ON a.patient_id = p.patient_id 
INNER JOIN PHYSICIANS ph ON ph.physician_id = a.attending_physician_id 
INNER JOIN NURSING_UNITS nu ON nu.nursing_unit_id = a.nursing_unit_id
WHERE p.allergies IS NOT NULL AND a.secondary_diagnoses IS NOT NULL;

--40
SELECT first_name, last_name, 
DATEDIFF(YEAR, birth_date, GETDATE()) AS age, city, 
ABS(DATEDIFF(YEAR, birth_date, GETDATE()) - (SELECT AVG(DATEDIFF(YEAR, birth_date, GETDATE())) FROM PATIENTS)) as diff_age_avgage
FROM PATIENTS
WHERE SUBSTRING(allergies, 1, 1) != 'P';

--39
SELECT MAX(p.birth_date) AS max_birth_date, MIN(p.birth_date) AS min_birth_date, MAX(a.admission_date) AS max_admission_date, MIN(a.admission_date) AS min_admission_date, MAX(a.discharge_date) AS max_discharge_date, MIN(a.discharge_date) AS min_discharge_date
FROM PATIENTS p
INNER JOIN ADMISSIONS a ON a.patient_id = p.patient_id
INNER JOIN NURSING_UNITS nu ON nu.nursing_unit_id = a.nursing_unit_id
WHERE nu.beds = 5
GROUP BY p.gender;

--48
SELECT p.first_name, p.last_name, ph.first_name, ph.last_name
FROM PATIENTS p
INNER JOIN ADMISSIONS a ON a.patient_id = p.patient_id
INNER JOIN PHYSICIANS ph ON ph.physician_id = a.attending_physician_id
WHERE FORMAT(a.admission_date,'dddd') = 'Friday'
ORDER BY p.first_name ASC, p.last_name DESC;

--42
SELECT a.union_type, a.date_field, a.extra FROM
(SELECT TOP (10) 'Patients' union_type, DATENAME(month,birth_date) as date_field, birth_date AS extra
FROM PATIENTS
WHERE gender = 'M'
ORDER BY birth_date ASC) a
UNION ALL
SELECT b.union_type, b.date_field, b.extra FROM
(SELECT TOP (10) 'Admissions' union_type, DATENAME(month,admission_date) as date_field, admission_date AS extra
FROM ADMISSIONS
ORDER BY admission_date DESC) b;

--32
DECLARE @count_of_rows INT;
DECLARE @max_physician_id INT;
SELECT  @count_of_rows = COUNT(*), @max_physician_id = MAX(size_temp.physician_id)FROM (
    SELECT physician_id, COUNT(ph.physician_id) AS count_of_admissions
    FROM ADMISSIONS a
    INNER JOIN PHYSICIANS ph ON ph.physician_id = a.attending_physician_id
    GROUP BY ph.physician_id
    HAVING COUNT(ph.physician_id) = (SELECT MIN(temp.count_of_admissions) 
        FROM (
        SELECT ph.physician_id, COUNT(ph.physician_id) AS count_of_admissions 
        FROM ADMISSIONS a
        INNER JOIN PHYSICIANS ph ON ph.physician_id = a.attending_physician_id
        GROUP BY ph.physician_id
        ) AS temp)
) AS size_temp
GROUP BY size_temp.count_of_admissions;
-- SELECT @count_of_rows AS count_of_rows, @max_physician_id AS max_physician_id
IF @count_of_rows > 1
BEGIN
    SELECT CONCAT('UPDATE WHERE PHYSICIANS.physician_id = ', @max_physician_id)
END;
ELSE 
BEGIN
    SELECT CONCAT('DROP WHERE ADMISSIONS.attending_physician_id = ', @max_physician_id)
END;