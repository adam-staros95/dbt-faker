{% macro get_middle_names_by_locale() %}
    {% set locale_map = {
        'pl_PL': ['Józef', 'Marian', 'Stanisław', 'Andrzej', 'Kazimierz', 'Antoni', 'Władysław', 'Jerzy'],
        'en_US': ['James', 'William', 'Robert', 'Joseph', 'Richard', 'Thomas', 'Edward', 'Charles']
    } %}
    {{ return(locale_map) }}
{% endmacro %}

