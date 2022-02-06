INSERT INTO `jobs` (name, label) VALUES
  ('offpolice','Off-Duty'),
  ('offambulance','Off-Duty')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('offpolice',0,'offpolice','Recruit',12,'{}','{}'),
  ('offpolice',1,'offpolice','Officer',24,'{}','{}'),
  ('offpolice',2,'offpolice','Detective',36,'{}','{}'),
  ('offpolice',3,'offpolice','Lieutenant',48,'{}','{}'),
  ('offpolice',4,'offpolice','Boss',0,'{}','{}'),
  ('offambulance',0,'offambulance','Recruit',12,'{}','{}'),
  ('offambulance',1,'offambulance','Doctor',24,'{}','{}'),
  ('offambulance',2,'offambulance','Chief',36,'{}','{}'),
  ('offambulance',3,'offambulance','Boss',48,'{}','{}')
;