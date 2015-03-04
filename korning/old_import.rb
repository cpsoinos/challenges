# Use this file to import the sales information into the
# the database.
require "pry"
require "pg"
require "CSV"
require "set"

def db_connection
  begin
    connection = PG.connect(dbname: "korning")
    yield(connection)
  ensure
    connection.close
  end
end

system "psql korning < schema.sql"

sales_data = []

CSV.foreach("sales.csv", headers:true, header_converters: :symbol) do |row|
  sales_data << row.to_hash
end
employee_data = []
# .to_set here will save only unique values
employee_data = (sales_data.map { |element| employee_data << element[:employee] })[0].uniq

deduped_employees = {}
employee_data.each do |data|
  # split employee cell into employee and employee email using lots of ugly regex
  email = (data.gsub(/\([^()]*?\)/).to_a)[0].gsub!(/[()]/, "")
  name = data.gsub(/\(.*\)/, "").rstrip!
  deduped_employees[name] = email
end

customer_data = []
customer_data = (sales_data.map { |element| customer_data << element[:customer_and_account_no] })[0].uniq

deduped_customers = {}
customer_data.each do |data|
  # split employee cell into employee and employee email using lots of ugly regex
  account_no = (data.gsub(/\([^()]*?\)/).to_a)[0].gsub!(/[()]/, "")
  customer = data.gsub(/\(.*\)/, "").rstrip!
  deduped_customers[customer] = account_no
end

sales_data.each do |data|
  data.delete(:customer_and_account_no)
end

invoice_frequency_data = []
invoice_frequency_data = (sales_data.map { |element| invoice_frequency_data << element[:invoice_frequency] })[0].to_set

sale_date_data = []
sale_date_data = (sales_data.map { |element| sale_date_data << element[:sale_date] })[0].to_set

product_data = []
product_data = (sales_data.map { |element| product_data << element[:product_name] })[0].to_set

db_connection do |conn|
  invoice_frequency_data.each do |data|
    conn.exec("INSERT INTO invoice_frequencies (invoice_frequency) VALUES ($1)", [data])
  end
  sale_date_data.each do |data|
    conn.exec("INSERT INTO sales_dates (sales_date) VALUES ($1)", [data])
  end
  product_data.each do |data|
    conn.exec("INSERT INTO products (product) VALUES ($1)", [data])
  end
  deduped_customers.each do |customer, account_no|
    conn.exec("INSERT INTO customers (name, account_no) VALUES ($1, $2)", [customer, account_no])
  end
  deduped_employees.each do |name, email|
    conn.exec("INSERT INTO employees (name, email) VALUES ($1, $2)", [name, email])
  end
  sales_data.each do |data|
    conn.exec("INSERT INTO invoices (invoice_no, sale_amount, units_sold) VALUES ($1, $2, $3)", [data[:invoice_no], data[:sale_amount], data[:units_sold]])
########### placeholder:    conn.exec("INSERT INTO invoices (employee_id) VALUES ($1)", )
  end
  # conn.exec("INSERT INTO invoices (customer_id, invoice_frequency_id, sales_date_id, employee_data_id, product_id) VALUES ($1, $2, $3, $4, $5)", [])
end
