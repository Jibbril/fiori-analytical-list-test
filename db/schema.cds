namespace my;

@Aggregation : { 
    CustomAggregate #price : 'Edm.Decimal',
    ApplySupported: {
        GroupableProperties: [genre],
        AggregatableProperties: [{
            Property: price,

        }],
        Transformations: [
            'filter',
            'groupby',
            'aggregate',
            'identity',
            'search',
            'topsum',
            'bottomsum',
            'topcount',
            'bottomcount',
            'toppercent',
            'bottompercent',
            'concat',
            'expand',
        ]
    }
 }
entity Books {
    key id: Integer;
    name: String; 

    genre: String;
    @Aggregation.default: #SUM
    @Analytics.Measure: true
    price: Decimal default 0.0;

    virtual virtualAuthorName: String;

    author: Association to Authors;
};

entity Authors { 
    key id: Integer;
    name: String;

    books: Association to many Books on books.author = $self;
}