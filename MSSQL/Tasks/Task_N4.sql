
     ------ ისეთ კონსტრუქციაში სადაც Begin End გავქს გამოყენებული და პროცედურას ამნაირად ვქმნით 
	 --( ანუ სახელს არ ვარქმევთ და რ ვინახავთ ) 
	 --ესეთმა ფუნქციამ რესალტ რომ დააბრუნოს გვინდა select ახლიდან გავუწეროთ
   BEGIN          
    DECLARE @name VARCHAR(MAX);

    SELECT TOP 1
        @name = product_name
    FROM
        production.products
    ORDER BY
        list_price DESC;

    ----SELECT @name; -- აი ეს რომ არ გაეწერო იმუშავებს მაგრამ რეზალთს არ დააბრუნებს. და თუ ჩავრთავ რეზალთს დააბრუნებს

    IF @@ROWCOUNT <> 0
    BEGIN
        PRINT 'The most expensive product is ' + @name
    END
    ELSE
    BEGIN
        PRINT 'No product found';
    END;
END