{% macro get_first_names_by_locale() %}
    {% set locale_map = {
        'pl_PL': ['Adam', 'Piotr', 'Tomasz', 'Jan', 'Anna', 'Katarzyna', 'Magdalena', 'Maria'],
        'en_US': ['Tom', 'John', 'Jerry', 'Michael', 'David', 'Sarah', 'Emily', 'Jennifer']
    } %}
    {{ return(locale_map) }}
{% endmacro %}

