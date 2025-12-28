{% macro databricks__fake_passport(seed_column, locale='en_US') %}
    {% if locale == 'pl_PL' %}
        concat(
            {{ dbt_faker.databricks__random_letter(seed_column=seed_column) }},
            {{ dbt_faker.databricks__random_letter(seed_column=seed_column, suffix='_letter2') }},
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=10000000, width=7, suffix='_num') }}
        )
    {% elif locale == 'en_US' %}
        concat(
            element_at(
                array('A', 'X', 'Y', 'Z'),
                1
                + {{ dbt_faker.databricks__hash_mod(seed_column=seed_column, range=4) }}
            ),
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=100000000, width=8, suffix='_num') }}
        )
    {% endif %}
{% endmacro %}
