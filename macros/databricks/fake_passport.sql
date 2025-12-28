{% macro databricks__fake_passport(seed_column, locale='en_US') %}
    {% if locale == 'pl_PL' %}
        concat(
            {{ dbt_faker.databricks__random_letter(seed_column) }},
            {{ dbt_faker.databricks__random_letter(seed_column, '_letter2') }},
            {{ dbt_faker.databricks__random_digit_string(seed_column, 10000000, 7, '_num') }}
        )
    {% elif locale == 'en_US' %}
        concat(
            element_at(
                array('A', 'X', 'Y', 'Z'),
                1 + {{ dbt_faker.databricks__hash_mod(seed_column, 4) }}
            ),
            {{ dbt_faker.databricks__random_digit_string(seed_column, 100000000, 8, '_num') }}
        )
    {% endif %}
{% endmacro %}
