IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lekarze w przychodniach]') AND type in (N'U'))
    DROP TABLE [dbo].[Lekarze w przychodniach]
GO
CREATE TABLE [dbo].[Lekarze w przychodniach] (
[id_lekarza] int NOT NULL  
, [id_przychodni] int  NOT NULL  
)
GO
 
ALTER TABLE [dbo].[Lekarze w przychodniach] ADD CONSTRAINT [Lekarze w przychodniach_PK] PRIMARY KEY CLUSTERED (
[id_lekarza]
, [id_przychodni]
)
GO
GO
 
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lekarze]') AND type in (N'U'))
    DROP TABLE [dbo].[Lekarze]
GO
CREATE TABLE [dbo].[Lekarze] (
[nr PWZ] int  NOT NULL  
, [imie] nvarchar(50)  NOT NULL  
, [nazwisko] nvarchar(100)  NOT NULL  
, [specjalizacja] nvarchar(200)  NOT NULL  
, [adres e-mail] nvarchar(150)  NOT NULL  
, [numer telefonu] nvarchar(15)  NOT NULL  
, [id_lekarza] int identity NOT NULL  
, [id_gabinetu] int  NOT NULL  
, [id_zastepcy] int  NULL  
)
GO
 
ALTER TABLE [dbo].[Lekarze] ADD CONSTRAINT [Lekarze_PK] PRIMARY KEY CLUSTERED (
[id_lekarza]
)
GO
GO
 
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Wizyty]') AND type in (N'U'))
    DROP TABLE [dbo].[Wizyty]
GO
CREATE TABLE [dbo].[Wizyty] (
[id_wizyty] int identity NOT NULL  
, [data i godzina wizyty] datetime  NOT NULL
, [typ wizyty] nvarchar(200)  NOT NULL  
, [status wizyty] nvarchar(100)  NOT NULL  
, [id_lekarza] int  NOT NULL  
, [id_pacjenta] int  NOT NULL  
)
GO
 
ALTER TABLE [dbo].[Wizyty] ADD CONSTRAINT [Wizyty_PK] PRIMARY KEY CLUSTERED (
[id_wizyty]
)
GO
GO
 
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Przychodnie]') AND type in (N'U'))
    DROP TABLE [dbo].[Przychodnie]
GO
CREATE TABLE [dbo].[Przychodnie] (
[id_przychodni] int identity NOT NULL  
, [adres] nvarchar(100)  NOT NULL  
, [nazwa przychodni] nvarchar(100)  NOT NULL  
, [numer telefonu] nvarchar(15)  NOT NULL  
, [id_dzielnicy] int  NOT NULL  
)
GO
 
ALTER TABLE [dbo].[Przychodnie] ADD CONSTRAINT [Przychodnie_PK] PRIMARY KEY CLUSTERED (
[id_przychodni]
)
GO
GO
 
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dzielnice]') AND type in (N'U'))
    DROP TABLE [dbo].[Dzielnice]
GO
CREATE TABLE [dbo].[Dzielnice] (
[nazwa dzielnicy] nvarchar(30)  NOT NULL  
, [id_dzielnicy] int identity NOT NULL  
)
GO
 
ALTER TABLE [dbo].[Dzielnice] ADD CONSTRAINT [Dzielnice_PK] PRIMARY KEY CLUSTERED (
[id_dzielnicy]
)
GO
GO
 
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Gabinety lekarskie]') AND type in (N'U'))
    DROP TABLE [dbo].[Gabinety lekarskie]
GO
CREATE TABLE [dbo].[Gabinety lekarskie] (
[typ gabinetu] nvarchar(100)  NOT NULL  
, [nr gabinetu] int  NOT NULL  
, [id_gabinetu] int identity NOT NULL  
, [id_przychodni] int  NOT NULL  
)
GO
 
ALTER TABLE [dbo].[Gabinety lekarskie] ADD CONSTRAINT [Gabinety lekarskie_PK] PRIMARY KEY CLUSTERED (
[id_gabinetu]
)
GO
GO
 
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pacjenci]') AND type in (N'U'))
    DROP TABLE [dbo].[Pacjenci]
GO
CREATE TABLE [dbo].[Pacjenci] (
[id_pacjenta] int identity NOT NULL  
, [imie] nvarchar(50)  NOT NULL  
, [nazwisko] nvarchar(100)  NOT NULL  
, [adres zamieszkania] nvarchar(200)  NOT NULL  
, [data urodzenia] date  NOT NULL  
, [PESEL] nvarchar(11)  NOT NULL  
, [numer telefonu] nvarchar(15)  NOT NULL  
, [id_przychodni] int  NOT NULL  
)
GO
 
ALTER TABLE [dbo].[Pacjenci] ADD CONSTRAINT [Pacjenci_PK] PRIMARY KEY CLUSTERED (
[id_pacjenta]
)
GO
GO
 
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dyżury]') AND type in (N'U'))
    DROP TABLE [dbo].[Dyżury]
GO
CREATE TABLE [dbo].[Dyżury] (
[id_dyzuru] int identity NOT NULL  
, [data i godzina rozpoczęcia] datetime  NOT NULL
, [data i godzina zakończenia] datetime  NOT NULL
, [id_lekarza] int  NOT NULL  
)
GO
 
ALTER TABLE [dbo].[Dyżury] ADD CONSTRAINT [Dyżury_PK] PRIMARY KEY CLUSTERED (
[id_dyzuru]
)
GO
GO
 
ALTER TABLE [dbo].[Lekarze w przychodniach] WITH CHECK ADD CONSTRAINT [Lekarze_Lekarze w przychodniach_FK1] FOREIGN KEY (
[id_lekarza]
)
REFERENCES [dbo].[Lekarze] (
[id_lekarza]
)
ALTER TABLE [dbo].[Lekarze w przychodniach] WITH CHECK ADD CONSTRAINT [Przychodnie_Lekarze w przychodniach_FK1] FOREIGN KEY (
[id_przychodni]
)
REFERENCES [dbo].[Przychodnie] (
[id_przychodni]
)
GO
 
ALTER TABLE [dbo].[Lekarze] WITH CHECK ADD CONSTRAINT [Lekarze_Lekarze_FK1] FOREIGN KEY (
[id_zastepcy]
)
REFERENCES [dbo].[Lekarze] (
[id_lekarza]
)
ALTER TABLE [dbo].[Lekarze] WITH CHECK ADD CONSTRAINT [Gabinety lekarskie_Lekarze_FK1] FOREIGN KEY (
[id_gabinetu]
)
REFERENCES [dbo].[Gabinety lekarskie] (
[id_gabinetu]
)
GO
 
ALTER TABLE [dbo].[Wizyty] WITH CHECK ADD CONSTRAINT [Pacjenci_Wizyty_FK1] FOREIGN KEY (
[id_pacjenta]
)
REFERENCES [dbo].[Pacjenci] (
[id_pacjenta]
)
ALTER TABLE [dbo].[Wizyty] WITH CHECK ADD CONSTRAINT [Lekarze_Wizyty_FK1] FOREIGN KEY (
[id_lekarza]
)
REFERENCES [dbo].[Lekarze] (
[id_lekarza]
)
GO
 
ALTER TABLE [dbo].[Przychodnie] WITH CHECK ADD CONSTRAINT [Dzielnice_Przychodnie_FK1] FOREIGN KEY (
[id_dzielnicy]
)
REFERENCES [dbo].[Dzielnice] (
[id_dzielnicy]
)
GO
 
GO
 
ALTER TABLE [dbo].[Gabinety lekarskie] WITH CHECK ADD CONSTRAINT [Przychodnie_Gabinety lekarskie_FK1] FOREIGN KEY (
[id_przychodni]
)
REFERENCES [dbo].[Przychodnie] (
[id_przychodni]
)
GO
 
ALTER TABLE [dbo].[Pacjenci] WITH CHECK ADD CONSTRAINT [Przychodnie_Pacjenci_FK1] FOREIGN KEY (
[id_przychodni]
)
REFERENCES [dbo].[Przychodnie] (
[id_przychodni]
)
GO
 
ALTER TABLE [dbo].[Dyżury] WITH CHECK ADD CONSTRAINT [Lekarze_Dyżury_FK1] FOREIGN KEY (
[id_lekarza]
)
REFERENCES [dbo].[Lekarze] (
[id_lekarza]
)
GO
