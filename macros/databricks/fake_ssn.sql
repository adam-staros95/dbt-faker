{% macro databricks__fake_ssn(seed_column, locale='en_US') %}
    {% if locale == 'pl_PL' %}
        concat(
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=100, width=2) }},
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=12, width=2, suffix='_month', offset=1) }},
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=28, width=2, suffix='_day', offset=1) }},
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=10000, width=4, suffix='_seq') }},
            cast(
                {{ dbt_faker.databricks__hash_mod(seed_column=seed_column, range=10, suffix='_check') }}
                as string
            )
        )
    {% elif locale == 'en_US' %}
        concat(
            case
                when
                    {{ dbt_faker.databricks__hash_mod(seed_column=seed_column, range=899) }}
                    < 665
                then
                    {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=665, width=3, offset=1) }}
                else
                    {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=233, width=3, suffix='_area', offset=667) }}
            end,
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=99, width=2, suffix='_group', offset=1) }},
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=9999, width=4, suffix='_serial', offset=1) }}
        )
    {% endif %}
{% endmacro %}
