{% macro databricks__fake_postal_code(seed_column, locale='en_US') %}
    {% if locale == 'pl_PL' %}
        concat(
            {{ dbt_faker.databricks__random_digit_string(seed_column, 100, 2) }},
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column, 999, 3, '_postal', 1) }}
        )
    {% elif locale == 'en_US' %}
        {{ dbt_faker.databricks__random_digit_string(seed_column, 90000, 5, offset=10000) }}
    {% endif %}
{% endmacro %}
