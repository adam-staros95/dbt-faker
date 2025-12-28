{% macro get_races_by_locale() %}
    {% set locale_map = {
        'pl_PL': [
            'Biały', 'Czarny', 'Latynos', 'Azjata', 'Rdzenni Amerykanie', 'Hawajczyk', 'Inna'
        ],
        'en_US': [
            'White', 'Black', 'Latin', 'Asian', 'Native American', 'Pacific Islander', 'Other'
        ]
    } %}
    {{ return(locale_map) }}
{% endmacro %}
