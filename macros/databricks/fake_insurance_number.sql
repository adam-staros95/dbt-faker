{% macro databricks__fake_insurance_number(seed_column, locale='en_US') %}
    {% if locale == 'pl_PL' %}
        concat(
            'POL',
            lpad(
                cast(
                    mod(abs(hash(cast({{ seed_column }} as string))), 1000000) as string
                ),
                6,
                '0'
            ),
            '-',
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_seq') as string))),
                        10000
                    ) as string
                ),
                4,
                '0'
            )
        )
    {% elif locale == 'en_US' %}
        concat(
            lpad(
                cast(
                    mod(abs(hash(cast({{ seed_column }} as string))), 1000000) as string
                ),
                6,
                '0'
            ),
            '-',
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_group') as string))),
                        100000
                    ) as string
                ),
                5,
                '0'
            ),
            '-',
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_policy') as string))),
                        10000
                    ) as string
                ),
                4,
                '0'
            )
        )
    {% endif %}
{% endmacro %}
