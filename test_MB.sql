-- 1.
SELECT model, speed, hd 
FROM PC 
WHERE price < 500

-- 2.
SELECT 
  DISTINCT maker 
FROM 
  Product 
WHERE 
  type = 'printer'

-- 3.
SELECT 
  model, 
  ram, 
  screen 
FROM 
  Laptop 
WHERE 
  price > 1000

-- 4.
SELECT * FROM Printer WHERE Color = 'y'

-- 5.
SELECT 
  model, 
  speed, 
  hd 
FROM 
  PC 
WHERE 
  price < 600 
  AND (
    cd = '12x' 
    OR cd = '24x'
  )

-- 6.
SELECT 
  DISTINCT maker, 
  laptop.speed 
FROM 
  Product 
  INNER JOIN laptop ON laptop.model = Product.model 
WHERE 
  laptop.hd >= 10

-- 7.
SELECT 
  pc.model, 
  pc.price 
FROM 
  pc 
  JOIN product ON pc.model = product.model 
WHERE 
  maker = 'B' 
UNION 
SELECT 
  laptop.model, 
  laptop.price 
FROM 
  laptop 
  JOIN product ON laptop.model = product.model 
WHERE 
  maker = 'B' 
UNION 
SELECT 
  printer.model, 
  printer.price 
FROM 
  printer 
  JOIN product ON printer.model = product.model 
WHERE 
  maker = 'B'

-- 8.


-- 9.
SELECT 
  DISTINCT maker 
FROM 
  product 
  JOIN pc ON product.model = pc.model 
WHERE 
  pc.speed >= 450

-- 10.
SELECT 
  model, 
  price 
FROM 
  printer 
WHERE 
  price = (
    SELECT 
      MAX(price) 
    FROM 
      printer
  )

-- 11.
SELECT 
  AVG(speed) 
from 
  PC

-- 12.
SELECT 
  AVG(speed) 
FROM 
  laptop 
where 
  price > 1000;

-- 13.
SELECT 
  AVG(speed) 
FROM 
  PC 
  JOIN PRODUCT ON pc.model = product.model 
WHERE 
  product.maker = 'A'

-- 14.
SELECT 
  Ships.class, 
  Ships.name, 
  Classes.country 
FROM 
  Ships 
  INNER JOIN Classes ON Classes.class = Ships.class 
WHERE 
  Classes.numGuns >= 10

-- 15.
SELECT 
  hd 
FROM 
  Pc 
GROUP BY 
  hd 
HAVING 
  COUNT(hd) >= 2

-- 16.
SELECT 
  DISTINCT A.model AS model_1, 
  B.model AS model_2, 
  A.speed, 
  A.ram 
FROM 
  PC AS A, 
  PC B 
WHERE 
  A.speed = B.speed 
  AND A.ram = B.ram 
  AND A.model > B.model

-- 17.
SELECT 
  DISTINCT Product.type, 
  Laptop.model, 
  Laptop.speed 
FROM 
  Product, 
  laptop, 
  Pc 
WHERE 
  Laptop.speed < ALL (
    SELECT 
      speed 
    FROM 
      Pc
  ) 
  AND Product.type = 'Laptop'
