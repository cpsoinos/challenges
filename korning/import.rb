require "pry"
require "pg"
require "CSV"

def db_connection
  begin
    connection = PG.connect(dbname: "korning")
    yield(connection)
  ensure
    connection.close
  end
end

system "psql korning < schema.sql"

#################
### EMPLOYEES ###
#################

def parse_employee(employee)
  split = employee.split(' ')
  name = split[0] + ' ' + split[1]
  email = split[2].gsub(/[()]/)

  { name: name, email: email }
end

def insert_employee(employee)
  db_connection do |conn|
    result = conn.exec_params("SELECT id FROM employees WHERE name = $1", [employee[:name]])
    if result.to_a.empty?
      sql = "INSERT INTO employees (name, email) VALUES ($1, $2) RETURNING id"
      result = conn.exec_params(sql, [employee[:name], employee[:email]])
    end
    result.first["id"]
  end
end

#################
### CUSTOMERS ###
#################

def parse_customer(customer)
  split = customer.split(' ')
  name = split[0]
  account_no = split[1].gsub(/[()]/)

  { name: name, account_no: account_no }
end

def insert_customer(customer)
  db_connection do |conn|
    result = conn.exec_params("SELECT id FROM customers WHERE name = $1", [customer[:name]])
    if result.to_a.empty?
      sql = "INSERT INTO customers (name, account_no) VALUES ($1, $2) RETURNING id"
      result = conn.exec_params(sql, [customer[:name], customer[:account_no]])
    end
    result.first["id"]
  end
end

#################
### PRODUCTS ####
#################

def insert_products(product)
  db_connection do |conn|
    result = conn.exec_params("SELECT id FROM products WHERE name = $1", [product[:name]])
    if result.to_a.empty?
      result = conn.exec_params("INSERT INTO products (name) VALUES ($1) RETURNING id", [product[:name]])
    end
    result.first["id"]
  end
end

#################
## SALES DATES ##
#################

# def parse_sale_date(sale_date)


def insert_sales_dates(sale_date)
  db_connection do |conn|
    result = conn.exec_params("SELECT id FROM sales_dates WHERE sale_date = $1", [sale_date[:sale_date]])
    if result.to_a.empty?
      result = conn.exec_params("INSERT INTO sales_dates (sale_date) VALUES ($1) RETURNING id", [sale_date[:sale_date]])
    end
    result.first["id"]
  end
end

##################
## INVOICE FREQ ##
##################

def insert_invoice_frequencies(invoice_frequency)
  db_connection do |conn|
    result = conn.exec_params("SELECT id FROM invoice_frequencies WHERE invoice_frequency = $1", [invoice_frequency[:invoice_frequency]])
    if result.to_a.empty?
      result = conn.exec_params("INSERT INTO invoice_frequencies (invoice_frequency) VALUES ($1) RETURNING id", [invoice_frequency[:invoice_frequency]])
    end
    result.first["id"]
  end
end

################
### INVOICES ###
################

def insert_invoices(transaction, foreign_keys)
  db_connection do |conn|
    arguments = [
      transaction[:invoice_no],
      transaction[:sale_amount],
      transaction[:units_sold],
      foreign_keys[:customer_id],
      foreign_keys[:invoice_frequency_id],
      foreign_keys[:sale_date_id],
      foreign_keys[:employee_id],
      foreign_keys[:product_id]
    ]

    sql = <<-eos
    INSERT INTO invoices (invoice_no, sale_amount, units_sold, customer_id, invoice_frequency_id, sale_date_id, employee_id, product_id)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
    eos

    conn.exec_params(sql, arguments)
  end
end

################
### Seed DB  ###
################

CSV.foreach("sales.csv", headers: true, header_converters: :symbol) do |row|
  print "."
  transaction = row.to_hash

  employee = parse_employee(transaction[:employee])
  employee_id = insert_employee(employee)

  product = { name: transaction[:product_name] }
  product_id = insert_products(product)

  customer = parse_customer(transaction[:customer_and_account_no])
  customer_id = insert_customer(customer)

  invoice_frequency = { invoice_frequency: transaction[:invoice_frequency] }
  invoice_frequency_id = insert_invoice_frequencies(invoice_frequency)

  sale_date = { sale_date: transaction[:sale_date] }
  sale_date_id = insert_sales_dates(sale_date)

  foreign_keys = { customer_id: customer_id, invoice_frequency_id: invoice_frequency_id, sale_date_id: sale_date_id, employee_id: employee_id, product_id: product_id }
  insert_invoices(transaction, foreign_keys)
end

puts "Import complete. Database is now normalized."
