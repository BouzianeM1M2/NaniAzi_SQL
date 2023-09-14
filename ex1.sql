
/*1.1*/
Use Corr_BlaBla
DECLARE @idt int;
DECLARE @name varchar(50);
DECLARE @street varchar(50);
DECLARE @cp int;
DECLARE @city varchar(50);
SELECT 
@id= IDC,
@nom = NOMC,
@rue  = RUE,
@cp = CP, 
@ville = VILLE 
FROM dbo.CORRECTEUR WHERE NOMC = 'Parada Elena';
print 'Correcteur : id: ' +  CAST(@idt as varchar(50)) + ' nom: ' + @name + ' rue: ' + @street + ' code postale: ' + CAST(@cp as varchar(50)) +' ville: ' + @city

/*1.2*/
Use Corr_BlaBla
DECLARE @nbpaquet int;
DECLARE @nbcopie int;
SELECT @nbpaquet = COUNT(*), @nbcopie = SUM(PAQUET.NBCOPIES)  FROM dbo.CORRECTEUR as correcteur, dbo.PAQUET as paquet, dbo.LANGUE as langue
WHERE correcteur.IDC = paquet.IDC AND LANGUE.NUML = paquet.NUML AND correcteur.NOMC = 'Parada Elena' AND langue.LIBELLEL = 'Russe'
PRINT 'Nombre de paquet : ' +  CAST(@nbpaquet as varchar(4)) 
PRINT 'Nombre de copies au total : ' +  CAST(@nbcopie as varchar(4))

/*1.3*/
Use Corr_BlaBla
DECLARE @nbcopie int;
SELECT @nbcopie = SUM(PAQUET.NBCOPIES)  FROM dbo.CORRECTEUR as correcteur, dbo.PAQUET as paquet, dbo.LANGUE as langue
WHERE correcteur.IDC = paquet.IDC AND LANGUE.NUML = paquet.NUML AND correcteur.NOMC = 'Parada Elena' AND langue.LIBELLEL = 'Russe'

IF @nbcopie = 0
	PRINT 'Aucune copie ';

IF @nbcopie > 10
	PRINT 'Il y a plus de 10 copie !';