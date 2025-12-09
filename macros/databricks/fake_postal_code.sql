{% macro databricks__fake_postal_code(seed_column, locale='en_US') %}
    {% if locale == 'pl_PL' %}
        concat(
            lpad(
                cast(mod(abs(hash(cast({{ seed_column }} as string))), 100) as string),
                2,
                '0'
            ),
            '-',
            lpad(
                cast(
                    1 + mod(
                        abs(hash(cast(concat({{ seed_column }}, '_postal') as string))),
                        999
                    ) as string
                ),
                3,
                '0'
            )
        )
    {% elif locale == 'en_US' %}
        lpad(
            cast(
                10000
                + mod(abs(hash(cast({{ seed_column }} as string))), 90000) as string
            ),
            5,
            '0'
        )
    {% endif %}
{% endmacro %}
