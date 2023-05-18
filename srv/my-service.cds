using { my } from '../db/schema';

service MyService {
    @Aggregation : { 
    CustomAggregate #price : 'Edm.Decimal',
    CustomAggregate #stock : 'Edm.Int32',
    ApplySupported: {
        GroupableProperties: [genre, authorName, name],
        AggregatableProperties: [
            { Property: stock, },
            { Property: price, }
        ],
    }
 }
    entity Books as projection on my.Books {
        *,
        @Analytics.Measure: true
        @Aggregation.default: #SUM
        price,

        @Analytics.Measure: true
        @Aggregation.default: #SUM
        stock,
        author.name as authorName
    };

    entity Authors as projection on my.Authors;
}