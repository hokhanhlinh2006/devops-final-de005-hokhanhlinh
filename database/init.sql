-- =============================================================================
--  database/init.sql - Khởi tạo dữ liệu cho đề 005: Quản lý nhân viên
--  MySQL tự chạy file này ở LẦN KHỞI ĐỘNG ĐẦU TIÊN khi được mount vào
--  /docker-entrypoint-initdb.d/  (database và user do biến MYSQL_* tạo sẵn)
-- =============================================================================
SET NAMES utf8mb4;

USE ptit_hrm_db;

CREATE TABLE IF NOT EXISTS employees (
    id              BIGINT AUTO_INCREMENT PRIMARY KEY,
    full_name       VARCHAR(100) NOT NULL,
    position        VARCHAR(50) NOT NULL,
    department      VARCHAR(50) NOT NULL,
    email           VARCHAR(100) NOT NULL,
    salary          DECIMAL(12,2) NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO employees (full_name, position, department, email, salary) VALUES
    ('Nguyễn Văn An', 'Trưởng phòng', 'Kỹ thuật', 'an.nv@ptit-devops.vn', 35000000),
    ('Trần Thị Bình', 'DevOps Engineer', 'Kỹ thuật', 'binh.tt@ptit-devops.vn', 28000000),
    ('Lê Văn Cường', 'Backend Developer', 'Phát triển', 'cuong.lv@ptit-devops.vn', 25000000),
    ('Phạm Thị Dung', 'Frontend Developer', 'Phát triển', 'dung.pt@ptit-devops.vn', 22000000),
    ('Hoàng Văn Em', 'Tester', 'Kiểm thử', 'em.hv@ptit-devops.vn', 18000000),
    ('Vũ Thị Giang', 'Chuyên viên nhân sự', 'Nhân sự', 'giang.vt@ptit-devops.vn', 16000000),
    ('Đỗ Văn Hùng', 'System Admin', 'Hạ tầng', 'hung.dv@ptit-devops.vn', 24000000),
    ('Ngô Thị Lan', 'Kế toán', 'Tài chính', 'lan.nt@ptit-devops.vn', 17000000);
