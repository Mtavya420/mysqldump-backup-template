#! /bin/bash

DB_NAME="users"

date=$(date '+%Y-%d-%m')

# Create an array of tables names
TABLES=("customers" "employee" "offices" "offices" "orderdetails"
"orders" "payments" "productlines" "products")


backup() {
    # This function loop through the TABLES and arrays 
    # and create backup for each table.
    for index in ${!TABLES[@]}; 
        do
            echo "Creating backup for $TABLES[$index]"
            mysqldump -h localhost -u root -p'coolhand' ${DB_NAME} ${TABLES[$index]} > ${TABLES[$index]}_${date}.sql
        done
}

restore() {
    # Restores backup tables to the specified DB
    DB_NAME="beta"
    for index in ${!TABLES[@]}; 
        do
            echo "Restoring backup for $TABLES[$index]"
            mysql -h localhost -u root -p'coolhand' ${DB_NAME} < ${TABLES[$index]}_2022-07-07.sql
        done
}

backup
