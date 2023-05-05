using { my } from '../db/schema';

service MyService {
    entity Books as projection on my.Books;
    entity Authors as projection on my.Authors;
}