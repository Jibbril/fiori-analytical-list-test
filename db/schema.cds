namespace my;

entity Books {
    key id:         Integer;
    name:           String; 
    genre:          String;
    releaseDate:    String;
    releaseYear:    String;
    price:          Decimal default 0.0;
    stock:          Integer default 0;
    totalSold:      Integer default 0;

    virtual virtualAuthorName: String;

    author: Association to Authors;
};

entity Authors { 
    key id: Integer;
    name:           String;
    age:            Integer;
    placeOfBirth:   String;
    deceased:       Boolean default false;

    books: Association to many Books on books.author = $self;
}