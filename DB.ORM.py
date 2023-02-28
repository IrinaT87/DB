import sqlalchemy
from sqlalchemy.orm import sessionmaker
from modelsdb import create_tables, Publisher,Book

DSN='postgresql://postgres:111@localhost:5432/book_store_db'
engine=sqlalchemy.create_engine(DSN)

create_tables(engine) 
Session=sessionmaker(bind=engine) #класс-создатель сессий
session=Session() #создаем экземпляр класса, сессия создана
pub1=Publisher(name='Александр Сергеевич Пушкин')

session.add(pub1)
session.commit()

book1=Book(title='Евгений Онегин',publisher=pub1)
book2=Book(title='Моцарт и Сальери', publisher=pub1)
session.add_all([book1,book2])
session.commit()
print(book2)


