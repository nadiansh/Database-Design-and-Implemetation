
-- Sample Queries for DentalOffice Database

-- 1. List all appointments with doctor and patient names
SELECT 
    a.AppointmentID,
    CONCAT(p.FirstName, ' ', p.LastName) AS PatientName,
    CONCAT(d.FirstName, ' ', d.LastName) AS DoctorName,
    t.TreatmentName,
    a.AppointmentDate,
    a.Notes
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
JOIN Treatments t ON a.TreatmentID = t.TreatmentID;

-- 2. Get total payments received per payment method
SELECT 
    Method,
    SUM(Amount) AS TotalAmount
FROM Payments
GROUP BY Method;

-- 3. Find patients who received treatments costing more than $500
SELECT 
    DISTINCT p.PatientID,
    p.FirstName,
    p.LastName,
    t.TreatmentName,
    t.Cost
FROM Patients p
JOIN Appointments a ON p.PatientID = a.PatientID
JOIN Treatments t ON a.TreatmentID = t.TreatmentID
WHERE t.Cost > 500;

-- 4. List doctors and how many appointments they have
SELECT 
    d.DoctorID,
    CONCAT(d.FirstName, ' ', d.LastName) AS DoctorName,
    COUNT(a.AppointmentID) AS TotalAppointments
FROM Doctors d
LEFT JOIN Appointments a ON d.DoctorID = a.DoctorID
GROUP BY d.DoctorID;

-- 5. View all payments made by a specific patient
SELECT 
    p.FirstName,
    p.LastName,
    pay.Amount,
    pay.PaymentDate,
    pay.Method,
    pay.Notes
FROM Payments pay
JOIN Patients p ON pay.PatientID = p.PatientID
WHERE p.PatientID = 3;
