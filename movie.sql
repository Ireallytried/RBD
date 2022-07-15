CREATE TABLE Award (
    IdAward integer  NOT NULL,
    Name varchar2(30)  NOT NULL,
    CONSTRAINT Award_pk PRIMARY KEY (IdAward)
) ;

-- Table: AwardReceived
CREATE TABLE AwardReceived (
    IdAwardReceived integer  NOT NULL,
    Award_IdAward integer  NOT NULL,
    Movie_IdMovie integer  NOT NULL,
    "Date" date  NOT NULL,
    CONSTRAINT AwardReceived_pk PRIMARY KEY (IdAwardReceived)
) ;

-- Table: Cashier
CREATE TABLE Cashier (
    IdCashier integer  NOT NULL,
    FirstName varchar2(50)  NOT NULL,
    LastName varchar2(50)  NOT NULL,
    CashierNumber integer  NOT NULL,
    CONSTRAINT Cashier_pk PRIMARY KEY (IdCashier)
) ;
Alter table cashier
    ADD salary integer;

-- Table: Customer
CREATE TABLE Customer (
    IdCustomer integer  NOT NULL,
    FirstName varchar2(50)  NOT NULL,
    LastName varchar2(50)  NOT NULL,
    CrediCardNumber char(10)  NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (IdCustomer)
) ;

-- Table: Director
CREATE TABLE Director (
    IdDirector integer  NOT NULL,
    FirstName varchar2(50)  NOT NULL,
    LastName varchar2(50)  NOT NULL,
    DateOfBirth date  NOT NULL,
    CONSTRAINT Director_pk PRIMARY KEY (IdDirector)
) ;

-- Table: Language
CREATE TABLE Language (
    IdLanguage integer  NOT NULL,
    Name varchar2(50)  NOT NULL,
    CONSTRAINT Language_pk PRIMARY KEY (IdLanguage)
) ;

-- Table: Movie
CREATE TABLE Movie (
    IdMovie integer  NOT NULL,
    Title varchar2(50)  NOT NULL,
    Director_IdDirector integer  NOT NULL,
    Language_IdLanguage integer  NOT NULL,
    MovieCompany_IdMovieCompany integer  NOT NULL,
    CONSTRAINT Movie_pk PRIMARY KEY (IdMovie)
) ;

-- Table: MovieCompany
CREATE TABLE MovieCompany (
    IdMovieCompany integer  NOT NULL,
    Name varchar2(50)  NOT NULL,
    Adress varchar2(50)  NOT NULL,
    DayOfEstablishing date  NOT NULL,
    PhoneNumber varchar2(30)  NOT NULL,
    CONSTRAINT MovieCompany_pk PRIMARY KEY (IdMovieCompany)
) ;

-- Table: MovieInAStore
CREATE TABLE MovieInAStore (
    IdMovieInAStore integer  NOT NULL,
    MovieStore_idMovieSotre integer  NOT NULL,
    Movie_IdMovie integer  NOT NULL,
    Price integer  NOT NULL,
    CONSTRAINT MovieInAStore_pk PRIMARY KEY (IdMovieInAStore)
) ;

-- Table: MovieIssuance
CREATE TABLE MovieIssuance (
    IdMovieIssuance integer  NOT NULL,
    BuyingDate date  NOT NULL,
    Cashier_IdCashier integer  NOT NULL,
    Customer_IdCustomer integer  NOT NULL,
    MovieInAStore_IdMovieInAStore integer  NOT NULL,
    CONSTRAINT MovieIssuance_pk PRIMARY KEY (IdMovieIssuance)
) ;

-- Table: MovieStore
CREATE TABLE MovieStore (
    idMovieSotre integer  NOT NULL,
    Name varchar2(50)  NOT NULL,
    Adress varchar2(50)  NOT NULL,
    CONSTRAINT MovieStore_pk PRIMARY KEY (idMovieSotre)
) ;

-- foreign keys
-- Reference: AwardReceived_Award (table: AwardReceived)
ALTER TABLE AwardReceived ADD CONSTRAINT AwardReceived_Award
    FOREIGN KEY (Award_IdAward)
    REFERENCES Award (IdAward);

-- Reference: AwardReceived_Movie (table: AwardReceived)
ALTER TABLE AwardReceived ADD CONSTRAINT AwardReceived_Movie
    FOREIGN KEY (Movie_IdMovie)
    REFERENCES Movie (IdMovie);

-- Reference: MovieInAStore_Movie (table: MovieInAStore)
ALTER TABLE MovieInAStore ADD CONSTRAINT MovieInAStore_Movie
    FOREIGN KEY (Movie_IdMovie)
    REFERENCES Movie (IdMovie);

-- Reference: MovieInAStore_MovieStore (table: MovieInAStore)
ALTER TABLE MovieInAStore ADD CONSTRAINT MovieInAStore_MovieStore
    FOREIGN KEY (MovieStore_idMovieSotre)
    REFERENCES MovieStore (idMovieSotre);

-- Reference: MovieIssuance_Cashier (table: MovieIssuance)
ALTER TABLE MovieIssuance ADD CONSTRAINT MovieIssuance_Cashier
    FOREIGN KEY (Cashier_IdCashier)
    REFERENCES Cashier (IdCashier);

-- Reference: MovieIssuance_Customer (table: MovieIssuance)
ALTER TABLE MovieIssuance ADD CONSTRAINT MovieIssuance_Customer
    FOREIGN KEY (Customer_IdCustomer)
    REFERENCES Customer (IdCustomer);

-- Reference: MovieIssuance_MovieInAStore (table: MovieIssuance)
ALTER TABLE MovieIssuance ADD CONSTRAINT MovieIssuance_MovieInAStore
    FOREIGN KEY (MovieInAStore_IdMovieInAStore)
    REFERENCES MovieInAStore (IdMovieInAStore);

-- Reference: Movie_Director (table: Movie)
ALTER TABLE Movie ADD CONSTRAINT Movie_Director
    FOREIGN KEY (Director_IdDirector)
    REFERENCES Director (IdDirector);

-- Reference: Movie_Language (table: Movie)
ALTER TABLE Movie ADD CONSTRAINT Movie_Language
    FOREIGN KEY (Language_IdLanguage)
    REFERENCES Language (IdLanguage);

-- Reference: Movie_MovieCompany (table: Movie)
ALTER TABLE Movie ADD CONSTRAINT Movie_MovieCompany
    FOREIGN KEY (MovieCompany_IdMovieCompany)
    REFERENCES MovieCompany (IdMovieCompany);
    
--end of file

--CASHIER
INSERT INTO Cashier(idcashier, firstname,lastname, cashiernumber,salary)
VALUES (1,'Jack', 'Anderson', '10',1800);
INSERT INTO Cashier(idcashier, firstname,lastname, cashiernumber,salary)
VALUES (2,'James', 'Bailey', '20', 2500);
INSERT INTO Cashier(idcashier, firstname,lastname, cashiernumber,salary)
VALUES (3,'William', 'Baker', '30',2600);
INSERT INTO Cashier(idcashier, firstname,lastname, cashiernumber, salary)
VALUES (4,'Bob', 'Aden', '40', 1950);


--AWARD
INSERT INTO Award (idaward, name)
VALUES (1, 'Oscar');
INSERT INTO Award (idaward, name)
VALUES (2, 'Golden Globes');
INSERT INTO Award (idaward, name)
VALUES (3, 'Cesar Award');
INSERT INTO Award (idaward, name)
VALUES (4, 'Critics Choise Mowie Awards');
--CUSTOMER
INSERT INTO Customer( idcustomer, firstname, lastname, credicardnumber)
VALUES (1, 'Jacob','Cooper', 6778567);
INSERT INTO Customer( idcustomer, firstname, lastname, credicardnumber)
VALUES (2, 'Michael','Fisher', 677873858);
INSERT INTO Customer( idcustomer, firstname, lastname, credicardnumber)
VALUES (3, 'Mason','Fletcherr', 67782975);
INSERT INTO Customer( idcustomer, firstname, lastname, credicardnumber)
VALUES (4, 'Noah ','Jackson', 67789990);

--LANGUAGE
INSERT INTO Language (idlanguage, name)
VALUES (1,'English');
INSERT INTO Language (idlanguage, name)
VALUES (2,'Russian');
INSERT INTO Language (idlanguage, name)
VALUES (3,'Italian');
INSERT INTO Language (idlanguage, name)
VALUES (4,'Spanish');
INSERT INTO Language (idlanguage, name)
VALUES (5,'French');

--Movie Store
Insert Into Moviestore (idmoviesotre,name,adress)
Values (1,' Best Movies', '273 Linden Avenue, Orlando');
Insert Into Moviestore (idmoviesotre,name,adress)
Values (2,'Home cinema', '2535 Duncan Avenue, NY');


--DIRECTOR
Insert Into Director(iddirector, firstname,lastname,dateofbirth)
Values (1, 'Peter', 'Farrelly',To_Date('1956-12-17', 'YYYY-MM-DD'));
Insert Into Director(iddirector, firstname,lastname,dateofbirth)
Values (2, 'David', 'Fincher',To_Date('1962-08-28', 'YYYY-MM-DD')); 
Insert Into Director(iddirector, firstname,lastname,dateofbirth)
Values (3, 'Valerie', 'Donzelli',To_Date('1973-03-02', 'YYYY-MM-DD')); 

--MOVIE COMPANY
Insert Into Moviecompany(idmoviecompany, name ,adress, dayofestablishing,phonenumber)
Values(1, 'Participant Media','331 Foothill Road Third FLoor Beverly Hills',To_Date('2004-01-15', 'YYYY-MM-DD') ,'(310)550-5100');
Insert Into Moviecompany(idmoviecompany, name ,adress, dayofestablishing,phonenumber)
Values(2, 'Columbia Pictures','10202 West Washington Bouevard',To_Date('1918-06-19', 'YYYY-MM-DD') ,'1-310-244-7737');
Insert Into Moviecompany(idmoviecompany, name ,adress, dayofestablishing,phonenumber)
Values(3, 'Wild Bunch','419 Remuera Road',To_Date('2002-07-13', 'YYYY-MM-DD') ,'239-495-2100');

--MOVIE
Insert Into Movie ( idmovie,title, director_iddirector, language_idlanguage,moviecompany_idmoviecompany)
Values( 1, 'Green Book', 1,  1, 1);
Insert Into Movie ( idmovie,title, director_iddirector, language_idlanguage,moviecompany_idmoviecompany)
Values( 2, 'Social Network', 2,  1, 2);
Insert Into Movie ( idmovie,title, director_iddirector, language_idlanguage,moviecompany_idmoviecompany)
Values( 3, 'Declaration of War', 3,  5, 3);



--AWARD RECEIVED
Insert Into Awardreceived (idawardreceived, award_idaward, movie_idmovie,"Date")
Values(1,1,1,To_date( '2018-10-05','YYYY-MM-DD'));
Insert Into Awardreceived (idawardreceived, award_idaward, movie_idmovie,"Date")
Values(2,2,1, To_date( '2018-03-20','YYYY-MM-DD'));
Insert Into Awardreceived (idawardreceived, award_idaward, movie_idmovie, "Date")
Values(3,1,2, To_date( '2011-03-15','YYYY-MM-DD'));
Insert Into Awardreceived (idawardreceived, award_idaward, movie_idmovie, "Date")
Values(4,2,2, To_date( '2011-08-08','YYYY-MM-DD'));
Insert Into Awardreceived (idawardreceived, award_idaward, movie_idmovie, "Date")
Values(5,3,2, To_date( '2011-07-10','YYYY-MM-DD'));
Insert Into Awardreceived (idawardreceived, award_idaward, movie_idmovie, "Date")
Values(6,4,2, To_date( '2011-06-24','YYYY-MM-DD'));
Insert Into Awardreceived (idawardreceived, award_idaward, movie_idmovie, "Date")
Values(7,3,3, To_date( '2012-10-08','YYYY-MM-DD'));

--Movie in a store
Insert Into Movieinastore(idmovieinastore, moviestore_idmoviesotre,movie_idmovie,price)
Values(1,1,1,'50');
Insert Into Movieinastore(idmovieinastore, moviestore_idmoviesotre,movie_idmovie,price)
Values(2,2,1,'60');
Insert Into Movieinastore(idmovieinastore, moviestore_idmoviesotre,movie_idmovie,price)
Values(3,1,2,'50' );
Insert Into Movieinastore(idmovieinastore, moviestore_idmoviesotre,movie_idmovie,price)
Values(4,2,2,'55' );
Insert Into Movieinastore(idmovieinastore, moviestore_idmoviesotre,movie_idmovie,price)
Values(5,1,3,'55');
Insert Into Movieinastore(idmovieinastore, moviestore_idmoviesotre,movie_idmovie,price)
Values(6,2,3,'60' );



--Movie issuance
Insert Into Movieissuance(idmovieissuance, buyingdate, cashier_idcashier, customer_idcustomer, movieinastore_idmovieinastore)
Values (1, To_date('2021-04-15', 'YYYY-MM-DD'), 1, 1, 1);
Insert Into Movieissuance(idmovieissuance, buyingdate, cashier_idcashier, customer_idcustomer, movieinastore_idmovieinastore)
Values (2, To_date('2021-04-15', 'YYYY-MM-DD'), 1, 1, 3);
Insert Into Movieissuance(idmovieissuance, buyingdate, cashier_idcashier, customer_idcustomer, movieinastore_idmovieinastore)
Values (3, To_date('2021-04-15', 'YYYY-MM-DD'), 1, 1, 5);
Insert Into Movieissuance(idmovieissuance, buyingdate, cashier_idcashier, customer_idcustomer, movieinastore_idmovieinastore)
Values (4, To_date('2021-04-15', 'YYYY-MM-DD'), 1, 1, 5);
Insert Into Movieissuance(idmovieissuance, buyingdate, cashier_idcashier, customer_idcustomer, movieinastore_idmovieinastore)
Values (5, To_date('2021-03-24', 'YYYY-MM-DD'), 2, 2, 2);
Insert Into Movieissuance(idmovieissuance, buyingdate, cashier_idcashier, customer_idcustomer, movieinastore_idmovieinastore)
Values (6, To_date('2021-03-18', 'YYYY-MM-DD'), 2, 3, 4);
Insert Into Movieissuance(idmovieissuance, buyingdate, cashier_idcashier, customer_idcustomer, movieinastore_idmovieinastore)
Values (7, To_date('2021-03-18', 'YYYY-MM-DD'), 2, 3, 6);
Insert Into Movieissuance(idmovieissuance, buyingdate, cashier_idcashier, customer_idcustomer, movieinastore_idmovieinastore)
Values (8, To_date('2021-03-10', 'YYYY-MM-DD'), 3, 4, 1);
Insert Into Movieissuance(idmovieissuance, buyingdate, cashier_idcashier, customer_idcustomer, movieinastore_idmovieinastore)
Values (9, To_date('2021-03-10', 'YYYY-MM-DD'), 3, 4, 5);
Insert Into Movieissuance(idmovieissuance, buyingdate, cashier_idcashier, customer_idcustomer, movieinastore_idmovieinastore)
Values (10, To_date('2021-01-05', 'YYYY-MM-DD'), 3, 3, 3);
Insert Into Movieissuance(idmovieissuance, buyingdate, cashier_idcashier, customer_idcustomer, movieinastore_idmovieinastore)
Values (11, To_date('2021-01-07', 'YYYY-MM-DD'), 3, 3, 5);
Insert Into Movieissuance(idmovieissuance, buyingdate, cashier_idcashier, customer_idcustomer, movieinastore_idmovieinastore)
Values (12, To_date('2021-05-30', 'YYYY-MM-DD'), 2, 2, 6);



    



--display titles which prices lower than average
Select price, title
From movieinastore Inner join movie on movie.idmovie=movieinastore.movie_idmovie
Where price < (Select AVG(price)
                From movieinastore
                Where movie_idmovie=movie_idmovie);
                
--display titles with price higher than 55
Select title
From movie
Where idmovie In(Select movie_idmovie
             From movieinastore
            Where price>55);
            

--displays unique cashiers who solved movies in March
select distinct(firstname||' '||lastname) as Cashier
from cashier c, movieissuance m
where c.idcashier=m.cashier_idcashier and TO_CHAR (buyingDate, 'MM') = 03;

--display title, director of the movie and the reward which that movie has received.Name of the award should start with 'O'.
select m.title,d.firstname|| ' '|| d.lastname as Director, a.name as Award
from movie m, director d, awardreceived, award a
where d.iddirector=m.director_iddirector and awardreceived.movie_idmovie=m.idmovie and a.idaward=awardreceived.award_idaward and a.name LIKE 'O%';


--display how many times each cashier sold a movie
select firstname|| ' '||  lastname as cashier,
  (
    select count(*) 
    from movieissuance m
    where cashier.idcashier = m.cashier_idcashier
  ) as sales
FROM cashier;


--show directors who do not have movies in database;
select firstname, lastname
from director
where  not exists (
  select title
  from movie 
 where movie.director_iddirector = director.iddirector
);

--display customers who has name length 5 and if we will round the price they have paid to number divisible by 10 it will be equal to 50;
select distinct(c.firstname), (c.lastname), round(b.price, -1)
from customer c, movieissuance a, movieinastore b
where c.idcustomer=a.customer_idcustomer and a.movieinastore_idmovieinastore=b.idmovieinastore and length(c.firstname)=5 and round(b.price, -1)=50;

--show which title and in what language was made by the oldest director
SELECT l.name, m.title
FROM language l, movie m, director d
WHERE l.idlanguage = m.language_idlanguage and d.iddirector=m.director_iddirector and dateofbirth = (Select min(dateofbirth)
from director );

select * from cashier