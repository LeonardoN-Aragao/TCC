
SELECT *, Consumo_mensal/Residencia_dimension.Quant_Pessoas AS MEDIO from Consumo_fact cf 
JOIN Data_dimension ON Data_dimension_FK  = data_ID
JOIN Classe_dimension ON Classe_dimension_FK  = classe_ID
JOIN Regiao_dimension ON Regiao_dimension_FK = regiao_ID
JOIN Residencia_dimension ON Residencia_dimension_FK = residencia_ID
JOIN Conscientizacao_dimension ON Conscientizacao_dimension_FK = conscientizacao_ID;


SELECT Consumo_mensal/Residencia_dimension.Quant_Pessoas AS MEDIO from Consumo_fact cf 
JOIN Data_dimension ON Data_dimension_FK  = data_ID
JOIN Classe_dimension ON Classe_dimension_FK  = classe_ID
JOIN Regiao_dimension ON Regiao_dimension_FK = regiao_ID
JOIN Residencia_dimension ON Residencia_dimension_FK = residencia_ID
JOIN Conscientizacao_dimension ON Conscientizacao_dimension_FK = conscientizacao_ID;

------------------------------------------------------------------------------

SELECT * from Consumo_fact cf 
JOIN Data_dimension ON Data_dimension_FK  = data_ID
JOIN Classe_dimension ON Classe_dimension_FK  = classe_ID
JOIN Regiao_dimension ON Regiao_dimension_FK = regiao_ID
JOIN Residencia_dimension ON Residencia_dimension_FK = residencia_ID
JOIN Conscientizacao_dimension ON Conscientizacao_dimension_FK = conscientizacao_ID;


-------------------------------------------------------------------------------
-- Consumo mensal medio por regiao

SELECT Regiao, avg(Consumo_mensal)  from (SELECT * from Consumo_fact cf JOIN Regiao_dimension rd ON Regiao_dimension_FK = regiao_ID where Consumo_mensal IS NOT "") GROUP BY Regiao 

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_regiao/", "outputFilePattern": "centro-oeste"}}
SELECT Consumo_mensal from (SELECT * from Consumo_fact cf JOIN Regiao_dimension rd ON Regiao_dimension_FK = regiao_ID where Consumo_mensal IS NOT "" AND Regiao = 'Centro-Oeste');

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_regiao/", "outputFilePattern": "nordeste"}}
SELECT Consumo_mensal from (SELECT * from Consumo_fact cf JOIN Regiao_dimension rd ON Regiao_dimension_FK = regiao_ID where Consumo_mensal IS NOT "" AND Regiao = 'Nordeste');

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_regiao/", "outputFilePattern": "norte"}}
SELECT Consumo_mensal from (SELECT * from Consumo_fact cf JOIN Regiao_dimension rd ON Regiao_dimension_FK = regiao_ID where Consumo_mensal IS NOT "" AND Regiao = 'Norte');

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_regiao/", "outputFilePattern": "sudeste"}}
SELECT Consumo_mensal from (SELECT * from Consumo_fact cf JOIN Regiao_dimension rd ON Regiao_dimension_FK = regiao_ID where Consumo_mensal IS NOT "" AND Regiao = 'Sudeste');

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_regiao/", "outputFilePattern": "sul"}}
SELECT Consumo_mensal from (SELECT * from Consumo_fact cf JOIN Regiao_dimension rd ON Regiao_dimension_FK = regiao_ID where Consumo_mensal IS NOT "" AND Regiao = 'Sul');

-------------------------------------------------------------------------------
-- Consumo mensal medio por classe economica

SELECT Classe_economica, avg(Consumo_mensal)  from (SELECT * from Consumo_fact cf JOIN Classe_dimension cd ON Classe_dimension_FK = classe_ID where Consumo_mensal IS NOT "") GROUP BY Classe_dimension_FK 

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_classe_economica/", "outputFilePattern": "A"}}
SELECT Consumo_mensal from (SELECT * from Consumo_fact cf JOIN Classe_dimension ON Classe_dimension_FK = classe_ID where Consumo_mensal IS NOT "" AND Classe_economica  = 'A');

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_classe_economica/", "outputFilePattern": "B1"}}
SELECT Consumo_mensal from (SELECT * from Consumo_fact cf JOIN Classe_dimension ON Classe_dimension_FK = classe_ID where Consumo_mensal IS NOT "" AND Classe_economica  = 'B1');

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_classe_economica/", "outputFilePattern": "B2"}}
SELECT Consumo_mensal from (SELECT * from Consumo_fact cf JOIN Classe_dimension ON Classe_dimension_FK = classe_ID where Consumo_mensal IS NOT "" AND Classe_economica  = 'B2');

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_classe_economica/", "outputFilePattern": "C1"}}
SELECT Consumo_mensal from (SELECT * from Consumo_fact cf JOIN Classe_dimension ON Classe_dimension_FK = classe_ID where Consumo_mensal IS NOT "" AND Classe_economica  = 'C1');

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_classe_economica/", "outputFilePattern": "C2"}}
SELECT Consumo_mensal from (SELECT * from Consumo_fact cf JOIN Classe_dimension ON Classe_dimension_FK = classe_ID where Consumo_mensal IS NOT "" AND Classe_economica  = 'C2');

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_classe_economica/", "outputFilePattern": "D-E"}}
SELECT Consumo_mensal from (SELECT * from Consumo_fact cf JOIN Classe_dimension ON Classe_dimension_FK = classe_ID where Consumo_mensal IS NOT "" AND Classe_economica  = 'D-E');

-------------------------------------------------------------------------------
-- Consumo mensal medio residencial por escolaridade

SELECT "Escolaridade(chefe_familia)", avg(Consumo_mensal) from (
	SELECT * from Consumo_fact cf JOIN Conscientizacao_dimension cd ON Conscientizacao_dimension_FK = conscientizacao_ID where Consumo_mensal IS NOT "") GROUP BY "Escolaridade(chefe_familia)" 
	
@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_escolaridade/", "outputFilePattern": "analfabeto"}}
SELECT Consumo_mensal from (SELECT * from Consumo_fact cf JOIN Conscientizacao_dimension cd ON Conscientizacao_dimension_FK = conscientizacao_ID where Consumo_mensal IS NOT "" AND "Escolaridade(chefe_familia)" = 'Analfabeto / Fundamental I incompleto');

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_escolaridade/", "outputFilePattern": "fundamental_1_completo"}}
SELECT Consumo_mensal from (SELECT * from Consumo_fact cf JOIN Conscientizacao_dimension cd ON Conscientizacao_dimension_FK = conscientizacao_ID where Consumo_mensal IS NOT "" AND "Escolaridade(chefe_familia)" = 'Fundamental I completo / Fundamental II incompleto');

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_escolaridade/", "outputFilePattern": "medio_incompleto"}}
SELECT Consumo_mensal from (SELECT * from Consumo_fact cf JOIN Conscientizacao_dimension cd ON Conscientizacao_dimension_FK = conscientizacao_ID where Consumo_mensal IS NOT "" AND "Escolaridade(chefe_familia)" = 'Fundamental completo/Médio incompleto');

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_escolaridade/", "outputFilePattern": "superior_incompleto"}}
SELECT Consumo_mensal from (SELECT * from Consumo_fact cf JOIN Conscientizacao_dimension cd ON Conscientizacao_dimension_FK = conscientizacao_ID where Consumo_mensal IS NOT "" AND "Escolaridade(chefe_familia)" = 'Médio completo/Superior incompleto');

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_escolaridade/", "outputFilePattern": "superiro_completo"}}
SELECT Consumo_mensal from (SELECT * from Consumo_fact cf JOIN Conscientizacao_dimension cd ON Conscientizacao_dimension_FK = conscientizacao_ID where Consumo_mensal IS NOT "" AND "Escolaridade(chefe_familia)" = 'Superior completo');


-------------------------------------------------------------------------------
-- Consumo medio por mes no país
@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_mes/", "outputFilePattern": "brasil"}}
SELECT Data_dimension_FK, Mes, avg(Consumo_mensal) as "Consumo_mensal"  from (
	SELECT * from Consumo_fact cf JOIN Data_dimension dd ON Data_dimension_FK = data_ID where Consumo_mensal IS NOT "") GROUP BY Mes ORDER BY Data_dimension_FK  ASC


-- Consumo mensal medio por mes por região	
@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_mes/", "outputFilePattern": "centro_oeste"}}
SELECT Data_dimension_FK, Mes, avg(Consumo_mensal) as "Consumo_mensal"  from (
	SELECT * from Consumo_fact cf 
	JOIN Data_dimension dd ON Data_dimension_FK = data_ID
	JOIN Regiao_dimension rd ON Regiao_dimension_FK = regiao_ID
	where Consumo_mensal IS NOT "" AND Regiao = 'Centro-Oeste') GROUP BY Mes ORDER BY Data_dimension_FK  ASC

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_mes/", "outputFilePattern": "nordeste"}}
SELECT Data_dimension_FK, Mes, avg(Consumo_mensal) as "Consumo_mensal"  from (
	SELECT * from Consumo_fact cf 
	JOIN Data_dimension dd ON Data_dimension_FK = data_ID
	JOIN Regiao_dimension rd ON Regiao_dimension_FK = regiao_ID
	where Consumo_mensal IS NOT "" AND Regiao = 'Nordeste') GROUP BY Mes ORDER BY Data_dimension_FK  ASC

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_mes/", "outputFilePattern": "norte"}}
SELECT Data_dimension_FK, Mes, avg(Consumo_mensal) as "Consumo_mensal"  from (
	SELECT * from Consumo_fact cf 
	JOIN Data_dimension dd ON Data_dimension_FK = data_ID
	JOIN Regiao_dimension rd ON Regiao_dimension_FK = regiao_ID
	where Consumo_mensal IS NOT "" AND Regiao = 'Norte') GROUP BY Mes ORDER BY Data_dimension_FK  ASC

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_mes/", "outputFilePattern": "sudeste"}}
SELECT Data_dimension_FK, Mes, avg(Consumo_mensal) as "Consumo_mensal"  from (
	SELECT * from Consumo_fact cf 
	JOIN Data_dimension dd ON Data_dimension_FK = data_ID
	JOIN Regiao_dimension rd ON Regiao_dimension_FK = regiao_ID
	where Consumo_mensal IS NOT "" AND Regiao = 'Sudeste') GROUP BY Mes ORDER BY Data_dimension_FK  ASC

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_mes/", "outputFilePattern": "sul"}}
SELECT Data_dimension_FK, Mes, avg(Consumo_mensal) as "Consumo_mensal"  from (
	SELECT * from Consumo_fact cf 
	JOIN Data_dimension dd ON Data_dimension_FK = data_ID
	JOIN Regiao_dimension rd ON Regiao_dimension_FK = regiao_ID
	where Consumo_mensal IS NOT "" AND Regiao = 'Sul') GROUP BY Mes ORDER BY Data_dimension_FK  ASC

-------------------------------------------------------------------------------
-- Consumo mensal medio residencial por quantidade de pessoas na residencia
    
SELECT Quant_Pessoas, avg(Consumo_mensal) from (
	SELECT * from Consumo_fact cf JOIN Residencia_dimension rd ON Residencia_dimension_FK = residencia_ID where Consumo_mensal IS NOT "") GROUP BY Quant_Pessoas
	
@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_quant_pessoas/", "outputFilePattern": "1"}}
SELECT Consumo_mensal, Tipo_Energia  from (
	SELECT * from Consumo_fact cf JOIN Residencia_dimension rd ON Residencia_dimension_FK = residencia_ID where Consumo_mensal IS NOT "" AND Quant_Pessoas = 1.0)

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_quant_pessoas/", "outputFilePattern": "2"}}
SELECT Consumo_mensal, Tipo_Energia  from (
	SELECT * from Consumo_fact cf JOIN Residencia_dimension rd ON Residencia_dimension_FK = residencia_ID where Consumo_mensal IS NOT "" AND Quant_Pessoas = 2.0)

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_quant_pessoas/", "outputFilePattern": "3"}}
SELECT Consumo_mensal, Tipo_Energia  from (
	SELECT * from Consumo_fact cf JOIN Residencia_dimension rd ON Residencia_dimension_FK = residencia_ID where Consumo_mensal IS NOT "" AND Quant_Pessoas = 3.0)

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_quant_pessoas/", "outputFilePattern": "4"}}
SELECT Consumo_mensal, Tipo_Energia  from (
	SELECT * from Consumo_fact cf JOIN Residencia_dimension rd ON Residencia_dimension_FK = residencia_ID where Consumo_mensal IS NOT "" AND Quant_Pessoas = 4.0)

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_quant_pessoas/", "outputFilePattern": "5"}}
SELECT Consumo_mensal, Tipo_Energia  from (
	SELECT * from Consumo_fact cf JOIN Residencia_dimension rd ON Residencia_dimension_FK = residencia_ID where Consumo_mensal IS NOT "" AND Quant_Pessoas = 5.0)

-------------------------------------------------------------------------------
-- Classe economica X acesso a informação energia

SELECT Classe_economica, COUNT(*) as Recebe from Consumo_fact
JOIN Conscientizacao_dimension cd ON Conscientizacao_dimension_FK  = conscientizacao_ID
JOIN Classe_dimension ON Classe_dimension_FK = classe_ID
WHERE Consumo_mensal IS NOT "" AND Recebe_Info_Energia = 'Sim'
GROUP BY Classe_economica 
-- Parcial

SELECT Classe_economica, COUNT(*) as Recebe from Consumo_fact
JOIN Conscientizacao_dimension cd ON Conscientizacao_dimension_FK  = conscientizacao_ID
JOIN Classe_dimension ON Classe_dimension_FK = classe_ID
WHERE Consumo_mensal IS NOT ""
GROUP BY Classe_economica 
-- Total

----------------------------------------

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/info_classe_economica/", "outputFilePattern": "info_classe_economica"}}
SELECT cd.Classe_economica, 
	(Interesse * 100.0 / COUNT(*)) as Interesse_Info_Percentage,
	(Recebe  * 100.0 / COUNT(*)) as Recebe_Info_Percentage
FROM Consumo_fact
	JOIN (
		SELECT Classe_economica, COUNT(*) as Recebe from Consumo_fact
		JOIN Conscientizacao_dimension cd ON Conscientizacao_dimension_FK  = conscientizacao_ID
		JOIN Classe_dimension ON Classe_dimension_FK = classe_ID
		WHERE Consumo_mensal IS NOT "" AND Recebe_Info_Energia = 'Sim'
		GROUP BY Classe_economica 
	) AS r ON r.Classe_economica  = cd.Classe_economica 
	JOIN (
		SELECT Classe_economica, COUNT(*) as Interesse 
		from Consumo_fact
		JOIN Conscientizacao_dimension cd ON Conscientizacao_dimension_FK  = conscientizacao_ID
		JOIN Classe_dimension ON Classe_dimension_FK = classe_ID
		WHERE Consumo_mensal IS NOT "" AND Interesse_Info_Energia = 'Sim'
		GROUP BY Classe_economica 
	) AS i ON i.Classe_economica  = cd.Classe_economica 
JOIN Conscientizacao_dimension ON Conscientizacao_dimension_FK  = conscientizacao_ID
JOIN Classe_dimension cd ON Classe_dimension_FK = classe_ID
WHERE Consumo_mensal IS NOT ""
GROUP BY cd.Classe_economica	

-------------------------------------------------------------------------------
-- Consumo X Nível de Conscientização

@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_conscientizacao/", "outputFilePattern": "consumo_conscientizacao"}}
SELECT Consumo_Mensal as Consumo, Tipo_Energia, Recebe_Info_Energia, Interesse_Info_Energia, Compra_Produtos_Economicos, Evita_Banho_Demorado, Regula_Temp_Geladeira, Evita_Acender_Luz_Dia 
FROM Consumo_fact cf 
JOIN Conscientizacao_dimension ON Conscientizacao_dimension_FK  = conscientizacao_ID
JOIN Residencia_dimension ON Residencia_dimension_FK = residencia_ID 
WHERE Consumo_mensal IS NOT "" -- AND Area IS NOT ""

-------------------------------------------------------------------------------
-- Consumo X m2 

--@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_m2_conscientizacao/", "outputFilePattern": "consumo_m2_conscientizacao"}}
--SELECT Consumo_Mensal/rd.Area  as Consumo, Tipo_Energia, Recebe_Info_Energia, Interesse_Info_Energia, Compra_Produtos_Economicos, Evita_Banho_Demorado, Regula_Temp_Geladeira, Evita_Acender_Luz_Dia 
--FROM Consumo_fact cf 
--JOIN Conscientizacao_dimension ON Conscientizacao_dimension_FK  = conscientizacao_ID
--JOIN Residencia_dimension rd ON Residencia_dimension_FK = residencia_ID 
--WHERE Consumo_mensal IS NOT "" AND Consumo IS NOT NULL AND rd.Area IS NOT ""


@export {"type": "csv", "consumer": { "outputFolder": "/home/leonardo/Desktop/TCC/TCC_Codigo/graphs/data/consumo_m2_conscientizacao/", "outputFilePattern": "consumo_m2_conscientizacao"}}
SELECT rd.Area, Consumo_Mensal as Consumo, Tipo_Energia
FROM Consumo_fact cf 
JOIN Residencia_dimension rd ON Residencia_dimension_FK = residencia_ID 
WHERE Consumo_mensal IS NOT "" AND Consumo IS NOT NULL AND rd.Area IS NOT ""
--GROUP by rd.Area



-------------------------------------------
TESTE

--MEDIO IS NOT NULL AND MEDIO IS NOT 0 AND Consumo_mensal >= 20 AND Regiao = 'Sudeste' AND (Consumo_mensal IS NOT ""
SELECT *
FROM Consumo_fact cf 
JOIN Residencia_dimension rd ON Residencia_dimension_FK = residencia_ID 
WHERE rd.Atividade_comercial = "Tem outra(s) atividade(s)"
