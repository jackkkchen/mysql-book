-- 创建患者表格
CREATE TABLE Patients (
    subject_id INTEGER PRIMARY KEY,
    gender TEXT,
    dob TEXT,
    dod TEXT
);

-- 创建住院信息表格
CREATE TABLE Admissions (
    hadm_id INTEGER PRIMARY KEY,
    subject_id INTEGER,
    admittime TEXT,
    dischtime TEXT,
    diagnosis TEXT,
    FOREIGN KEY (subject_id) REFERENCES Patients(subject_id)
);

-- 创建重症监护病房信息表格
CREATE TABLE ICUStays (
    icustay_id INTEGER PRIMARY KEY,
    hadm_id INTEGER,
    intime TEXT,
    outtime TEXT,
    FOREIGN KEY (hadm_id) REFERENCES Admissions(hadm_id)
);

-- 创建临床事件表格
CREATE TABLE Chartevents (
    subject_id INTEGER,
    hadm_id INTEGER,
    icustay_id INTEGER,
    charttime TEXT,
    itemid INTEGER,
    value TEXT,
    valuenum REAL,
    valueuom TEXT,
    FOREIGN KEY (subject_id) REFERENCES Patients(subject_id),
    FOREIGN KEY (hadm_id) REFERENCES Admissions(hadm_id),
    FOREIGN KEY (icustay_id) REFERENCES ICUStays(icustay_id)
);

-- 创建实验室检查结果表格
CREATE TABLE Labevents (
    subject_id INTEGER,
    hadm_id INTEGER,
    itemid INTEGER,
    charttime TEXT,
    value TEXT,
    valuenum REAL,
    valueuom TEXT,
    FOREIGN KEY (subject_id) REFERENCES Patients(subject_id),
    FOREIGN KEY (hadm_id) REFERENCES Admissions(hadm_id)
);

-- 创建药物处方表格
CREATE TABLE Prescriptions (
    subject_id INTEGER,
    hadm_id INTEGER,
    starttime TEXT,
    endtime TEXT,
    drug TEXT,
    dose_val_rx REAL,
    dose_unit_rx TEXT,
    route TEXT,
    FOREIGN KEY (subject_id) REFERENCES Patients(subject_id),
    FOREIGN KEY (hadm_id) REFERENCES Admissions(hadm_id)
);

-- 创建临床注记表格
CREATE TABLE Notes (
    subject_id INTEGER,
    hadm_id INTEGER,
    chartdate TEXT,
    category TEXT,
    description TEXT,
    text TEXT,
    FOREIGN KEY (subject_id) REFERENCES Patients(subject_id),
    FOREIGN KEY (hadm_id) REFERENCES Admissions(hadm_id)
);

-- Insert data as before, SQLite supports the same INSERT syntax as MySQL

-- 插入示例患者数据
INSERT INTO Patients (subject_id, gender, dob, dod)
VALUES
    (1, 'M', '1980-01-15', NULL),
    (2, 'F', '1975-05-20', '2022-03-10'),
    (3, 'M', '1992-09-03', NULL);

-- 插入示例住院数据、ICU数据、临床事件数据、实验室检查结果、药物处方数据、临床注记数据

-- 插入住院信息
INSERT INTO Admissions (hadm_id, subject_id, admittime, dischtime, diagnosis)
VALUES
    (101, 1, '2022-01-10 08:00:00', '2022-01-20 10:30:00', '心脏病'),
    (102, 2, '2022-02-15 14:45:00', '2022-02-25 11:20:00', '肺炎'),
    (103, 3, '2022-03-05 11:30:00', '2022-03-15 09:15:00', '糖尿病');

-- 插入重症监护病房信息
INSERT INTO ICUStays (icustay_id, hadm_id, intime, outtime)
VALUES
    (201, 101, '2022-01-11 09:00:00', '2022-01-15 16:30:00'),
    (202, 102, '2022-02-16 15:30:00', '2022-02-18 08:45:00'),
    (203, 103, '2022-03-06 10:15:00', '2022-03-07 17:20:00');

-- 插入临床事件
INSERT INTO Chartevents (subject_id, hadm_id, icustay_id, charttime, itemid, value, valuenum, valueuom)
VALUES
    (1, 101, 201, '2022-01-12 12:30:00', 101, '正常', NULL, NULL),
    (2, 102, 202, '2022-02-17 18:20:00', 102, '异常', 120, 'bpm'),
    (3, 103, 203, '2022-03-07 11:10:00', 103, '正常', NULL, NULL);

-- 插入实验室检查结果
INSERT INTO Labevents (subject_id, hadm_id, itemid, charttime, value, valuenum, valueuom)
VALUES
    (1, 101, 201, '2022-01-13 09:45:00', '正常', NULL, NULL),
    (2, 102, 202, '2022-02-18 14:15:00', '高', 150, 'mg/dL'),
    (3, 103, 203, '2022-03-08 08:30:00', '正常', NULL, NULL);

-- 插入药物处方
INSERT INTO Prescriptions (subject_id, hadm_id, starttime, endtime, drug, dose_val_rx, dose_unit_rx, route)
VALUES
    (1, 101, '2022-01-12 10:00:00', '2022-01-15 14:00:00', '阿司匹林', 100, 'mg', '口服'),
    (2, 102, '2022-02-17 16:30:00', '2022-02-20 12:00:00', '抗生素', 250, 'mg', '静脉注射'),
    (3, 103, '2022-03-07 12:45:00', '2022-03-08 09:30:00', '胰岛素', 10, 'IU', '皮下注射');

-- 插入临床注记
INSERT INTO Notes (subject_id, hadm_id, chartdate, category, description, text)
VALUES
    (1, 101, '2022-01-11', '护理记录', '患者状态良好', '患者无不适症状，正常进食和排尿。'),
    (2, 102, '2022-02-16', '护理记录', '患者氧气饱和度降低', '患者呼吸急促，氧气饱和度下降至90%。'),
    (3, 103, '2022-03-06', '护理记录', '患者血糖监测结果', '患者血糖测量正常，每日三次注射胰岛素。');

