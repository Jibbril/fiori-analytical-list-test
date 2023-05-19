using { my } from '../db/schema';

service MyService {
    @Aggregation : { 
        CustomAggregate #price : 'Edm.Decimal',
        CustomAggregate #stock : 'Edm.Int32',
        CustomAggregate #totalSold : 'Edm.Int32',
        ApplySupported: {
            GroupableProperties: [genre, authorName, releaseYear, name, releaseDate],
            AggregatableProperties: [
                { Property: stock, },
                { Property: price, },
                { Property: totalSold, },
            ],
        }
    }
    entity Books as projection on my.Books {
        *,
        @Analytics.Measure: true
        @Aggregation.default: #AVG
        price,

        @Analytics.Measure: true
        @Aggregation.default: #SUM
        stock,

        @Analytics.Measure: true
        @Aggregation.default: #SUM
        totalSold,

        author.name as authorName
    };

    entity Authors as projection on my.Authors;
}