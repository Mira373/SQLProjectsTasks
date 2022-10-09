--CREATE PROCEDURE uspFindProductByModel (
--    @model_year SMALLINT,
--    @product_count INT OUTPUT
--) AS
--BEGIN
--    SELECT 
--        product_name,
--        list_price
--    FROM
--        production.products
--    WHERE
--        model_year = @model_year;

--    SELECT @product_count = @@ROWCOUNT;
--END;

--DECLARE @count INT;
--EXEC uspFindProductByModel
--    @model_year = 2018,
--    @product_count = @count OUTPUT;

--SELECT @count AS 'Number of products found';

DECLARE @count INT;
EXECUTE uspFindProductByModel  @model_year = 2018,
    @product_count = @count OUTPUT;
PRINT @count ;
