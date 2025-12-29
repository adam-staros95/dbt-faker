{% macro databricks__fake_home_number(seed_column, locale='en_US') %}
    concat(
        cast(
            1
            + {{ dbt_faker.databricks__hash_mod(seed_column=seed_column, range=200, suffix='_street_num') }}
            as string
        ),
        case
            when
                {{ dbt_faker.databricks__hash_mod(seed_column=seed_column, range=2, suffix='_apt') }}
                = 0
            then
                concat(
                    '/',
                    cast(
                        1
                        + {{ dbt_faker.databricks__hash_mod(seed_column=seed_column, range=100, suffix='_apt_num') }}
                        as string
                    )
                )
            else ''
        end
    )
{% endmacro %}
