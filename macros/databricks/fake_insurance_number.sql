{% macro databricks__fake_insurance_number(seed_column, locale='en_US') %}
    {% if locale == 'pl_PL' %}
        concat(
            'POL',
            {{ dbt_faker.databricks__random_digit_string(seed_column, 1000000, 6) }},
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column, 10000, 4, '_seq') }}
        )
    {% elif locale == 'en_US' %}
        concat(
            {{ dbt_faker.databricks__random_digit_string(seed_column, 1000000, 6) }},
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column, 100000, 5, '_group') }},
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column, 10000, 4, '_policy') }}
        )
    {% endif %}
{% endmacro %}
