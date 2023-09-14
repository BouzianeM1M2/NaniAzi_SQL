USE Corr_BlaBla
DECLARE @name varchar(50), @eval numeric(1);
DECLARE c_correcteur CURSOR FOR
    SELECT NOMC, EVALUATION FROM CORRECTEUR;
OPEN c_correcteur;
FETCH NEXT FROM c_correcteur INTO @name, @eval;
WHILE @@FETCH_STATUS = 0
BEGIN
    IF @eval IS NULL
    BEGIN
        PRINT 'Pas d''évaluation pour ' + @name;
    END
    ELSE
    BEGIN
        PRINT 'Nom: ' + @name + ', Évaluation: ' + CAST(@eval AS varchar(10));
    END
    FETCH NEXT FROM c_correcteur INTO @name, @eval;
END
CLOSE c_correcteur;
DEALLOCATE c_correcteur;