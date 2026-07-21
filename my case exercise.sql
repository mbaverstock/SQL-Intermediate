/*
SQL Course - CASE Exercise
*/

-- Simple CASE form:   CASE <column> WHEN <value> THEN <result> ... ELSE <result> END
-- Searched CASE form: CASE WHEN <condition> THEN <result> ... ELSE <result> END

/*
Create a new column HospitalLocation
Kings College is Urban, other hospitals are Rural
Use the simple CASE form
*/

SELECT
    ps.PatientId
    ,ps.Hospital
    -- ,'???' AS HospitalLocation
    ,CASE ps.Hospital
        WHEN 'Kings College' THEN 'Urban'
        ELSE 'Rural'
    END AS HospitalLocation
FROM
    dbo.PatientStay ps
ORDER BY
    HospitalLocation;

/*
Create a new column WardType
Any ward that contains 'Surgery' is 'Surgical', otherwise 'Non Surgical'
Use the searched CASE form
*/

SELECT
    ps.PatientId
    ,ps.Hospital
    ,ps.Ward
    -- ,'???' AS WardType
    ,CASE WHEN
        ps.Ward LIKE '%Surgery%' THEN 'Surgical' 
        ELSE 'Non Surgical'
    END AS wardtype
FROM
    dbo.PatientStay ps
ORDER BY
    WardType;

/*
Create a new column PatientTariffGroup
A patient with a Tariff of 7 or more is in the 'High Tariff' group
A patient with a Tariff of 4 or more but below 7 is in the 'Medium Tariff' group
A patient with a Tariff below 4 is in the 'Low Tariff' group

Optional advanced question: how many patients are in each PatientTariffGroup?
*/

SELECT
    ps.PatientId
    ,ps.AdmittedDate
    ,ps.Tariff
    -- ,'???' AS PatientTariffGroup
    ,CASE 
        WHEN ps.Tariff >= 7 THEN 'High Tariff'
        WHEN ps.Tariff >= 4 THEN 'Medium Tariff'
        ELSE 'Low Tariff'
    END AS PatientTariffGroup
FROM
    dbo.PatientStay AS ps
ORDER BY
    PatientTariffGroup DESC
    ,ps.Tariff DESC
    ,ps.PatientId DESC;