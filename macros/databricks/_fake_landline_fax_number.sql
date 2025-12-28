{% macro databricks__fake_landline_fax_number(seed_column, locale='en_US') %}
    {% if locale == 'en_US' %}
        concat(
            '(',
            lpad(
                cast(
                    200
                    + mod(abs(hash(cast({{ seed_column }} as string))), 800) as string
                ),
                3,
                '0'
            ),
            ') ',
            lpad(
                cast(
                    200 + mod(
                        abs(hash(cast(concat({{ seed_column }}, '_mid') as string))),
                        800
                    ) as string
                ),
                3,
                '0'
            ),
            '-',
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_end') as string))),
                        10000
                    ) as string
                ),
                4,
                '0'
            )
        )
    {% elif locale == 'pl_PL' %}
        concat(
            '+48 ',
            lpad(
                cast(
                    10 + mod(abs(hash(cast({{ seed_column }} as string))), 90) as string
                ),
                2,
                '0'
            ),
            ' ',
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_mid') as string))),
                        1000
                    ) as string
                ),
                3,
                '0'
            ),
            ' ',
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_end') as string))),
                        1000
                    ) as string
                ),
                3,
                '0'
            ),
            ' ',
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_end2') as string))),
                        100
                    ) as string
                ),
                2,
                '0'
            )
        )
    {% endif %}
{% endmacro %}
