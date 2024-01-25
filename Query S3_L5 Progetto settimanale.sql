#Creazione tabella Vendite
CREATE TABLE Vendite(
    IDTransazione INT PRIMARY KEY,
    CategoriaProdotto TEXT(40) NOT NULL,
    CostoVendita DOUBLE NOT NULL,
    ScontoApplicato DOUBLE
);

#Inserire valori dentro alla tabella Vendite
INSERT INTO Vendite(IDTransazione, CategoriaProdotto, CostoVendita, ScontoApplicato)
VALUES
    (1, "Moda e abbigliamento",50.99,0.10),
    (2, "Moda e abbigliamento",79.99,0.15),
    (3, "Moda e abbigliamento",159.99,0.30),
    (4, "Moda e abbigliamento",119.99,0.20),
    (5, "Moda e abbigliamento",65.50,0.5),
    (6, "Ricambi auto",120.0,0.20),
    (7, "Ricambi auto",89.50,0.10),
    (8, "Ricambi auto",200.0,0.25),
    (9, "Mobili e arredamento per la casa",399.99,0.60),
    (10, "Mobili e arredamento per la casa",799.50,0.30),
    (11, "Mobili e arredamento per la casa",299.0,0.25),
    (12, "Generi alimentari",25.0,0.20),
    (13, "Generi alimentari",30.50,0.40),
    (14, "Generi alimentari",10.50,0.5),
    (15, "Generi alimentari",15.99,0.15),
    (16, "Calzature",99.0,0.5),
    (17, "Calzature",59.50,0.20),
    (18, "Calzature",120.0,0.10),
    (19, "Gioielli",499.99,0.25),
    (20, "Gioielli",899.50,0.20),
    (21, "Piante e prodotti per il giardino",49.99,0.25),
    (22, "Piante e prodotti per il giardino",29.50,0.30),
    (23, "Dispositivi elettronici e IoT",799.0,0.10),
    (24, "Dispositivi elettronici e IoT",399.50,0.5),
    (25, "Dispositivi elettronici e IoT",1200.0,0.20),
    (26, "Prodotti per la salute mentale e il benessere",45.0,0.10),
    (27, "Prodotti per la salute mentale e il benessere",60.50,0.30),
    (28, "Prodotti per la salute mentale e il benessere",29.99,0.20),
    (29, "Alimenti e prodotti per animali domestici",20.0,0.15),
    (30, "Alimenti e prodotti per animali domestici",35.50,0.50),
    (31, "Alimenti e prodotti per animali domestici",22.90,0.15),
    (32, "Alimenti e prodotti per animali domestici",15.49,0.10),
    (33, "Alimenti e prodotti per animali domestici",15.99,0.60),
    (34, "Corsi e materiali didattici",150.0,0.30),
    (35, "Corsi e materiali didattici",99.50,0.5),
    (36, "Corsi e materiali didattici",199.0,0.5),
    (37, "Corsi e materiali didattici",350.0,0.20);




#Creazione tabella dettagli_vendite
CREATE TABLE dettagli_vendite(
    IDTransazione INT PRIMARY KEY,
    DataAcquisto DATE NOT NULL,
    Quantità INT NOT NULL
);

#Inserire valori dentro alla tabella dettagli_vendite
INSERT INTO dettagli_vendite(IDTransazione, DataAcquisto, Quantità)
VALUES
    (1,"2023-01-12",2),
    (2,"2023-01-14",1),
    (3,"2023-01-21",1),
    (4,"2023-01-22",1),
    (5,"2023-01-27",1),
    (6,"2023-02-27",3),
    (7,"2023-02-27",2),
    (8,"2023-03-28",1),
    (9,"2023-04-29",1),
    (10,"2023-05-09",3),
    (11,"2023-05-09",2),
    (12,"2023-05-10",2),
    (13,"2023-06-14",1),
    (14,"2023-06-26",3),
    (15,"2023-06-29",2),
    (16,"2023-06-30",1),
    (17,"2023-07-10",1),
    (18,"2023-07-14",1),
    (19,"2023-07-29",2),
    (20,"2023-09-01",3),
    (21,"2023-09-06",3),
    (22,"2023-09-12",1),
    (23,"2023-09-22",2),
    (24,"2023-09-28",1),
    (25,"2023-10-01",3),
    (26,"2023-10-08",2),
    (27,"2023-10-23",1),
    (28,"2023-11-16",1),
    (29,"2023-11-17",3),
    (30,"2023-12-02",3),
    (31,"2023-12-12",2),
    (32,"2023-12-14",3),
    (33,"2023-12-18",2);


#Seleziona tutte le vendite avvenute il 27 Febbraio 2023
SELECT IDTransazione
FROM dettagli_vendite
WHERE DataAcquisto="2023-02-27";

#Seleziona tutte le vendite con sconti maggiori del 50%
SELECT IDTransazione
FROM Vendite
WHERE ScontoApplicato>0.5;

#Calcola il totale delle vendite per categoria
SELECT CategoriaProdotto,SUM(CostoVendita) AS TotVendita
FROM Vendite
GROUP BY CategoriaProdotto;

#Trova il numero totale di prodotti venduti per ogni categoria
SELECT CategoriaProdotto, COUNT(CategoriaProdotto) AS TotProdotti
FROM Vendite
GROUP BY CategoriaProdotto;

#Seleziona le vendite dell'ultimo trimestre
SELECT IDTransazione
FROM dettagli_vendite
WHERE DataAcquisto BETWEEN "2023-10-01" AND "2023-12-31";

#Raggruppa le vendite per mese e calcola il totale delle vendite per ogni mese
SELECT MONTH(dettagli_vendite.DataAcquisto) AS Mese, SUM(CostoVendita*ScontoApplicato*(dettagli_vendite.Quantità)) AS TotVendite
FROM Vendite
JOIN dettagli_vendite ON Vendite.IDTransazione=dettagli_vendite.IDTransazione
GROUP BY MONTH(DataAcquisto);

#Trova la categoria con lo sconto medio più alto
SELECT CategoriaProdotto,AVG(ScontoApplicato) AS ScontoMedio
FROM Vendite
GROUP BY CategoriaProdotto;
#La categoria con lo sconto più alto è "Mobili e arredamento per la casa" con 0.383 di sconto medio


/*Confronta le vendite mese per mese per vedere l'incremento o il decremento delle vendite. Calcola l’incremento o decremento mese per mese
Questa è la tabella risultante:
Mese	TotVendite		IncrementoDecremento
1	126.9415		0
2	89.9			-37.0415
3	50			-39.9
4	239.994			189.994
5       879.05                  639.056
6	82.247			-796.803
7	273.895			191.648
9	945.5925		671.6975
10	747.15			-198.4425
11	14.998000000000001	-732.152
12	83.955			68.957
*/

#Confronta le vendite totali in diverse stagioni
#Tabella Inverno:
SELECT MONTH(dettagli_vendite.DataAcquisto) AS Mese, SUM(CostoVendita*ScontoApplicato*(dettagli_vendite.Quantità)) AS TotVendite
FROM Vendite
JOIN dettagli_vendite ON Vendite.IDTransazione=dettagli_vendite.IDTransazione
WHERE DataAcquisto BETWEEN "2023-01-01" AND "2023-03-20"
GROUP BY MONTH(DataAcquisto);

#Tabella Primavera:
SELECT MONTH(dettagli_vendite.DataAcquisto) AS Mese, SUM(CostoVendita*ScontoApplicato*(dettagli_vendite.Quantità)) AS TotVendite
FROM Vendite
JOIN dettagli_vendite ON Vendite.IDTransazione=dettagli_vendite.IDTransazione
WHERE DataAcquisto BETWEEN "2023-03-21" AND "2023-06-20"
GROUP BY MONTH(DataAcquisto);

#Tabella Estate:
SELECT MONTH(dettagli_vendite.DataAcquisto) AS Mese, SUM(CostoVendita*ScontoApplicato*(dettagli_vendite.Quantità)) AS TotVendite
FROM Vendite
JOIN dettagli_vendite ON Vendite.IDTransazione=dettagli_vendite.IDTransazione
WHERE DataAcquisto BETWEEN "2023-06-21" AND "2023-09-22"
GROUP BY MONTH(DataAcquisto);

#Tabella Autunno:
SELECT MONTH(dettagli_vendite.DataAcquisto) AS Mese, SUM(CostoVendita*ScontoApplicato*(dettagli_vendite.Quantità)) AS TotVendite
FROM Vendite
JOIN dettagli_vendite ON Vendite.IDTransazione=dettagli_vendite.IDTransazione
WHERE DataAcquisto BETWEEN "2023-09-23" AND "2023-12-21"
GROUP BY MONTH(DataAcquisto);

#Supponendo di avere una tabella clienti con i campi IDCliente e IDVendita, scrivi una query per trovare i top 5 clienti con il maggior numero di acquisti
CREATE TABLE Cliente(
    IDCliente INT,
    IDVendita INT PRIMARY KEY
);

INSERT INTO Cliente(IDCliente, IDVendita)
VALUES
    (7,1),
(13,2),
(10,3),
(12,4),
(14,5),
(8,6),
(7,7),
(15,8),
(8,9),
(1,10),
(13,11),
(2,12),
(1,13),
(4,14),
(2,15),
(12,16),
(5,17),
(5,18),
(2,19),
(3,20),
(13,21),
(2,22),
(6,23),
(15,24),
(3,25),
(1,26),
(1,27),
(11,28),
(14,29),
(10,30),
(10,31),
(14,32),
(7,33);

SELECT IDCliente, COUNT(IDCliente) AS NumAcquisti
FROM Cliente
GROUP BY IDCliente
ORDER BY NumAcquisti DESC, IDCliente
LIMIT 5