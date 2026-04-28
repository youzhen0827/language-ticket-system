DROP DATABASE IF EXISTS 語言購票系統;
CREATE DATABASE 語言購票系統 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE 語言購票系統;

CREATE TABLE 使用者 (
    身分證字號 CHAR(10) NOT NULL PRIMARY KEY,
    姓名 NVARCHAR(20) NOT NULL,
    電子郵件 NVARCHAR(30) NOT NULL,
    語言 NVARCHAR(10) NOT NULL
);

CREATE TABLE 主辦方 (
    主辦方ID CHAR(8) NOT NULL PRIMARY KEY,
    發佈活動 NVARCHAR(30) NOT NULL,
    設定票價 NVARCHAR(20) NOT NULL,
    銷售數據 NVARCHAR(25) NOT NULL,
    收入 CHAR(10) NOT NULL
);

CREATE TABLE 訂單 (
    訂單ID CHAR(8) NOT NULL PRIMARY KEY,
    維護票券 NVARCHAR(20) NOT NULL,
    提供多種語系 NVARCHAR(20) NOT NULL,
    支付方式 NVARCHAR(20) NOT NULL,
    明細 NVARCHAR(50) NOT NULL,
    記錄購物車 NVARCHAR(30) NOT NULL,
    多語言 NVARCHAR(10) NOT NULL
);

CREATE TABLE 支付 (
    支付ID CHAR(8) NOT NULL PRIMARY KEY,
    支付金額 INT NOT NULL,
    支付時間 DATETIME NOT NULL,
    票ID CHAR(8) NOT NULL,
    支付方式 NVARCHAR(20) NOT NULL
);

INSERT INTO 使用者 VALUES
('A123456789', '王小明', 'wang@example.com', '中文'),
('B987654321', '李小英', 'li@example.com', '英文'),
('C111122222', '陳大文', 'chen@example.com', '日文'),
('D333344445', '林曉芬', 'lin@example.com', '韓文'),
('E555566677', '黃志明', 'huang@example.com', '法文'),
('F777788899', '周玉梅', 'chou@example.com', '德文');

INSERT INTO 主辦方 VALUES
('ORG00001', '德國歌劇', 'NT$300', '5000 張', '1500000'),
('ORG00002', '林小四演唱會', 'NT$500', '3200 張', '1600000'),
('ORG00003', '日本能劇表演', 'NT$400', '4200 張', '1680000'),
('ORG00004', '韓國傳統舞', 'NT$250', '3800 張', '950000'),
('ORG00005', '法國舞台劇', 'NT$550', '2900 張', '1595000');

INSERT INTO 訂單 VALUES
('ORD00001', '一般票', '中英日', '信用卡', '1 張中文票', '加入購物車', '中文'),
('ORD00002', '學生票', '中英', 'LinePay', '2 張英文票', '加入購物車', '英文'),
('ORD00003', 'VIP票', '中法', 'ApplePay', '1 張法文票', '加入購物車', '法文'),
('ORD00004', '早鳥票', '中韓', '信用卡', '2 張韓文票', '加入購物車', '韓文'),
('ORD00005', '一般票', '中德', '街口支付', '1 張德文票', '加入購物車', '德文');

INSERT INTO 支付 VALUES
('PAY00001', 300, '2025-05-14 10:30:00', 'ORD00001', '信用卡'),
('PAY00002', 1000, '2025-05-14 11:00:00', 'ORD00002', 'LinePay'),
('PAY00003', 550, '2025-05-14 12:00:00', 'ORD00003', 'ApplePay'),
('PAY00004', 500, '2025-05-14 12:15:00', 'ORD00004', '信用卡'),
('PAY00005', 300, '2025-05-14 12:30:00', 'ORD00005', '街口支付');

-- 測試 2：購票流程
SELECT '【測試 2：購票流程】' AS 測試;
INSERT INTO 訂單 VALUES ('ORD00006', '早鳥票', '中英', '信用卡', '2張中文票', '加入購物車', '中文');
INSERT INTO 訂單 VALUES ('ORD00007', '一般票', '中日', 'LinePay', '1 張日文票', '加入購物車', '日文');
INSERT INTO 支付 VALUES ('PAY00006', 600, NOW(), 'ORD00006', '信用卡');
INSERT INTO 支付 VALUES ('PAY00007', 1200, NOW(), 'ORD00007', 'LinePay');
SELECT * FROM 訂單 WHERE 訂單ID = 'ORD00006';
SELECT * FROM 支付 WHERE 支付ID = 'PAY00006';






