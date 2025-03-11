import mysql.connector
from config import db_config

def _connect_to_db():
    try:
        cnx = mysql.connector.connect(
            host = db_config['host'],
            user = db_config['user'],
            password = db_config['password'],
            database = db_config['database'],
            auth_plugin = 'mysql_native_password'
        )
        return cnx
    except mysql.connector.Error:
        print('Database connection failed')
        return None


def get_all_classes():
    classes = []
    db_connection = _connect_to_db()
    try:
        cur = db_connection.cursor(dictionary=True)

        query = "select * from gym_classes"
        cur.execute(query)

        classes = cur.fetchall()

        for gym_class in classes:
            gym_class["class_time"] = str(gym_class["class_time"])
        cur.close()

    except Exception:
        print('Error fetching data')
        return {'error'}

    finally:
        if db_connection:
            db_connection.close()
            print("DB connection is closed")

    return classes

def get_all_cardio():
    cardio = []
    db_connection = _connect_to_db()
    try:
        cur = db_connection.cursor(dictionary=True)

        query = "select * from gym_classes where class_type = 'Cardio'"
        cur.execute(query)

        cardio = cur.fetchall()

        for gym_class in cardio:
            gym_class["class_time"] = str(gym_class["class_time"])
        cur.close()

    except Exception:
        print('Error fetching data')
        return {'error'}

    finally:

        if db_connection:
            db_connection.close()

            print("DB connection is closed")

    return cardio

def get_all_am():
    am = []
    db_connection = _connect_to_db()
    try:
        cur = db_connection.cursor(dictionary=True)

        query = "select * from gym_classes where class_session = 'AM'"
        cur.execute(query)

        am = cur.fetchall()

        for gym_class in am:
            gym_class["class_time"] = str(gym_class["class_time"])
        cur.close()

    except Exception:
        print('Error fetching data')
        return {'error'}

    finally:

        if db_connection:
            db_connection.close()

            print("DB connection is closed")

    return am

def get_all_stretch():
    stretch = []
    db_connection = _connect_to_db()
    try:
        cur = db_connection.cursor(dictionary=True)

        query = "select * from gym_classes where class_type = 'Stretch'"
        cur.execute(query)

        stretch = cur.fetchall()

        for gym_class in stretch:
            gym_class["class_time"] = str(gym_class["class_time"])
        cur.close()

    except Exception:
        print('Error fetching data')
        return {'error'}

    finally:

        if db_connection:
            db_connection.close()

            print("DB connection is closed")

    return stretch

def get_all_weight():
    weight = []
    db_connection = _connect_to_db()
    try:
        cur = db_connection.cursor(dictionary=True)

        query = "select * from gym_classes where class_type = 'Weight Training'"
        cur.execute(query)

        weight = cur.fetchall()

        for gym_class in weight:
            gym_class["class_time"] = str(gym_class["class_time"])
        cur.close()

    except Exception:
        print('Error fetching data')
        return {'error'}

    finally:

        if db_connection:
            db_connection.close()

            print("DB connection is closed")

    return weight