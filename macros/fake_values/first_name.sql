{% macro get_first_names_by_locale() %}
    {% set locale_map = {
        'pl_PL': [
            'Adam', 'Piotr', 'Tomasz', 'Jan', 'Anna', 'Katarzyna', 'Magdalena', 'Maria',
            'Jakub', 'Szymon', 'Michał', 'Paweł', 'Mateusz', 'Krzysztof', 'Andrzej',
            'Marcin', 'Wojciech', 'Maciej', 'Rafał', 'Grzegorz', 'Łukasz', 'Patryk',
            'Bartłomiej', 'Sebastian', 'Dawid', 'Zbigniew', 'Julia', 'Zuzanna', 'Maja',
            'Oliwia', 'Alicja', 'Natalia', 'Wiktoria', 'Amelia', 'Hanna', 'Helena',
            'Joanna', 'Ewa', 'Agnieszka', 'Monika', 'Karolina', 'Paulina', 'Weronika',
            'Emilia', 'Barbara', 'Beata', 'Iwona', 'Izabela'
        ],
        'en_US': [
            'Tom', 'John', 'Jerry', 'Michael', 'David', 'Sarah', 'Emily', 'Jennifer',
            'James', 'Robert', 'William', 'Richard', 'Joseph', 'Thomas', 'Charles', 'Daniel',
            'Matthew', 'Anthony', 'Mark', 'Donald', 'Steven', 'Paul', 'Andrew', 'Joshua',
            'Kenneth', 'Kevin', 'Brian', 'George', 'Timothy', 'Ronald', 'Jason', 'Edward',
            'Jeffrey', 'Ryan', 'Jacob', 'Gary', 'Nicholas', 'Eric', 'Jonathan', 'Stephen',
            'Larry', 'Justin', 'Scott', 'Brandon', 'Benjamin', 'Samuel', 'Frank', 'Gregory'
        ]
    } %}
    {{ return(locale_map) }}
{% endmacro %}
