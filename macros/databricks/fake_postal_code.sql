{% macro databricks__fake_postal_code(seed_column, locale='en_US') %}
    {% if locale == 'pl_PL' %}
        concat(
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=100, width=2) }},
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=999, width=3, suffix='_postal', offset=1) }}
        )
    {% elif locale == 'en_US' %}
        {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=90000, width=5, offset=10000) }}
    {% endif %}
{% endmacro %}
