import sqlalchemy as sq
from sqlalchemy.orm import declarative_base,relationship

Base=declarative_base()
class Publisher(Base):
    __tablename__='publisher' 

    id=sq.Column(sq.Integer, primary_key=True)
    name=sq.Column(sq.String(length=60), unique=True)

    book=relationship('Book',back_populates='publisher')

    def __str__(self): 
        return f'Publisher {self.id}:{self.name}'



class Book(Base):
    __tablename__='book'

    id=sq.Column(sq.Integer,primary_key=True)
    title=sq.Column(sq.String(length=80))
    publisher_id=sq.Column(sq.Integer,sq.ForeignKey('publisher.id'), nullable=False)

    publisher=relationship('Publisher',back_populates='book')
    stock=relationship('Stock',back_populates='book')

    def __str__(self): 
        return f'Book {self.id}:{self.title}, Publisher {self.publisher_id}'


class Shop(Base):
    __tablename__='shop' 

    id=sq.Column(sq.Integer, primary_key=True)
    name=sq.Column(sq.String(length=60), unique=True)

    stock=relationship('Stock',back_populates='shop')

    def __str__(self): 
        return f'Shop {self.id}:{self.name}'


class Stock(Base):
    __tablename__='stock'

    id=sq.Column(sq.Integer, primary_key=True)
    book_id=sq.Column(sq.Integer,sq.ForeignKey('book.id'), nullable=False)
    shop_id=sq.Column(sq.Integer, sq.ForeignKey('shop.id'), nullable=False)
    count=sq.Column(sq.Integer,nullable=False)

    shop=relationship('Shop',back_populates='stock')
    book=relationship('Book',back_populates='stock')
    sale=relationship('Sale',back_populates='stock')

    def __str__(self):
        return f'Stock {self.id}:Book {self.book_id}, Shop {self.shop_id}, Count {self.count}'
    

class Sale(Base):
    __tablename__='sale'

    id=sq.Column(sq.Integer, primary_key=True)
    price=sq.Column(sq.Numeric(6,2),nullable=False)
    date_sale=sq.Column(sq.TIMESTAMP)
    stock_id=sq.Column(sq.ForeignKey('stock.id'),nullable=False)
    count=sq.Column(sq.Integer)

    stock=relationship('Stock',back_populates='sale')

    def __str__(self):
        return f'Sale {self.id}:price {self.price}, created_at {self.date_sale}, stock {self.stock_id}, count {self.count}'



def create_tables(engine): #описываем метод создания таблиц
    Base.metadata.drop_all(engine) #если необходимо удалять таблицы при каждом запуске
    Base.metadata.create_all(engine) 