-- Create claims table
CREATE TABLE IF NOT EXISTS claims (
    claim_id SERIAL PRIMARY KEY,
    service_date DATE NOT NULL,
    patient_id VARCHAR(50),
    provider_id VARCHAR(50),
    diagnosis_code VARCHAR(10),
    procedure_code VARCHAR(10),
    total_cost DECIMAL(10,2),
    service_type VARCHAR(50),
    location VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create monthly_aggregates table for time series analysis
CREATE TABLE IF NOT EXISTS monthly_aggregates (
    month_year DATE PRIMARY KEY,
    total_cost DECIMAL(12,2),
    avg_cost DECIMAL(10,2),
    claim_count INTEGER,
    unique_patients INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);