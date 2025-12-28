{% macro databricks__fake_driver_licence_number(seed_column, locale='en_US') %}
    {% if locale == 'pl_PL' %}
        concat(
            {{ dbt_faker.databricks__random_letter(seed_column) }},
            {{ dbt_faker.databricks__random_letter(seed_column, '_letter2') }},
            {{ dbt_faker.databricks__random_digit_string(seed_column, 1000000, 6, '_num') }}
        )
    {% elif locale == 'en_US' %}
        concat(
            {{ dbt_faker.databricks__random_letter(seed_column) }},
            {{ dbt_faker.databricks__random_digit_string(seed_column, 1000000, 6, '_num1') }},
            {{ dbt_faker.databricks__random_letter(seed_column, '_letter2') }},
            {{ dbt_faker.databricks__random_digit_string(seed_column, 1000, 3, '_num2') }}
        )
    {% endif %}
{% endmacro %}
