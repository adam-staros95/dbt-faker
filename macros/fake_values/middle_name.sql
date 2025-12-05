{% macro get_middle_names_by_locale() %}
    {% set locale_map = {
        'pl_PL': [
            'Adrian', 'Alan', 'Albert', 'Aleksander', 'Aleksandra', 'Alicja',
            'Alina', 'Anita', 'Antoni', 'Aurelia', 'Bartosz', 'Blanka',
            'Borys', 'Brygida', 'Cezary', 'Celina', 'Cyprian', 'Daniel',
            'Diana', 'Dominik', 'Dominika', 'Edward', 'Eliza', 'Elżbieta',
            'Ernest', 'Eryk', 'Ewelina', 'Filip', 'Gabriel', 'Gabriela',
            'Halina', 'Henryk', 'Igor', 'Ilona', 'Ireneusz', 'Irena',
            'Jacek', 'Jarosław', 'Jolanta', 'Justyna', 'Kamil', 'Kinga',
            'Konrad', 'Kornelia', 'Lech', 'Leon', 'Liliana', 'Łucja'
        ],
        'en_US': [
            'James', 'William', 'Robert', 'Joseph', 'Richard', 'Thomas', 'Edward', 'Charles',
            'Daniel', 'Matthew', 'Anthony', 'Mark', 'Donald', 'Steven', 'Paul', 'Andrew',
            'Joshua', 'Kenneth', 'Kevin', 'Brian', 'George', 'Timothy', 'Ronald', 'Jason',
            'Jeffrey', 'Ryan', 'Jacob', 'Gary', 'Nicholas', 'Eric', 'Jonathan', 'Stephen',
            'Larry', 'Justin', 'Scott', 'Brandon', 'Benjamin', 'Samuel', 'Frank', 'Gregory',
            'Raymond', 'Alexander', 'Patrick', 'Jack', 'Dennis', 'Jerry', 'Henry', 'Adam'
        ]
    } %}
    {{ return(locale_map) }}
{% endmacro %}
