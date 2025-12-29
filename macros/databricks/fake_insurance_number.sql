{% macro databricks__fake_insurance_number(seed_column, locale='en_US') %}
    {% if locale == 'pl_PL' %}
        concat(
            'POL',
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=1000000, width=6) }},
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=10000, width=4, suffix='_seq') }}
        )
    {% elif locale == 'en_US' %}
        concat(
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=1000000, width=6) }},
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=100000, width=5, suffix='_group') }},
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=10000, width=4, suffix='_policy') }}
        )
    {% endif %}
{% endmacro %}
