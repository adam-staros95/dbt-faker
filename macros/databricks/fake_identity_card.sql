{% macro databricks__fake_identity_card(seed_column, locale='en_US') %}
    {% if locale == 'pl_PL' %}
        concat(
            {{ dbt_faker.databricks__random_letter(seed_column=seed_column) }},
            {{ dbt_faker.databricks__random_letter(seed_column=seed_column, suffix='_letter2') }},
            {{ dbt_faker.databricks__random_letter(seed_column=seed_column, suffix='_letter3') }},
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=1000000, width=6, suffix='_num') }}
        )
    {% elif locale == 'en_US' %}
        concat(
            {{ dbt_faker.databricks__random_letter(seed_column=seed_column) }},
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=10000000, width=7, suffix='_num') }}
        )
    {% endif %}
{% endmacro %}
