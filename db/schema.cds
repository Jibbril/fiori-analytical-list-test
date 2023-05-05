namespace my;

entity Books {
    key id: Integer;
    name: String; 
    price: Decimal;

    author: Association to Authors;
}

entity Authors { 
    key id: Integer;
    name: String;

    books: Association to many Books on books.author = $self;
}