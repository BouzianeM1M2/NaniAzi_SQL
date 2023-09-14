USE Corr_BlaBla;
DECLARE
@langue varchar(50), @name varchar(50);
DECLARE c_langue CURSOR FOR
SELECT LIBELLEL
FROM dbo.LANGUE;
OPEN c_langue;
FETCH NEXT FROM c_langue INTO @langue;
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT 'Langue : ' + @langue;
DECLARE c_specialiste CURSOR FOR
    SELECT NOMC
    FROM dbo.SPECIALISER, dbo.CORRECTEUR 
    WHERE dbo.SPECIALISER.IDC = dbo.CORRECTEUR.IDC 
    AND dbo.SPECIALISER.NUML = (SELECT NUML FROM dbo.LANGUE WHERE LIBELLEL = @langue);
OPEN c_specialiste;
FETCH NEXT FROM c_specialiste INTO @name;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Nom & prénom du correcteur : ' + @name;
    FETCH NEXT FROM c_specialiste INTO @name;
END
CLOSE c_specialiste;
DEALLOCATE c_specialiste;
FETCH NEXT FROM c_langue INTO @langue;
END
CLOSE c_langue;
DEALLOCATE c_langue;