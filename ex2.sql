/* 2.1 */
ALTER TABLE Correcteur 
ADD evaluation numeric(1) CONSTRAINT CK_Evaluation CHECK (evaluation IN (0,1,2,3))


/* 2.2 */
CREATE PROCEDURE EvaluerCorrecteur @NumP INT, @idC INT
AS
BEGIN
    DECLARE @nbCopies INT;
    DECLARE @evaluation INT;
    
    -- Récupérer le nombre de copies du paquet
    SELECT @nbCopies = nbCopies FROM paquet WHERE NumP = @NumP;
    
    -- Évaluer la performance du correcteur en fonction du nombre de copies
    IF @nbCopies = 0 
    BEGIN
        PRINT 'Aucune copie à corriger.';
        SET @evaluation = 0;
    END
    ELSE IF @nbCopies >= 10 AND @nbCopies <= 20 
    BEGIN
        PRINT 'Performance correcte.';
        SET @evaluation = 1;
    END
    ELSE IF @nbCopies >= 20 AND @nbCopies <= 49 
    BEGIN
        PRINT 'Performance supérieure à la moyenne.';
        SET @evaluation = 2;
    END
    ELSE 
    BEGIN
        PRINT 'Performance exceptionnelle.';
        SET @evaluation = 3;
    END
    
    -- Mettre à jour l'évaluation du correcteur dans la table "Correcteur"
    UPDATE Correcteur SET evaluation = @evaluation WHERE idC = @idC;
    
END