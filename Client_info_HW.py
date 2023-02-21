import psycopg2

conn=psycopg2.connect(database='client_info_db',user='postgres',password='111')
cur=conn.cursor()
conn.autocommit=True

cur.execute ("""
                  DROP TABLE client_phone;
                  DROP TABLE client_info;""")

def create_bd():
    cur.execute("""CREATE TABLE IF NOT EXISTS client_info (
                    id SERIAL PRIMARY KEY,
                    first_name VARCHAR(40) NOT NULL,
                    last_name VARCHAR(60) NOT NULL,
                    email VARCHAR(60) UNIQUE NOT NULL);""")
                
    cur.execute("""CREATE TABLE IF NOT EXISTS client_phone (
                    id SERIAL PRIMARY KEY,
                    client_id INTEGER NOT NULL REFERENCES client_info(id),
                    phone BIGINT UNIQUE);""")
    return "Выполнено!"
    


def add_client(first_name,last_name,email):
    cur.execute("""INSERT INTO client_info(first_name,last_name,email)
                    VALUES (%s,%s,%s)
                    RETURNING id;""", (first_name,last_name,email))
    client_id=cur.fetchone()
    phone=int(input('Введите номер телефона:'))
    cur.execute("""INSERT INTO client_phone(client_id,phone) 
        VALUES(%s,%s) RETURNING id,client_phone.id, phone;""", (client_id,phone))
    return f'Данные о клиенте  {first_name} {last_name} успешно добавлены'
        

def add_phone():
    client_id=int(input('Введите идентификатор клиента:')) 
    phone=int(input('Введите номер телефона:'))
    cur.execute("""INSERT INTO client_phone(client_id,phone)
        VALUES(%s,%s) RETURNING id,client_phone.client_id, phone;""",(client_id,phone))     
    return f'Номер телефона {phone} для клиента с идентификатором {client_id} успешно добавлен', cur.fetchone() 
    

def update_client_info(id,first_name=None, last_name=None,email=None,phone=None):
    cur.execute("""UPDATE client_info SET first_name=%s,last_name=%s,email=%s
    WHERE id=%s RETURNING id,first_name,last_name,email;""", (first_name,last_name,email,id))
    
    cur.execute("""UPDATE client_phone SET phone=%s
    WHERE id=%s RETURNING client_id,phone;""",(phone,id))
    return f'Данные о клиенте с идентификатором {id} успешно изменены'


def delete_phone(client_id,phone):
    cur.execute("""DELETE FROM client_phone WHERE client_id=%s and phone=%s;""",(client_id,phone))
    cur.execute("""SELECT * FROM client_phone WHERE client_id=%s;""",(client_id,))
    print(cur.fetchone())
    return f'Номер телефона {phone} у пользователя с идентификатором {client_id} успешно удален'


def delete_client_info(id:int):
   cur.execute("""DELETE FROM client_phone WHERE client_id=%s ;""",(id,)) 
   cur.execute("""DELETE FROM client_info WHERE id=%s;""",(id,))
   return f'Данные о клиенте с идентификатором {id} успешно удалены'

def find_client_info():    
    param_search=input('Введите параметр для поиска:first_name,last_name,email or phone')
    search=input('Введите значение для поиска')
    if param_search=='phone':
        cur.execute("""SELECT * FROM client_phone
        WHERE phone=%s;""",(search,))
        id=cur.fetchone()[1]
        cur.execute("""SELECT * FROM client_info
        WHERE id=%s;""",(id,))
        print(cur.fetchone())
    elif param_search=='first_name':
        cur.execute("""SELECT * FROM client_info
        WHERE first_name=%s;""",(search,))
        print(cur.fetchall())
    elif param_search=='last_name':
        cur.execute("""SELECT * FROM client_info
        WHERE last_name=%s;""",(search,))
        print(cur.fetchall())
    elif param_search=='email':
        cur.execute("""SELECT * FROM client_info
        WHERE email=%s;""",(search,))
        print(cur.fetchall())
    

print(create_bd()) 
print(add_client('Ivan','Ivanov','ivanov@gmail.com'))
print(add_client('Petr','Petrov','petrov@gmail.com'))
print(add_client('Vladimir','Sidorov','sidorov@gmail.com'))
print(add_phone())
print(update_client_info(1,'Ivan','Petrov','123@mail.ru','123456789'))       
print(delete_phone(1,123))
print(delete_client_info(1))
find_client_info()

cur.close()
conn.close()
