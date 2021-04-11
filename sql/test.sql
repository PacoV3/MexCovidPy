USE MexCovidPy

SELECT TOP 1 * FROM UpdateDates WHERE DateUpdate = '05/17/20'

SELECT UpdateDateId, DateUpdate
FROM MexCovidPy.dbo.UpdateDates
WHERE DateUpdate = '05/17/2021';

SELECT * FROM UpdateDates

TRUNCATE TABLE UpdateDates
