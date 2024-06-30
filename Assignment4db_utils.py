import mysql.connector
from config import USER, PASSWORD, HOST


class DbConnectionError(Exception):
    pass


# Connecting to the database using the details entered into the config.py file and checking to see if connection was
# successful
def _connect_to_db(db_name):
    try:
        cnx = mysql.connector.connect(
            host=HOST,
            user=USER,
            password=PASSWORD,
            auth_plugin='mysql_native_password',
            database=db_name
        )
        return cnx
    except mysql.connector.Error:
        raise DbConnectionError('Error connecting to database')


# Connecting to a specific database and using an SQL query to speak with the database to get all the information held
# within the database before closing the connection to the database
def get_products():
    db_connection = None
    try:
        db_name = 'pharaoh'
        db_connection = _connect_to_db(db_name)
        cur = db_connection.cursor(dictionary=True)
        print(f'Connected to DB: {db_name}')

        query = 'SELECT * FROM biscuits'
        cur.execute(query)
        result = cur.fetchall()
        cur.close()
        return result

    except Exception:
        raise DbConnectionError('Failed to read data from DB')

    finally:
        if db_connection:
            db_connection.close()
            print('DB connection is closed')


# Connecting to a specific database and the using an SQL query to add information to the database before closing the
# connection to the database and advising the user if the new biscuit has been added successfully
def new_product(new_biscuit):
    db_connection = None
    try:
        db_name = 'pharaoh'
        db_connection = _connect_to_db(db_name)
        cur = db_connection.cursor()
        print(f'Connected to DB: {db_name}')

        query = """INSERT INTO biscuits (batch_no, biscuit_name, price_per_pack, allergy_info, expiry_date)
                   VALUES (%s, %s, %s, %s, %s)"""
        data = (
            new_biscuit['batch_no'],
            new_biscuit['biscuit_name'],
            new_biscuit['price_per_pack'],
            new_biscuit['allergy_info'],
            new_biscuit['expiry_date']
        )
        cur.execute(query, data)
        db_connection.commit()
        cur.close()


    except Exception:
        raise DbConnectionError('Failed to insert data into DB')

    finally:
        if db_connection:
            db_connection.close()
            print('DB connection is closed')

    print('Record added to DB')


# Connecting to a specific database and using an SQL query to get all the information from the database and list it in
# a specific order before closing the connection to the database. Here it is by expiry date, but it can be changed to
# anything the user wants
def get_expiry():
    db_connection = None
    try:
        db_name = 'pharaoh'
        db_connection = _connect_to_db(db_name)
        cur = db_connection.cursor()
        print(f'Connected to DB: {db_name}')

        query = 'SELECT * FROM biscuits ORDER BY expiry_date ASC'
        cur.execute(query)
        result = cur.fetchall()
        cur.close()
        return result

    except Exception:
        raise DbConnectionError('Failed to insert data into DB')

    finally:
        if db_connection:
            db_connection.close()
            print('DB connection is closed')


# Connecting to a specific database and using an SQL query to delete a record chosen by the user within the database
# before closing the connection and advising the user if they have successfully deleted a record. Here I have chosen to
# delete a record using batch_id, but this can be changed to any other parameter
def no_longer_made(biscuit_id):
    db_connection = None
    try:
        db_name = 'pharaoh'
        db_connection = _connect_to_db(db_name)
        cur = db_connection.cursor()
        print(f'Connected to DB: {db_name}')

        query = 'DELETE FROM biscuits WHERE batch_no = %s'
        cur.execute(query, (biscuit_id,))
        db_connection.commit()
        cur.close()

    except Exception:
        raise DbConnectionError('Failed to delete data from DB')

    finally:
        if db_connection:
            db_connection.close()
            print('DB connection is closed')

    print('Record deleted from DB')
    return {'message': 'Biscuit discontinued successfully'}

