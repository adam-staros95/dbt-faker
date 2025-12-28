{% macro databricks__fake_card_number(seed_column, formatted=true) %}
    {% if formatted %}
        concat(
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=10000, width=4, suffix='_part1') }},
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=10000, width=4, suffix='_part2') }},
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=10000, width=4, suffix='_part3') }},
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=10000, width=4, suffix='_part4') }}
        )
    {% else %}
        concat(
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=10000, width=4, suffix='_part1') }},
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=10000, width=4, suffix='_part2') }},
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=10000, width=4, suffix='_part3') }},
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=10000, width=4, suffix='_part4') }}
        )
    {% endif %}
{% endmacro %}
