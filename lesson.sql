/*
Example lesson stub
*/

/* SELECT
	ps.PatientId
    ,ps.AdmittedDate
 	,ps.DischargeDate
 	,ps.Hospital
 	,ps.Ward
 	,DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) + 1 AS LengthOfStay
	,DATEADD(MONTH, 3, ps.DischargeDate) AS AppointmentDate
FROM
	PatientStay ps
WHERE
 ps.Hospital IN ( 'Oxleas', 'PRUH' )
	AND ps.AdmittedDate BETWEEN '2024-02-01' AND '2024-02-28'
	AND ps.Ward LIKE '%Surgery'
ORDER BY
 ps.AdmittedDate DESC
 , ps.PatientId DESC; */

--***************************************
--***************************************

-- SELECT
-- 	ps.Hospital
-- 	,ps.Ward
--  	,COUNT(*) AS NumberOfAdmissions
-- 	,SUM(ps.Tariff) AS TotalTariff
-- FROM
-- 	PatientStay ps
-- GROUP BY
--  ps.Hospital
-- ,ps.Ward
-- -- HAVING
-- -- COUNT(*) > 10
-- ORDER BY
--  NumberOfAdmissions DESC;

--  /* List airports. Show the following columns: ident, iata_code, name, latitude_deg, longitude_deg, type, iso_country
-- Filter to those airports with
-- a type of ‘large_airport’
-- a latitude_deg between 49 and 54 degrees
-- an iso_country of ‘GB’
-- Order from the most northern airports to most southern airports

SELECT
	a.ident
	,a.iata_code
	,a.name
	,a.latitude_deg
	,a.longitude_deg
	,a.type
	,a.iso_country
FROM
	dbo.airports AS a
WHERE a.type = 'large_airport'
	AND a.latitude_deg BETWEEN 49 AND 54
	AND a.iso_country = 'GB'
ORDER BY a.latitude_deg DESC;


