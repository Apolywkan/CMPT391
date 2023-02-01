--Populate Prereq table--------------------------------------------------

delete from Prereq where CourseID != ''


INSERT INTO Prereq VALUES 
('BUSN340', 'BUSN100'),
('BUSN340', 'BUSN160'),
('BUSN340', 'BUSN280'),
('CMPT310','CMPT130'),
('CMPT310','CMPT100'),
('CMPT310','CMPT250'),
('CMPT340','CMPT100'),
('CMPT250','CMPT100'),
('MATH340','MATH310'),
('MATH340','MATH280'),
('MATH340','MATH100')
