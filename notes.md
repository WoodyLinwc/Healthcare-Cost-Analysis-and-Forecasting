python3.10 -m venv venv

source venv/bin/activate

pip install -r requirements.txt

psql -U postgresl


jupyter notebook


psql healthcare_costs

\dt
\x

SELECT COUNT(*) FROM medicare_spending;
SELECT * FROM medicare_spending LIMIT 5;