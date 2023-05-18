namespace my;

entity Books {
    key id: Integer;
    name: String; 

    genre: String;
    price: Decimal default 0.0;
    stock: Integer default 0;

    virtual virtualAuthorName: String;

    author: Association to Authors;
};

entity Authors { 
    key id: Integer;
    name: String;

    books: Association to many Books on books.author = $self;
}