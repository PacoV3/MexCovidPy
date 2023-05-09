-- CREATE DATABASE HOSPITAL
USE HOSPITAL

IF OBJECT_ID(N'dbo.PATIENTS', N'U') IS NOT NULL
DROP TABLE PATIENTS;
GO

IF OBJECT_ID(N'dbo.ADMISSIONS', N'U') IS NOT NULL
DROP TABLE ADMISSIONS;
GO

IF OBJECT_ID(N'dbo.PHYSICIANS', N'U') IS NOT NULL
DROP TABLE PHYSICIANS;
GO

IF OBJECT_ID(N'dbo.NURSING_UNITS', N'U') IS NOT NULL
DROP TABLE NURSING_UNITS;
GO

IF OBJECT_ID(N'dbo.PATIENTS', N'U') IS NULL
CREATE TABLE PATIENTS (
    patient_id INT,
    first_name varchar(max),
    last_name varchar(max),
	gender CHAR(1),
	birth_date DATE,
	city varchar(max),
	province_id CHAR(2),
	allergies varchar(max),
	height INT,
	weight INT
);
GO

IF OBJECT_ID(N'dbo.ADMISSIONS', N'U') IS NULL
CREATE TABLE ADMISSIONS (
    patient_id INT,
    admission_date DATE,
    discharge_date DATE,
	primary_diagnosis varchar(max),
	secondary_diagnoses varchar(max),
	attending_physician_id INT,
	nursing_unit_id varchar(max),
	room INT,
	bed INT
);
GO

IF OBJECT_ID(N'dbo.PHYSICIANS', N'U') IS NULL
CREATE TABLE PHYSICIANS (
    physician_id INT,
    first_name varchar(max),
    last_name varchar(max),
	speciality varchar(max)
);
GO

IF OBJECT_ID(N'dbo.NURSING_UNITS', N'U') IS NULL
CREATE TABLE NURSING_UNITS (
    nursing_unit_id varchar(max),
    specialty varchar(max),
    manager_first_name varchar(max),
	manager_last_name varchar(max), 
	beds INT,
	extension INT
);
GO

INSERT INTO PATIENTS (patient_id, first_name, last_name, gender, birth_date, city, province_id, allergies, height, weight)
VALUES ('1', 'Miyuki', 'Riviera', 'F', '12/6/1953', 'Hamilton', 'ON', 'NKA', '181', '93'),
('2', 'Deunan', 'Knu te', 'F', '4/24/1937', 'Hamilton', 'ON', 'Pork', '172', '100'),
('3', 'Lois', 'McAllister', 'F', '9/2/2011', 'Carisle', 'ON', 'NKA', '101', '31'),
('4', 'Angua', 'von Uberwald', 'F', '6/21/1972', 'Toronto', 'ON', 'NKA', '176', '80'),
('5', 'Darryl', 'Morris', 'M', '6/26/1983', 'Hamilton', 'ON', 'NKA', '168', '83'),
('6', 'Sam', 'Platter', 'M', '4/1/1989', 'Hamilton', 'ON', 'NKA', '144', '71'),
('7', 'Pamela', 'Har man', 'F', '5/10/1929', 'Stoney Creek', 'ON', 'NKA', '152', '54'),
('8', 'Rita', 'Morrow', 'F', '1/12/1978', 'Toronto', 'ON', 'Cats', '182', '107'),
('9', 'Kiriko', 'Masa ki', 'F', '6/16/1963', 'Fonthill', 'ON', 'NKA', '180', '94'),
('10', 'Piper', 'Cooper', 'F', '1/23/1991', 'Brantford', 'ON', 'Strawberries', '168', '113'),
('11', 'Fenella', 'Bur nett', 'F', '6/13/1998', 'Toronto', 'ON', 'Codeine', '144', '53'),
('12', 'Miranda', 'Cor bie', 'F', '7/26/1981', 'Burlington', 'ON', 'Penicillin', '144', '57'),
('13', 'Trinity', 'Pek kala', 'F', '6/15/1977', 'Hamilton', 'ON', 'Sulphur', '172', '83'),
('14', 'Benjamin', 'Brockman', 'M', '6/15/1968', 'Hamilton', 'ON', 'Sulphur', '189', '121'),
('15', 'Violet', 'Turner', 'F', '8/24/2007', 'Elmwood', 'ON', 'Lactose Intolerant', '138', '49'),
('16', 'Jonathan', 'Capone', 'M', '12/5/1948', 'Hamilton', 'ON', 'NKA', '191', '122'),
('17', 'Evan', 'Stone', 'M', '2/2/1978', 'Hamilton', 'ON', 'NKA', '144', '83'),
('18', 'John', 'Klump', 'M', '11/27/1960', 'Grimsby', 'ON', 'Penicillin', '183', '127'),
('19', 'Annie', 'Crandall', 'F', '9/9/1928', 'Burlington', 'ON', 'Penicillin', '166', '85'),
('20', 'Winnie', 'Munroe', 'F', '10/23/1983', 'Burlington', 'ON', 'NKA', '161', '69'),
('21', 'Mel', 'Johnson', 'M', '12/6/1952', 'Hamilton', 'ON', 'NULL', '189', '110'),
('22', 'Suzanne', 'Lovegood', 'F', '4/16/1948', 'Oakville', 'ON', 'Dust', '161', '61'),
('23', 'Agnes', 'Eckhart', 'F', '1/29/1983', 'Hamilton', 'ON', 'NKA', '167', '103'),
('24', 'Shaz', 'Granger', 'F', '11/6/1954', 'Hamilton', 'ON', 'NKA', '158', '62'),
('25', 'Will', 'Magnus', 'M', '1/20/1992', 'Hamilton', 'ON', 'NULL', '200', '113'),
('26', 'Dotty', 'McCrary', 'F', '3/14/1989', 'Hamilton', 'ON', 'Morphine', '168', '115'),
('27', 'Donna', 'Dean', 'F', '2/3/2012', 'Hamilton', 'ON', 'NKA', '97', '28'),
('28', 'Leo', 'Thackeray', 'M', '8/12/1972', 'Toronto', 'ON', 'NKA', '189', '120'),
('29', 'Shirley', 'Coo per', 'F', '3/9/1960', 'Hamilton', 'ON', 'ASA', '168', '87'),
('30', 'Patricia', 'Meedhan', 'F', '12/12/1992', 'Hamilton', 'ON', 'Penicillin', '168', '99'),
('31', 'Raylan', 'Rooney', 'M', '11/13/1979', 'Barrie', 'ON', 'NKA', '155', '87'),
('32', 'Will', 'Powers', 'M', '11/16/1979', 'Orangeville', 'ON', 'Demerol', '199', '97'),
('33', 'Henry', 'Garlick', 'M', '11/27/1968', 'Hamilton', 'ON', 'Servere Peanut Allergy', '192', '108'),
('34', 'Helga', 'Scotts', 'F', '3/3/1986', 'Hamilton', 'ON', 'Erythromycin', '153', '70'),
('35', 'Ann', 'Darrow', 'F', '9/17/1980', 'Toronto', 'ON', 'Salicylic Acid', '174', '93'),
('36', 'Nina', 'Cruz', 'F', '9/17/1980', 'Toronto', 'ON', 'Salicylic Acid', '154', '58'),
('37', 'Sasha', 'McGraw', 'M', '3/21/2006', 'Hamilton', 'ON', 'NULL', '146', '63'),
('38', 'Francis', 'Wilde', 'M', '8/17/1968', 'Hamilton', 'ON', 'Penicillin', '174', '72'),
('39', 'Art', 'Thomas', 'M', '12/13/1970', 'Hamilton', 'ON', 'NKA', '207', '112'),
('40', 'Claudia', 'Rams ey', 'F', '6/27/1977', 'Paris', 'ON', 'NKA', '147', '50'),
('41', 'Miranda', 'Wils on', 'F', '2/26/1977', 'Hamilton', 'ON', 'Seafood', '159', '58'),
('42', 'Jim', 'Haruko', 'M', '1/2/1969', 'Hamilton', 'ON', 'Penicillin', '202', '107'),
('43', 'Beanie', 'Brown', 'F', '3/21/1985', 'Hamilton', 'ON', 'NKA', '147', '57'),
('44', 'Temperance', 'Kelly', 'F', '1/2/2008', 'Hamilton', 'ON', 'Penicillin', '130', '47'),
('45', 'Hestia', 'Harrison', 'F', '12/10/1975', 'Delhi', 'ON', 'NKA', '146', '69'),
('46', 'Claudia', 'Hammond', 'F', '6/14/1994', 'Grimsby', 'ON', 'NKA', '145', '66'),
('47', 'Lloyd', 'Holloway', 'M', '5/2/1948', 'Paris', 'ON', 'NKA', '167', '64'),
('48', 'Baba', 'Yaga', 'F', '8/7/1979', 'Burlington', 'ON', 'NKA', '164', '93'),
('49', 'Alice', 'Pe trie', 'F', '5/6/1978', 'Hamilton', 'ON', 'Milk', '170', '106'),
('50', 'Vijay', 'Verma', 'M', '2/22/1978', 'Newmarket', 'ON', 'Ragweed', '182', '115'),
('51', 'Molly', 'McKinnon', 'F', '1/24/1951', 'Timmins', 'ON', 'Penicillin Diazepam', '170', '117'),
('52', 'Betty', 'Lew is', 'F', '3/31/1949', 'Hamilton', 'ON', 'NULL', '169', '89'),
('53', 'Rosco', 'Haruko', 'M', '2/13/1958', 'Brantford', 'ON', 'Penicillin', '158', '76'),
('54', 'Robert', 'Lang', 'M', '1/3/2005', 'Hamilton', 'ON', 'Eggs', '165', '69'),
('55', 'Jaki', 'Manu', 'M', '1/3/2005', 'Hamilton', 'ON', 'Eggs', '169', '70'),
('56', 'Tem', 'Clarke', 'M', '10/31/1980', 'Smithville', 'ON', 'NKA', '153', '74'),
('57', 'Alan', 'Gordon', 'M', '10/13/1986', 'Calgary', 'ON', 'NULL', '174', '69'),
('58', 'Joseph', 'Malvern', 'M', '10/19/1953', 'Dundas', 'ON', 'NKA', '190', '91'),
('59', 'Nea', 'Holl ins', 'F', '6/28/1973', 'Hamilton', 'ON', 'Penicillin', '165', '102'),
('60', 'Henry', 'Farrell', 'M', '7/17/1994', 'Oakville', 'ON', 'NKA', '159', '87'),
('61', 'Angela', 'Anderson', 'F', '12/18/1989', 'Bancroft', 'ON', 'NKA', '148', '71'),
('62', 'Walter', 'Bulstrode', 'M', '12/8/1957', 'Smithville', 'ON', 'Penicillin', '160', '73'),
('63', 'Penny', 'Wana wake', 'F', '6/22/1928', 'Dundas', 'ON', 'NKA', '152', '61'),
('64', 'Joyce', 'Ard en', 'F', '6/1/1952', 'Hamilton', 'ON', 'NKA', '170', '91'),
('65', 'Julie', 'Coo per', 'F', '10/11/2002', 'Ancaster', 'ON', 'Walnuts', '183', '69'),
('66', 'Sue', 'Tennison', 'F', '3/20/1950', 'Hamilton', 'ON', 'Codeine', '176', '96'),
('67', 'Adam', 'Crane', 'M', '12/30/2003', 'Pickering', 'ON', 'Penicillin', '166', '73'),
('68', 'Arnold', 'White', 'M', '10/2/1978', 'Hamilton', 'ON', 'NKA', '211', '107'),
('69', 'John', 'Henry', 'M', '5/15/1984', 'Hamilton', 'ON', 'Penicillin', '175', '77'),
('70', 'Tony', 'Powell', 'M', '5/21/1960', 'Tuscorora', 'ON', 'Sulfa Surgical Tape', '201', '116'),
('71', 'Caesar', 'Enrico', 'M', '7/13/1987', 'Hamilton', 'ON', 'Sulfa', '185', '122'),
('72', 'Ethel', 'Stillman', 'F', '5/18/1983', 'Burlington', 'ON', 'Codeine', '163', '88'),
('73', 'Alberto', 'Napoli', 'M', '5/18/1983', 'Burlington', 'ON', 'Codeine', '198', '110'),
('74', 'Elisa', 'Maza', 'F', '4/17/1934', 'Athens', 'ON', 'NKA', '149', '71'),
('75', 'Alexei', 'Franchetti', 'M', '11/3/1977', 'Saskatoon', 'SK', 'Sulpha', '183', '115'),
('76', 'Tristan', 'Sawyer', 'M', '3/23/1987', 'Edmonton', 'AB', 'NULL', '183', '128'),
('77', 'Elly', 'Kedward', 'F', '10/11/1987', 'Hamilton', 'ON', 'Almonds', '147', '67'),
('78', 'Fred', 'Banzai', 'M', '3/12/1984', 'Burlington', 'ON', 'Codeine', '153', '73'),
('79', 'Deborah', 'Stewart', 'F', '2/9/1989', 'Hamilton', 'ON', 'NKA', '180', '113'),
('80', 'Norton', 'Jenkins', 'M', '2/24/1987', 'Hamilton', 'ON', 'NKA', '172', '86'),
('81', 'Cordelia', 'Chase', 'F', '3/18/1978', 'Hamilton', 'ON', 'NKA', '144', '66'),
('82', 'Harris', 'Claibourne', 'M', '3/12/1939', 'Hamilton', 'ON', 'Penicillin', '175', '78'),
('83', 'Mimi', 'Tachikawa', 'F', '2/6/1947', 'Hamilton', 'ON', 'Penicillin', '179', '105'),
('84', 'Roderick', 'Shimura', 'M', '9/17/1988', 'Brantford', 'ON', 'NKA', '193', '122'),
('85', 'Dana', 'Spellman', 'F', '6/29/1958', 'Burlington', 'ON', 'Acetaminophen', '172', '95'),
('86', 'Howard', 'Saint', 'M', '1/12/1973', 'Stoney Creek', 'ON', 'Eggs', '187', '111'),
('87', 'Cassie', 'Hughes', 'F', '11/13/1978', 'Brantford', 'ON', 'NKA', '163', '97'),
('88', 'Marietta', 'Edgecombe', 'F', '12/26/1987', 'Ajax', 'ON', 'NKA', '154', '74'),
('89', 'Morgan', 'Graham', 'M', '7/23/2001', 'Hamilton', 'ON', 'NULL', '209', '91'),
('90', 'Mable', 'Graham', 'F', '6/21/1971', 'Kingston', 'ON', 'Feathers', '182', '82'),
('91', 'Bobbie', 'Spencer', 'F', '8/30/2007', 'Hamilton', 'ON', 'NKA', '130', '46'),
('92', 'Daphne', 'Waturs', 'F', '8/31/1979', 'Brantford', 'ON', 'NKA', '169', '100'),
('93', 'Basil', 'Preston', 'M', '4/3/1978', 'Toronto', 'ON', 'NKA', '150', '71'),
('94', 'Lady', 'Prefect', 'F', '3/22/1978', 'Paris', 'ON', 'Sulfa', '145', '64'),
('95', 'Violet', 'Strange', 'F', '6/19/1978', 'Hamilton', 'ON', 'Penicillin', '146', '70'),
('96', 'Harry', 'Sigel', 'M', '2/5/1989', 'Hamilton', 'ON', 'Sulfa', '148', '62'),
('97', 'Harper', 'Burdock', 'F', '1/29/1961', 'Hamilton', 'ON', 'ASA', '166', '93'),
('98', 'Douglas', 'Murphy', 'M', '11/11/1968', 'Burlington', 'ON', 'NULL', '207', '108'),
('99', 'Amy', 'Meedhan', 'F', '8/19/1991', 'Hamilton', 'ON', 'Penicillin', '151', '61'),
('100', 'Jin', 'Sigel', 'M', '8/24/1938', 'Stoney Creek', 'ON', 'NKA', '168', '78');

INSERT INTO ADMISSIONS (patient_id, admission_date, discharge_date, primary_diagnosis, secondary_diagnoses, attending_physician_id, nursing_unit_id, room, bed)
VALUES ('1', '11/2/2017', '11/4/2017', 'Dementia', 'Cataracts', '21', '1EAST', '4', '2'),
('1', '9/16/2017', '9/16/2017', 'Abdominal Pain', 'Inflammation Of The Gall Bladder', '24', 'CCU', '2', '2'),
('3', '1/20/2018', '1/25/2018', 'Child Birth', 'Low Iron (Iron Defency Anemia)', '2', '3NORTH', '3', '1'),
('3', '10/17/2017', '10/23/2017', 'Osteoarthritis Right Knee', 'Total Right Knee Replacement', '8', 'CCU', '5', '2'),
('6', '6/9/2017', '6/11/2017', 'Pregnancy', 'Abruptio Placentae', '3', 'OR', '4', '1'),
('6', '11/4/2017', '11/5/2017', 'Congestive Heart Failure', 'Coronary Artery Disease', '22', '2EAST', '1', '1'),
('7', '6/20/2017', '6/29/2017', 'Hyperemesis', 'Pregnancy', '8', '1SOUTH', '1', '2'),
('8', '9/14/2017', '9/17/2017', 'Pulmonary Edema', 'Myocardial Infarction', '6', '1WEST', '3', '1'),
('9', '2/26/2018', '3/5/2018', 'Profound Depression', 'NULL', '8', 'ICU', '4', '2'),
('9', '12/27/2017', '12/27/2017', 'Cancer', 'Dehydration', '19', 'ICU', '5', '1'),
('10', '12/26/2017', '1/1/2018', 'Hysterectomy', 'NULL', '14', '2WEST', '2', '1'),
('10', '2/23/2018', '2/23/2018', 'Gall Stones', 'High Blood Pressure', '27', '1NORTH', '2', '1'),
('11', '12/10/2017', '12/12/2017', 'Intestinal Obstruction Hirschsprungs Disease', 'NULL', '15', '1SOUTH', '5', '2'),
('12', '4/23/2018', '4/30/2018', 'Congestive Heart Failure', 'Diabetes', '21', '3NORTH', '5', '1'),
('13', '4/24/2018', '4/27/2018', 'Myocardial Infarction', 'Hypertension', '1', '3EAST', '4', '2'),
('15', '9/27/2017', '10/1/2017', 'Congestive Heart Failure', 'Sacral Decubitus Ulcer', '5', '3WEST', '5', '2'),
('16', '1/6/2018', '1/10/2018', 'Complete Unilateral Cleft Lip 7 Cleft Palate', 'Aspiration', '6', '2NORTH', '1', '2'),
('16', '3/31/2018', '4/9/2018', 'M.V.A', 'Fracture Left Femer, Fracture Left Wrist', '12', '2EAST', '5', '2'),
('17', '2/28/2018', '2/28/2018', 'Cystic Fibrosis', 'Bronchitis, Hypothyroidism', '9', 'CCU', '2', '1'),
('17', '12/8/2017', '12/10/2017', 'Hypertrophy Of Prostate Gland', 'NULL', '2', '2WEST', '2', '2'),
('18', '6/28/2017', '7/1/2017', 'Glomerulonephritis', 'Cystitis', '3', '3SOUTH', '3', '2'),
('18', '4/21/2018', '4/30/2018', 'Myocardial Infarction', 'Leg Laceration', '10', '1SOUTH', '3', '1'),
('20', '1/26/2018', '1/31/2018', 'MVA HI', 'Internal Bleeding', '15', '2SOUTH', '5', '2'),
('21', '6/3/2017', '6/6/2017', 'Crohns Disease', 'Arthritis', '12', '3SOUTH', '1', '1'),
('21', '11/15/2017', '11/23/2017', 'Melanoma, Cancer', 'Trouble', '12', '3EAST', '2', '2'),
('22', '7/13/2017', '7/16/2017', 'Dementia', 'Cataracts', '8', '1SOUTH', '3', '1'),
('22', '10/31/2017', '11/3/2017', 'Congestive Heart Failure', 'Decubitusulcers', '13', '1WEST', '4', '2'),
('23', '4/3/2018', '4/11/2018', '2nd Degree Burn Of Face', 'Diabetes Mellitus', '26', '1NORTH', '1', '2'),
('23', '1/14/2018', '1/18/2018', 'Acute Bronchitis', 'Cough-Uariat', '4', '1WEST', '1', '2'),
('24', '3/14/2018', '3/18/2018', 'Cardiac Arrest', 'Cardiac Ischemia', '21', '2SOUTH', '5', '2'),
('24', '4/30/2018', '5/6/2018', 'C. O. P. D.', 'Chronic Bronchitis', '1', '2SOUTH', '3', '1'),
('27', '9/6/2017', '9/8/2017', 'Congestive Heart Failure', 'Sacral Decubitus Ulcer', '12', 'ICU', '1', '2'),
('28', '3/26/2018', '3/26/2018', 'Obstructive Nephropathy', 'Ectopic Hypertension', '26', '3EAST', '3', '2'),
('29', '1/8/2018', '1/10/2018', 'Hysterectomy', 'NULL', '4', '3EAST', '5', '2'),
('31', '9/22/2017', '9/22/2017', 'Chestpain Not Yet Diagnosed', 'Unstable Angina', '19', '2WEST', '1', '1'),
('32', '5/14/2018', '5/19/2018', 'Chestpain Not Yet Diagnosed', 'Unstable Angina', '22', '2NORTH', '5', '2'),
('32', '9/28/2017', '10/7/2017', 'Congestive Heart Failure', 'Decubitusulcers', '12', '1SOUTH', '5', '2'),
('33', '5/27/2018', '5/28/2018', 'Rt. Nephrectomy', 'CA. Rt. Kidney', '14', '2SOUTH', '1', '1'),
('34', '12/2/2017', '12/3/2017', 'Chronic Bronchitis', 'C.O.P.D.', '11', '2NORTH', '4', '1'),
('34', '12/20/2017', '12/22/2017', 'Fractured Femur', 'NULL', '17', '2SOUTH', '2', '2'),
('35', '11/25/2017', '11/28/2017', 'Fracture Right Distal Radius', 'Diabetes, Mild Hypertension', '7', '2EAST', '1', '1'),
('35', '6/1/2018', '', 'Ovarian Dermoid-Cyct', 'Urinary Retention', '8', '3WEST', '3', '2'),
('36', '5/4/2018', '5/8/2018', 'Hypertrophy Of Prostate Gland', 'NULL', '20', '2NORTH', '4', '1'),
('37', '3/5/2018', '3/14/2018', 'Myocardial Infarction (MI)', 'Pulmonary Hypertension', '27', '3NORTH', '3', '2'),
('37', '11/4/2017', '11/6/2017', 'Severe Pain + Tenderness In Left Calf', 'CAD, Pvd, Hypertension Diabetes Mellitus', '3', '2WEST', '4', '1'),
('38', '11/21/2017', '11/23/2017', 'Hunting Disease', 'Subdural Hematoma', '6', '1NORTH', '5', '1'),
('39', '3/9/2018', '3/18/2018', 'COPD', 'Chronic Bronchitis', '12', '2WEST', '4', '2'),
('39', '1/13/2018', '1/14/2018', 'Congestive Heart Failure', 'COPD - Asthma', '12', '1SOUTH', '4', '1'),
('40', '11/29/2017', '11/30/2017', 'Unstable Angina', 'Asthma', '13', '1EAST', '3', '1'),
('40', '8/31/2017', '9/8/2017', 'Fractured Left Hip Due To Slip And Fall On Ice', 'Diabetes, Abdominal Pain', '5', '1SOUTH', '1', '1'),
('41', '6/9/2017', '6/17/2017', 'Broken Rt Femur', 'Diabetes', '20', '1SOUTH', '2', '1'),
('45', '11/11/2017', '11/19/2017', 'Pneumonia', 'Nil', '6', '1WEST', '2', '2'),
('46', '12/28/2017', '1/2/2018', 'Pregnant', 'NULL', '15', '1WEST', '5', '2'),
('46', '6/4/2017', '6/12/2017', 'Quarian Cyst', 'NULL', '22', 'OR', '2', '1'),
('47', '1/29/2018', '2/4/2018', 'Cardiovascular Disease', 'DIC', '3', '2EAST', '2', '2'),
('48', '8/11/2017', '8/14/2017', 'Chest Pain', 'Chronic Obstructive Pulmonary Disease', '11', 'ER', '3', '2'),
('49', '6/20/2017', '6/26/2017', 'Left Shoulder Rotator Cuff Repair', 'Infection Of Shoulder Muscle; Alteration In Align', '7', '3NORTH', '4', '1'),
('51', '7/12/2017', '7/14/2017', 'Gastoric Ulcer', 'Severe Stomach Pains', '1', '2EAST', '5', '2'),
('51', '11/1/2017', '11/7/2017', 'Impaired Gas Exchange', 'Urinary Tract Infection', '14', 'CCU', '5', '1'),
('52', '5/6/2018', '5/10/2018', 'Ruptured Fallopian Tube', 'Ectopic Pregnancy', '14', '2SOUTH', '5', '2'),
('53', '10/20/2017', '10/20/2017', 'Chronic Caugh Disease', 'Siffolis', '8', '1EAST', '1', '1'),
('53', '11/13/2017', '11/18/2017', 'Congestive Heart Failure', 'Diabetes', '2', '2SOUTH', '1', '1'),
('54', '10/27/2017', '10/30/2017', 'Lwr Right Quad Pain That Radiates Through Abdomen', 'Histiry Of Duodemal Ulcer', '21', '3NORTH', '3', '2'),
('54', '4/3/2018', '4/3/2018', 'Gall Stones', 'High Blood Pressure', '21', 'ICU', '2', '2'),
('56', '12/7/2017', '12/9/2017', 'Pregnancy', 'Nil', '25', 'ICU', '4', '1'),
('56', '10/3/2017', '10/12/2017', 'Stomache Pain', 'Kidney Stones', '26', '1NORTH', '2', '2'),
('58', '11/8/2017', '11/11/2017', 'Abdominal Pain', 'Inflammation Of The Gall Bladder', '14', '3WEST', '3', '1'),
('59', '11/4/2017', '11/11/2017', 'Hunting Disease', 'Subdural Hematoma', '18', 'CCU', '3', '2'),
('60', '9/8/2017', '9/9/2017', 'Fractured Hip (Right)', 'Osteoporosis', '2', '2EAST', '5', '2'),
('60', '3/13/2018', '3/14/2018', 'Uterine Fibroid', 'NULL', '25', '2EAST', '2', '2'),
('61', '8/29/2017', '9/1/2017', 'Abdominal Pain', 'Appendectomy', '20', 'ER', '2', '1'),
('61', '11/12/2017', '11/15/2017', 'Fractured "L" Femur', 'Epilepsy', '16', '3NORTH', '1', '1'),
('62', '10/11/2017', '10/15/2017', 'Fractured Right Tibia', 'Pain', '14', 'OR', '4', '1'),
('62', '12/7/2017', '12/12/2017', 'Hiatal Hernia', 'Obesity, High Blood Pressure', '2', '3SOUTH', '5', '1'),
('63', '8/24/2017', '8/27/2017', 'Abdominal Pain', 'Inflammation Of The Gall Bladder', '21', '2WEST', '4', '2'),
('64', '5/1/2018', '5/10/2018', 'Scatica', 'Spinal Stenosis', '17', '2NORTH', '5', '1'),
('66', '5/6/2018', '5/10/2018', 'Congestive Heart Failure', 'Diabetes', '17', '1EAST', '2', '1'),
('67', '10/16/2017', '10/25/2017', 'Fractured L. Tibia', 'NULL', '15', '3NORTH', '1', '2'),
('67', '2/5/2018', '2/11/2018', 'Myocardial Infarction', 'NULL', '21', '3WEST', '4', '2'),
('68', '11/28/2017', '12/3/2017', 'Atrial Arrhythmias', 'Heart Failure', '12', '2NORTH', '5', '2'),
('68', '11/1/2017', '11/5/2017', 'Cystic Fibrosis', 'Bronchitis, Hypothyroidism', '11', '1SOUTH', '4', '1'),
('69', '4/28/2018', '5/4/2018', 'Ovarian Cancer', 'Hypertension, Asthmatic', '12', '2SOUTH', '2', '2'),
('70', '7/13/2017', '7/13/2017', 'Bipolar Affective Disorder', 'Asthma', '20', '3WEST', '5', '1'),
('71', '8/3/2017', '8/7/2017', 'Rt. Knee Replacement', 'Diabetes Mullitus (Iddm)', '10', '2EAST', '5', '2'),
('71', '11/17/2017', '11/23/2017', 'Chest Pain', 'NULL', '20', '2EAST', '1', '1'),
('73', '1/20/2018', '1/23/2018', 'Cerebral Vascular Aneurys,', 'Cancer Of Ovaries', '6', '1WEST', '3', '2'),
('73', '3/5/2018', '3/11/2018', 'Congestive Heart Failure', 'Myocardial Infarction', '17', '1NORTH', '1', '1'),
('74', '10/31/2017', '11/2/2017', 'Ovarian Cyst', 'Hysterictomy', '25', '3EAST', '2', '1'),
('75', '10/9/2017', '10/18/2017', 'Congestive Heart Failure', 'Chronic Obstructive Pulmonary Disease', '7', 'ER', '1', '2'),
('76', '9/21/2017', '9/29/2017', 'M.V.A', 'Fracture Left Femer, Fracture Left Wrist', '11', 'CCU', '2', '2'),
('76', '1/8/2018', '1/16/2018', 'Obstructive Nephropathy', 'Ectopic Hypertension', '23', '1WEST', '4', '2'),
('77', '6/14/2017', '6/22/2017', 'Full Term Delivery', 'Breech Presentation', '18', '2WEST', '1', '2'),
('77', '10/21/2017', '10/29/2017', 'Gastoric Ulcer', 'Severe Stomach Pains', '2', '3EAST', '1', '1'),
('78', '6/13/2017', '6/13/2017', 'Major Burn To The Anterior Thoracic Region', 'Ruptured Spleen', '17', '3EAST', '1', '2'),
('79', '2/15/2018', '2/18/2018', 'Ineffective Breathin Pattern R/T Fluid Accumulatio', 'Congestive Heart Failure', '10', '2EAST', '3', '2'),
('79', '2/24/2018', '3/1/2018', 'Amigima', 'NULL', '27', 'ICU', '2', '2'),
('81', '12/3/2017', '12/7/2017', 'Crohns Disease', 'Malnutrition', '27', '1WEST', '3', '2'),
('81', '4/23/2018', '4/29/2018', 'Crohns', 'Angina', '22', '2SOUTH', '1', '1'),
('82', '1/2/2018', '1/3/2018', 'Undiagnosed Chest Pain', 'NULL', '9', 'OR', '4', '1'),
('83', '5/9/2018', '5/13/2018', 'Breast Cancer', 'Epilepsy', '26', '2EAST', '1', '2');

INSERT INTO PHYSICIANS (physician_id, first_name, last_name, speciality)
VALUES ('2', 'Emmett', 'Brown', 'Cardiologist'),
('22', 'Simon', 'Tam', 'Cardiologist'),
('12', 'Abigail', 'Bartlet', 'Cardiovascular Surgeon'),
('26', 'Wellington', 'Yueh', 'Cardiovascular Surgeon'),
('16', 'Henry', 'Blake', 'Gastroenterologist'),
('5', 'Julius', 'Hibbert', 'Gastroenterologist'),
('20', 'Rajesh', 'Koothrappali', 'General Surgeon'),
('3', 'Samantha', 'Carter', 'General Surgeon'),
('14', 'Lilith', 'Sternin', 'Gerontologist'),
('18', 'Yuri', 'Zhivago', 'Gerontologist'),
('1', 'Remy', 'Hadley', 'Internist'),
('24', 'Katherine', 'Pulaski', 'Neurologist'),
('9', 'Leslie', 'Winkle', 'Neurologist'),
('17', 'Cristina', 'Yang', 'Nuclear Medicine'),
('13', 'Gregory', 'House', 'Nuclear Medicine'),
('4', 'Beverly', 'Crusher', 'Obstetrician/Gynecologist'),
('21', 'Lisa', 'Cuddy', 'Obstetrician/Gynecologist'),
('19', 'Henry', 'Jones', 'Oncologist'),
('7', 'Leonard', 'Hofstadter', 'Oncologist'),
('10', 'Dana', 'Scully', 'Orthopaedic Surgeon'),
('23', 'Doogie', 'Howser', 'Pediatrician'),
('8', 'Nick', 'Riviera', 'Pediatrician'),
('25', 'Allison', 'Cameron', 'Psychiatrist'),
('6', 'Sheldon', 'Cooper', 'Psychiatrist'),
('11', 'Benjamin', 'Pierce', 'Respirologist'),
('27', 'Christine', 'Chapel', 'Respirologist'),
('15', 'Henry', 'Higgins', 'Urologist');

INSERT INTO NURSING_UNITS (nursing_unit_id, specialty, manager_first_name, manager_last_name, beds, extension)
VALUES ('1EAST', 'Gynecology', 'Joyce', 'Davenport', '10', '3217'),
('1NORTH', 'Pediatrics', 'Marsha', 'Gravis', '10', '3214'),
('1SOUTH', 'Maternity', 'Charlene', 'Spinoza', '10', '3045'),
('1WEST', 'General Surgery', 'Ruth', 'Doxtater', '10', '3209'),
('2EAST', 'Medicine', 'Alice', 'MacKenzie', '10', '3077'),
('2NORTH', 'Orthopedics', 'Jasmine', 'Fox', '10', '3185'),
('2SOUTH', 'Short Stay', 'Barbara', 'Parsons', '10', '3153'),
('2WEST', 'Geriatrics', 'Matilda', 'Henry', '10', '3748'),
('3EAST', 'Neurology', 'Shirley', 'Piasecki', '10', '3524'),
('3NORTH', 'Psychiatry', 'Leslie', 'Charlong', '10', '3562'),
('3SOUTH', 'Oncology', 'Gail', 'Brown', '10', '3519'),
('3WEST', 'Respirology', 'Pat', 'Waschuk', '10', '3548'),
('CCU', 'Coronary Care Unit', 'Della', 'Marcaccio', '5', '3149'),
('ER', 'Emergency Room', 'Shirley', 'Patterson', '5', '3033'),
('ICU', 'Intensive Care Unit', 'Mary', 'Newport',	'5', '3155'),
('OR', 'Operating Room', 'Debra', 'Brock', '5', '3029');

INSERT INTO PATIENTS (patient_id, first_name, last_name, gender, birth_date, city, province_id, allergies, height, weight)
VALUES ('101', 'Hector', 'Dominguez', 'M', '2000-10-28', 'Cd Madero', 'ON', NULL, '185', '85')

UPDATE PATIENTS 
SET allergies = 'Penicillin', city = 'Hamilton'
WHERE patient_id = 101

INSERT INTO ADMISSIONS (patient_id, admission_date, discharge_date, primary_diagnosis, secondary_diagnoses, attending_physician_id, nursing_unit_id, room, bed)
VALUES (101, DATEADD(YEAR, -1, GETDATE()), DATEADD (MONTH, -10, GETDATE()), 'Abdominal Pain', 'Inflammation Of The Gall Bladder', '24','CCU', '2', '2')

INSERT INTO PHYSICIANS (physician_id, first_name, last_name, speciality)
VALUES ('50', 'Hector', 'Josue', 'Endocrinologist')

SELECT * FROM PATIENTS;
SELECT * FROM ADMISSIONS;
SELECT * FROM PHYSICIANS;
SELECT * FROM NURSING_UNITS;
