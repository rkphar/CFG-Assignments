CREATE DATABASE pharaoh ;

USE pharaoh ;

CREATE TABLE biscuits (
		batch_no INT NOT NULL ,
        biscuit_name VARCHAR(25) NOT NULL ,
        price_per_pack FLOAT(2) ,
        allergy_info VARCHAR(25) ,
        expiry_date DATE NOT NULL ,
        CONSTRAINT pk_batch PRIMARY KEY (batch_no)) ;


INSERT INTO biscuits (batch_no, biscuit_name, price_per_pack, allergy_info, expiry_date)
VALUES
(4101, 'Bourbon', 0.60, 'gluten', '2024-12-30' ) ,
(4102, 'Custard Cream', 0.60, 'gluten, milk', '2024-10-02') ,
(4103, 'Chocolate Chip Cookie', 0.75, 'gluten, milk, soya', '2024-11-11') ,
(4104, 'Digestive', 0.75, 'gluten, oats', '2025-02-19') ,
(4105, 'Jammie Dodger', 0.80, 'gluten', '2024-09-24') ,
(4106, 'Empire Biscuit', 1.00, 'gluten', '2024-07-25') ,
(4107, 'Ginger Nut', 0.60, 'gluten', '2025-03-28') ,
(4108, 'Coconut Ring', 0.70, 'gluten, milk, oats', '2024-12-05') ,
(4109, 'Oaties', 0.75, 'gluten, oats', '2025-04-17') ,
(4110, 'Rich Tea', 0.65, 'gluten, barley', '2025-01-20') ;

SELECT * FROM biscuits ;
