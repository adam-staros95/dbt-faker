{% macro databricks__fake_email(seed_column, locale='en_US') %}
    {% set domain_map = dbt_faker.get_email_domains_by_locale() %}
    {% set domains = domain_map[locale] %}
    {% set domains_count = domains | length %}
    {% set quoted_domains = [] %}
    {% for domain in domains %}
        {% do quoted_domains.append("'" ~ domain ~ "'") %}
    {% endfor %}

    concat(
        case
            {{ dbt_faker.databricks__hash_mod(seed_column=seed_column, range=6) }}
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
                        {{ dbt_faker.databricks__hash_mod(seed_column=seed_column, range=9999, suffix='_num') }}
                        as string
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
                        {{ dbt_faker.databricks__hash_mod(seed_column=seed_column, range=999999, suffix='_rand') }}
                        as string
                    )
                )
        end,
        '@',
        element_at(
            array({{ quoted_domains | join(', ') }}),
            1
            + {{ dbt_faker.databricks__hash_mod(seed_column=seed_column, range=domains_count, suffix='_domain') }}
        )
    )
{% endmacro %}
