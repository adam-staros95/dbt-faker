{% macro get_last_names_by_locale() %}
    {% set locale_map = {
        'pl_PL': [
            'Kowalski', 'Nowak', 'Wiśniewski', 'Wójcik', 'Kamiński', 'Zieliński', 'Szymański', 'Woźniak',
            'Kowalczyk', 'Kaczmarek', 'Mazur', 'Krawczyk', 'Piotrowski', 'Grabowski', 'Zając', 'Pawłowski',
            'Michalski', 'Król', 'Jankowski', 'Wróbel', 'Wieczorek', 'Jabłoński', 'Włodarczyk', 'Wilk',
            'Dudek', 'Stępień', 'Sikora', 'Walczak', 'Baran', 'Rutkowski', 'Michalak', 'Szewczyk',
            'Olejnik', 'Kubiak', 'Majewski', 'Olszewski', 'Jaworski', 'Adamczyk', 'Pawlak', 'Górski',
            'Witkowski', 'Szczepański', 'Dąbrowski', 'Chmielewski', 'Borowski', 'Tomczak', 'Sadowski',
            'Borkowski', 'Czarnecki'
        ],
        'en_US': [
            'Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Miller', 'Davis',
            'Rodriguez', 'Martinez', 'Hernandez', 'Lopez', 'Wilson', 'Anderson', 'Thomas', 'Taylor',
            'Moore', 'Jackson', 'Martin', 'Lee', 'Thompson', 'White', 'Harris', 'Sanchez',
            'Clark', 'Ramirez', 'Lewis', 'Robinson', 'Walker', 'Young', 'Allen', 'King',
            'Wright', 'Scott', 'Torres', 'Nguyen', 'Hill', 'Flores', 'Green', 'Adams',
            'Nelson', 'Baker', 'Hall', 'Rivera', 'Campbell', 'Mitchell', 'Carter', 'Roberts', 'Turner'
        ]
    } %}
    {{ return(locale_map) }}
{% endmacro %}
