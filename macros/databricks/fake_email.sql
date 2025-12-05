{% macro databricks__fake_email(seed_column, locale='en_US') %}
    {% set domain_map = dbt_faker.get_email_domains_by_locale() %}
    {% set domains = domain_map[locale] %}
    {% set quoted_domains = [] %}
    {% for domain in domains %}
        {% do quoted_domains.append("'" ~ domain ~ "'") %}
    {% endfor %}

    concat(
        case
            mod(abs(hash(cast({{ seed_column }} as string))), 6)
            when 0
            then
                concat(
                    lower({{ dbt_faker.fake_first_name(seed_column, locale) }}),
                    '.',
                    lower({{ dbt_faker.fake_last_name(seed_column, locale) }})
                )
            when 1
            then
                concat(
                    lower({{ dbt_faker.fake_first_name(seed_column, locale) }}),
                    '_',
                    lower({{ dbt_faker.fake_last_name(seed_column, locale) }})
                )
            when 2
            then
                concat(
                    lower({{ dbt_faker.fake_first_name(seed_column, locale) }}),
                    cast(
                        mod(
                            abs(
                                hash(cast(concat({{ seed_column }}, '_num') as string))
                            ),
                            9999
                        ) as string
                    )
                )
            when 3
            then
                concat(
                    lower(
                        substring(
                            {{ dbt_faker.fake_first_name(seed_column, locale) }}, 1, 1
                        )
                    ),
                    lower({{ dbt_faker.fake_last_name(seed_column, locale) }})
                )
            when 4
            then
                concat(
                    lower({{ dbt_faker.fake_first_name(seed_column, locale) }}),
                    lower({{ dbt_faker.fake_last_name(seed_column, locale) }})
                )
            else
                concat(
                    'user',
                    cast(
                        mod(
                            abs(
                                hash(cast(concat({{ seed_column }}, '_rand') as string))
                            ),
                            999999
                        ) as string
                    )
                )
        end,
        '@',
        element_at(
            array({{ quoted_domains | join(', ') }}),
            1 + mod(
                abs(hash(cast(concat({{ seed_column }}, '_domain') as string))),
                {{ domains | length }}
            )
        )
    )
{% endmacro %}
