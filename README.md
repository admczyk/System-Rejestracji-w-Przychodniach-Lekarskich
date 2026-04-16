# System Rejestracji w Przychodniach Lekarskich
Projekt polegał na stworzeniu systemu rejestracji w przychodniach lekarskich. Ma za zadanie ułatwić rejestracje pacjentów w przychodniach na terenie Warszawy, poprzez zarządzanie danymi posiadanymi przez przychodnię.

## Zakres projektu
System umożliwia sprawniejsze zarządzanie informacjami o pacjentach, lekarzach, przychodniach oraz wizytach lekarskich. Umożliwia rejestrację pacjentów w systemie wraz z ich danymi osobowymi, przypisanie pacjenta do odpowiedniej przychodni oraz zapisanie się na wizytę u wybranego lekarza. System pozwala na planowanie i ewidencjonowanie wizyt, przypisując do każdej z nich konkretnego lekarza, pacjenta, datę i godzinę oraz typ i status wizyty. Umożliwia również zarządzanie grafikiem pracy lekarzy poprzez encję dyżurów oraz przypisywanie lekarzy do konkretnych gabinetów lekarskich w ramach danej przychodni. Przychodnie przypisane są do określonych dzielnic, co wspomaga organizację i lokalizację usług medycznych. System wspiera także przechowywanie informacji kontaktowych oraz specjalizacji lekarzy, co ułatwia dopasowanie ich do odpowiednich typów wizyt. Dodatkowo umożliwia śledzenie, którzy lekarze zastępują innych w przypadku nieobecności

## Wymagania funkcjonalne
- W przychodni zatrudnieni są lekarze (nr PWZ, imię, nazwisko, specjalizacja, adres e-mail, numer telefonu). Każdy lekarz może mieć jednego lekarza, który go zastępuje.
- Każdy lekarz ma przypisany jeden gabinet lekarski (nr gabinetu, typ gabinetu). Gabinet może być używany przez wielu lekarzy.
- W systemie przechowywane są szczegóły dotyczące wizyty (ID wizyty, nr PWZ lekarza przeprowadzającego wizytę, data i godzina wizyty, typ wizyty oraz status wizyty). Każdą wizytę prowadzi jeden lekarz.
- Lekarz może prowadzić wizytę podczas swojego dyżuru (nr PWZ, data i godzina rozpoczęcia dyżuru, data i godzina zakończenia dyżuru).
- System przechowuje informacje o przychodniach (ID przychodni, adres, nazwa przychodni oraz numer telefonu). Każda przychodnia należy do jednej dzielnicy w Warszawie.
- W przychodni zarejestrowani są pacjenci (ID pacjenta, imię, nazwisko, adres zamieszkania, data urodzenia, numer telefonu, PESEL). Każdy pacjent może być zapisany wyłącznie do jednej przychodni.
- Pacjent może zapisać się na wiele wizyt.
- Do przychodni przypisani są lekarze oraz gabinety lekarskie.

## Model pojęciowy
[fota]
## Model logiczny
[fota]
## Model implementacyjny
Model implementacyjny bazy danych zawarty jest w pliku o tej samej nazwie.

### Opis zaimplementowanych funkcji systemu
- Dodawanie/edycja/usuwanie lekarzy do/z bazy danych.
- Dodawanie/edycja/usuwanie pacjentów do/z bazy danych.
- Dodawanie/edycja/usuwanie wizyt zaplanowanych/zrealizowanych/anulowanych do/z bazy danych.
- Dodawanie/edycja/usuwanie dyżurów do/z bazy danych.
- Dodawanie/edycja/usuwanie lekarzy w przychodniach do/z bazy danych.
- Dodawanie/edycja/usuwanie przychodni do/z bazy danych.
- Dodawanie/edycja/usuwanie gabinetów lekarskich do/z bazy danych.
- Dodawanie/edycja/usuwanie dzielnic do/z bazy danych.

## Moduły systemu
### Formularz menu
[fota]
Pozwala użytkownikowi aplikacji na nawigowanie pomiędzy formularzami dostępnymi w aplikacji. Naciśnięcie przycisku powoduje przejście do danego formularza. 
Każdy z tych formularzy zawiera następujące przyciski:
#### Operacje na rekordach
- Nowy rekord - dodaje nowy, czysty rekord do którego użytkownik wprowadza dane
- Usuń rekord - usuwa aktualnie wybrany rekord z bazy danych
- Zapisz rekord - zapisuje wprowadzone dane w wybranym rekordzie

#### Nawigacje po rekordach
- Przycisk strzałki w prawo - pokazuje kolejny rekord w bazie
- Przycisk strzałki w lewo - pokazuje poprzedni rekord w bazie
- Ostatni rekord - pokazuje ostatni rekord w bazie
- Pierwszy rekord - pokazuje pierwszy rekord w bazie

#### Zarządzanie formularzem
- Odśwież formularz - odświeża otwarty formularz
- Powrót do menu - powraca do formularza Menu
- Zamknij formularz - zamyka formularz

### Formularz lekarze
